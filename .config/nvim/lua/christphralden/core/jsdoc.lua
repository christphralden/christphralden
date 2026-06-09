local FUNC_NODES = {
  function_declaration = true,
  function_expression = true,
  arrow_function = true,
  method_definition = true,
  generator_function_declaration = true,
}
local PARAM_NODES = {
  identifier = true,
  required_parameter = true,
  optional_parameter = true,
  rest_parameter = true,
  assignment_pattern = true,
}

local function param_entry(node, bufnr)
  if node:type() == "identifier" then return vim.treesitter.get_node_text(node, bufnr) end
  local name, type_str
  for child in node:iter_children() do
    local t = child:type()
    if t == "identifier" and not name then name = vim.treesitter.get_node_text(child, bufnr) end
    if t == "type_annotation" then type_str = vim.treesitter.get_node_text(child, bufnr):gsub("^:%s*", "") end
  end
  if not name then return nil end
  return type_str and ("{" .. type_str .. "} " .. name) or name
end

local function extract_return_type(func_node, bufnr)
  for child in func_node:iter_children() do
    if child:type() == "type_annotation" then
      return vim.treesitter.get_node_text(child, bufnr):gsub("^:%s*", "")
    end
  end
end

local function extract_params(func_node, bufnr)
  local params_node
  for child in func_node:iter_children() do
    if child:type() == "formal_parameters" then
      params_node = child
      break
    end
  end
  if not params_node then return {} end

  local params = {}
  for param in params_node:iter_children() do
    if PARAM_NODES[param:type()] then
      local name = param_entry(param, bufnr)
      if name then table.insert(params, name) end
    end
  end
  return params
end

local function nearest_func(bufnr, row, col)
  local root = vim.treesitter.get_parser(bufnr):parse()[1]:root()
  local node = root:named_descendant_for_range(row, col, row, col)
  while node and not FUNC_NODES[node:type()] do node = node:parent() end
  return node
end

vim.api.nvim_create_user_command("JsDoc", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row, col = cursor[1], cursor[2]
  row = row - 1

  local func_node = nearest_func(bufnr, row, col)
  local params = func_node and extract_params(func_node, bufnr) or {}
  local return_type = func_node and extract_return_type(func_node, bufnr)
  local insert_row = func_node and func_node:range() or row

  local src_line = vim.api.nvim_buf_get_lines(bufnr, insert_row, insert_row + 1, false)[1] or ""
  local indent = src_line:match("^(%s*)") or ""

  local lines = { indent .. "/**", indent .. " * " }
  if #params > 0 then
    table.insert(lines, indent .. " *")
    for _, p in ipairs(params) do table.insert(lines, indent .. " * @param " .. p) end
  end
  table.insert(lines, indent .. " *")
  table.insert(lines, indent .. " * @returns " .. (return_type and ("{" .. return_type .. "} ") or ""))
  table.insert(lines, indent .. " */")

  vim.api.nvim_buf_set_lines(bufnr, insert_row, insert_row, false, lines)
  vim.api.nvim_win_set_cursor(0, { insert_row + 2, #indent + 3 })
  vim.cmd("startinsert!")
end, { desc = "Insert JSDoc template above nearest function" })
