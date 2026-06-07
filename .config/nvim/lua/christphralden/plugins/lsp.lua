local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

local utils_ok, utils = pcall(require, "christphralden.core.utils")
if not utils_ok then
  return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  return
end

local mason_tool_installer_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
if not mason_tool_installer_ok then
  return
end

local cmp_lsp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")

local goto_preview_ok, _ = pcall(require, 'goto-preview')

mason.setup()

mason_tool_installer.setup({
  ensure_installed = {
    "prettier",
  },
})

-- load in capabilities for completion from cmp
local capabilities = cmp_lsp_ok and cmp_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("*", {
  capabilities = capabilities,
  handlers = {
    ["textDocument/hover"] = function(err, result, ctx, config)
      -- hover window
      vim.lsp.handlers.hover(err, result, ctx, vim.tbl_extend("keep", config or {}, { max_width = 80, max_height = 20 }))
    end,
  },
})

-- diagnostics
vim.diagnostic.config({
  -- info text on the side
  virtual_text = {
    prefix = "",
    source = "if_many",
  },
  signs = {
    -- custom icons for sev level
    text = {
      [vim.diagnostic.severity.ERROR] = "⦸",
      [vim.diagnostic.severity.WARN] = "⚠︎",
      [vim.diagnostic.severity.HINT] = "！",
      [vim.diagnostic.severity.INFO] = "●",
    },
    -- highlight line if error
    linehl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    },
    -- highlight number if error
    numhl = {
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    }
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = true },
})

-- floating borders rounded
vim.o.winborder = "rounded"

-- telescope code actions
vim.ui.input = function(opts, on_confirm)
  local buf = vim.api.nvim_create_buf(false, true)
  local default = opts.default or ""
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { default })

  local width = math.max(40, #(opts.prompt or "") + 10)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "cursor",
    row = 1,
    col = 0,
    width = width,
    height = 1,
    style = "minimal",
    border = "rounded",
    title = " " .. (opts.prompt or "Input") .. " ",
    title_pos = "center",
  })

  vim.api.nvim_win_set_option(win, "winhl", "Normal:Normal")
  vim.cmd("startinsert!")
  vim.api.nvim_buf_set_keymap(buf, "i", "<CR>", "", {
    noremap = true,
    callback = function()
      local value = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
      vim.api.nvim_win_close(win, true)
      vim.cmd("stopinsert")
      on_confirm(value ~= "" and value or nil)
    end,
  })
  vim.api.nvim_buf_set_keymap(buf, "i", "<Esc>", "", {
    noremap = true,
    callback = function()
      vim.api.nvim_win_close(win, true)
      vim.cmd("stopinsert")
      on_confirm(nil)
    end,
  })
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = utils.augroup("lsp_attach"),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
    end

    -- unmapping defaults -- goto enabled
    if goto_preview_ok then
      pcall(vim.keymap.del, 'n', 'gra', { buf = ev.buf }) -- vim.lsp.buf.code_action() mapped to <leader>ca
      pcall(vim.keymap.del, 'n', 'grn', { buf = ev.buf }) -- vim.lsp.buf.rename() mapped to <leader>rn
      -- gri is the only one useful here mapped to gi
      pcall(vim.keymap.del, 'n', 'gri', { buf = ev.buf }) -- vim.lsp.buf.implementation() not really useful mapped to gr by goto_preview
      pcall(vim.keymap.del, 'n', 'grr', { buf = ev.buf }) -- vim.lsp.buf.references() not really useful mapped to gr by goto_preview
      pcall(vim.keymap.del, 'n', 'grt', { buf = ev.buf }) -- vim.lsp.buf.type_definition() not really useful
      pcall(vim.keymap.del, 'n', 'grx', { buf = ev.buf }) -- vim.lsp.codelens.run() not really useful
      pcall(vim.keymap.del, 'n', 'gO', { buf = ev.buf })  -- vim.lsp.codelens.run() not really useful bloat qf list
    end
  end,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

local ts_inlay_hints = {
  -- "none" | "literals" (only for hardcoded values) | "all"
  includeInlayParameterNameHints = "literals",
  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  includeInlayFunctionParameterTypeHints = false,
  includeInlayVariableTypeHints = false,
  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
  includeInlayPropertyDeclarationTypeHints = false,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayEnumMemberValueHints = true,
}

vim.lsp.config("ts_ls", {
  settings = {
    typescript = { inlayHints = ts_inlay_hints },
    javascript = { inlayHints = ts_inlay_hints },
  },
})

-- if instalation fails, check .npmrc minReleaseAge
mason_lspconfig.setup({
  ensure_installed = {
    "clangd",
    "cmake",
    "cssmodules_ls",
    "jsonls",
    "jdtls",
    "pyright",
    -- "intelephense",
    "gopls",
    "ts_ls",
    "eslint",
    "html",
    "cssls",
    "lua_ls",
    "emmet_ls",
    "astro",
  },
  automatic_installation = true,
})
