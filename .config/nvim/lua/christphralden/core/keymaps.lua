vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>") -- no highlight

keymap.set("n", "x", '"_x"')

-- replaces selected text without losing your buffer 
keymap.set("x", "p", [["_dP]])

-- delete text without saving to register
keymap.set({"n", "v"}, "d", [["_d]])

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

keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- netrw
keymap.set("n", "<leader>e", ":Ex<CR>")
keymap.set("n", "<leader>r", ":Rex<CR>")

-- telescope
keymap.set("n", "<leader>j", ":Telescope find_files<CR>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>u", ":Telescope live_grep<CR>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>") -- list available help tags
keymap.set("n", "<C-o>", "<C-i>")
keymap.set("n", "<C-i>", "<C-o>")

-- fuck off
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
-- keymap.set("i", "l;<leader>", "<C-o>m`<C-o>A;<C-o>``") NEVER USE THIS ANYMORE
-- keymap.set("i", ";<leader>", "<C-o>A;")
-- keymap.set("i", ".<leader>", "<down><end>;<cr>")
-- keymap.set("i", "l.<leader>", "<c-o>m`<down><end>;<c-o>``")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("v", "<C-d>", "<C-d>zz")
keymap.set("v", "<C-u>", "<C-u>zz")

-- indentation
keymap.set("n", ">", ">gv")
keymap.set("n", "<", "<gv")

-- save
keymap.set("n", "<leader>s", ":wa<CR>")

-- utilities
keymap.set("n", "<leader>ya", ":%y<CR>") -- yank all lines in buffer, cursor stays the same

-- move lines up and down
keymap.set("n", "<Down>", ":m .+1<CR>==")
keymap.set("v", "<Up>", ":m '<-2<CR>gv=gv")
keymap.set("v", "<Down>", ":m '>+1<CR>gv=gv")
keymap.set("n", "<Up>", ":m .-2<CR>==")

-- centers search result
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- replace text
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- restart neovim
keymap.set("n", "<leader>re", "<cmd>restart<cr>")

-- to clipboard
keymap.set("n", "<leader>Y", [[+Y]])

-- lsp
keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format Local buffer" })
keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- fugitive
keymap.set("n", "<leader>gg", "<cmd>tabnew | Git | only<CR>", { desc = "Fugitive full page new tab" })
keymap.set("n", "<leader>dd", "<cmd>Gvdiffsplit<CR>", { desc = "Git diff split" })

-- gitsigns
keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunks under cursor" })
keymap.set("n", "<leader>hh", "<cmd>InlineDiff preview_hunk_inline<CR>", { desc = "Stage hunks under cursor" })

-- grapple
vim.keymap.set("n", "<leader>q", "<cmd>Grapple toggle<CR>", { desc = "Tag a file" })
vim.keymap.set("n", "<leader>w", "<cmd>Grapple toggle_tags<CR>", { desc = "Toggle tags menu" })
vim.keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<CR>", { desc = "First tag" })
vim.keymap.set("n", "<leader>2", "<cmd>Grapple select index=2<CR>", { desc = "Second tag" })
vim.keymap.set("n", "<leader>3", "<cmd>Grapple select index=3<CR>", { desc = "Third tag" })
vim.keymap.set("n", "<leader>4", "<cmd>Grapple select index=4<CR>", { desc = "Fourth tag" })
