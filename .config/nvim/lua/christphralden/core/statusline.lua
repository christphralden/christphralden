local function git_branch()
  local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  if (handle == nil) then
    return ""
  end
  local branch = handle:read("*a")
  return branch ~= "" and branch or ""
end

local function setup_highlights()
  vim.api.nvim_set_hl(0, "StatuslineBranch", { fg = "#F8FAFC", bg = "#1E293B" })
  vim.api.nvim_set_hl(0, "StatuslineFile", { fg = "#F8FAFC", bg = "#1E293B", bold = true })
  vim.api.nvim_set_hl(0, "StatuslineCWD", { fg = "#D3D3D3", bg = "#1E293B" })
end

local function setup_statusline()
  local statusline = table.concat({
    "%#StatuslineBranch#",
    " " .. git_branch() .. " ",

    "%#StatuslineFile#%=",
    "%m %f ",

    "%=%#StatuslineCWD#",
    " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " ",
  })

  vim.opt.statusline = statusline
end

local function init()
  setup_highlights()
  setup_statusline()
end

init()
