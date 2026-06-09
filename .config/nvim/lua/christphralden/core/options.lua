local opt = vim.opt

-- line
opt.relativenumber = true
opt.number = true

--statusline
opt.laststatus = 3 -- combine statusline across tabs

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrap
opt.wrap = false

-- search setting
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")
opt.isfname:append("@-@")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- search
opt.hlsearch = false -- no highlights
opt.incsearch = true

opt.iskeyword:append("-")

-- netrw

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 1

-- transparent
vim.cmd([[
    highlight Normal guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
    highlight SignColumn guibg=NONE ctermbg=NONE
    highlight EndOfBuffer guibg=NONE ctermbg=NONE
    highlight TabLine guibg=NONE ctermbg=NONE
    highlight TabLineFill guibg=NONE ctermbg=NONE
    highlight TabLineSel guibg=NONE ctermbg=NONE
    highlight StatusLine guibg=NONE ctermbg=NONE
    highlight StatusLineNC guibg=NONE ctermbg=NONE
    highlight LualineNormal guibg=NONE ctermbg=NONE
    highlight LualineInsert guibg=NONE ctermbg=NONE
    highlight LualineVisual guibg=NONE ctermbg=NONE
    highlight LualineReplace guibg=NONE ctermbg=NONE
    highlight LualineCommand guibg=NONE ctermbg=NONE
    highlight LualineInactive guibg=NONE ctermbg=NONE
]])

vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wqa", "wqa", {})
vim.api.nvim_create_user_command("WQa", "wqa", {})
vim.api.nvim_create_user_command("WQA", "wqa", {})
vim.api.nvim_create_user_command("Wa", "wa", {})
vim.api.nvim_create_user_command("WA", "wa", {})

opt.inccommand = "split"

-- you ever get the fucking swap file notif when claude is cooking? fuck you
opt.swapfile = false
opt.backup = false

-- presistent undodir
vim.opt.undodir = vim.fn.stdpath('data') .. "/undodir"

-- minimize cmd when not in use
-- vim.o.cmdheight = 0

-- 8 scroll padding
opt.scrolloff = 8

opt.shortmess:append("I")
vim.opt.fillchars = {
  eob = " "
}

-----
