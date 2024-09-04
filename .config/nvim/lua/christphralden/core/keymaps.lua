vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x"')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>sv", "<C-w>v") --split vertical
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontal
keymap.set("n", "<leader>se", "<C-w>=") -- equal window
keymap.set("n", "<leader>sx", ":close<CR>") -- close

keymap.set("n", "<leader>to", ":tabnew<CR>") -- newtab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- closetab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- nexttab
keymap.set("n", "<leader>tp", ":tabp<CR>") --prevtab

-- plugin keymaps
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>j", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>u", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<C-o>", "<C-i>")
keymap.set("n", "<C-i>", "<C-o>")

-- transparent
keymap.set("n", "<leader>t", ":TransparentToggle<CR>")

-- my bindings
keymap.set("n", "<leader>cp", ":w<CR>:!clang++ %:p -o %:p:r && %:p:r<CR>", { noremap = true, silent = true })
keymap.set("n", "e", "l") -- shit is just too goofy
keymap.set("v", "e", "l") -- shit is just too goofy
keymap.set("n", "w", "h")
keymap.set("v", "w", "h")
keymap.set("n", "l", "w")
keymap.set("v", "l", "w")
keymap.set("n", "h", "b")
keymap.set("v", "h", "b")
keymap.set("v", "H", "^")
keymap.set("n", "H", "^")
keymap.set("v", "L", "$")
keymap.set("n", "L", "$")
keymap.set("i", "l;<leader>", "<C-o>m`<C-o>A;<C-o>``")
keymap.set("i", ";<leader>", "<C-o>A;")
keymap.set("i", ".<leader>", "<down><end>;<cr>")
keymap.set("i", "l.<leader>", "<c-o>m`<down><end>;<c-o>``")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("v", "<C-d>", "<C-d>zz")
keymap.set("v", "<C-u>", "<C-u>zz")

-- indentation
keymap.set("n", ">", ">>")
keymap.set("n", "<", "<<")

-- save
keymap.set("n", "<leader>s", ":wa<CR>")
