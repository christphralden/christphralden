vim.g.mapleader = " "

local keymap = vim.keymap
local conform_ok, conform = pcall(require, "conform")
local telescope_builtin_ok, telescope_builtin = pcall(require, "telescope.builtin")
local zen_ok, zen = pcall(require, 'zen-mode')
local goto_preview_ok, goto_preview = pcall(require, 'goto-preview')

-- set
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

keymap.set("n", "<leader>nh", "<cmd>nohl<cr>", { desc = "No highlight" })

keymap.set("n", "x", '"_x"', { desc = "Delete without register" })

keymap.set("x", "p", [["_dP]], { desc = "Paste without losing register" })

keymap.set({ "n", "v" }, "d", [["_d]], { desc = "Delete without register" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertical" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontal" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equal windows" })
keymap.set("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close window" })

keymap.set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "New tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Prev tab" })

keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<cr>", { desc = "Toggle maximizer" })

-- netrw
keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Open explorer" })
keymap.set("n", "<leader>r", "<cmd>Rex<cr>", { desc = "Return to explorer" })

-- telescope
keymap.set("n", "<leader>en", function()
  if telescope_builtin_ok then
    telescope_builtin.find_files({ cwd = vim.fn.stdpath("config") })
  end
end, { desc = "Edit neovim config" })
keymap.set("n", "<leader>j", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap.set("n", "<leader>u", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Grep string under cursor" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
keymap.set("n", "<C-o>", "<C-i>", { desc = "Jump forward" })
keymap.set("n", "<C-i>", "<C-o>", { desc = "Jump backward" })

-- motion remaps
keymap.set("n", "e", "l", { desc = "Right" })
keymap.set("v", "e", "l", { desc = "Right" })
keymap.set("n", "w", "h", { desc = "Left" })
keymap.set("v", "w", "h", { desc = "Left" })
keymap.set("n", "l", "w", { desc = "Next word" })
keymap.set("v", "l", "w", { desc = "Next word" })
keymap.set("n", "h", "b", { desc = "Prev word" })
keymap.set("v", "h", "b", { desc = "Prev word" })

keymap.set("v", "H", "^", { desc = "Start of line" })
keymap.set("n", "H", "^", { desc = "Start of line" })
keymap.set("v", "L", "$", { desc = "End of line" })
keymap.set("n", "L", "$", { desc = "End of line" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })
keymap.set("v", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
keymap.set("v", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })

keymap.set("n", ">", ">gv", { desc = "Indent right" })
keymap.set("n", "<", "<gv", { desc = "Indent left" })

keymap.set("n", "<leader>s", "<cmd>wa<cr>", { desc = "Save all" })

keymap.set("n", "<leader>ya", "<cmd>%y<cr>", { desc = "Yank all lines" })

keymap.set("n", "<Down>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
keymap.set("v", "<Up>", "<cmd>m '<-2<cr>gv=gv", { desc = "Move selection up" })
keymap.set("v", "<Down>", "<cmd>m '>+1<cr>gv=gv", { desc = "Move selection down" })
keymap.set("n", "<Up>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
keymap.set("n", "N", "Nzzzv", { desc = "Prev search result centered" })

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })

keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart neovim" })

keymap.set("n", "<leader>Y", [[+Y]], { desc = "Yank to clipboard" })

-- lsp
-- lowercase goto_preview
-- uppercase lsp

keymap.set("n", "gD", function()
  if telescope_builtin_ok then telescope_builtin.lsp_definitions() end
end, { desc = "Go to definition" })

vim.keymap.set("n", "gd", function()
  if goto_preview_ok then goto_preview.goto_preview_definition() end
end, { noremap = true })

keymap.set("n", "gR", function()
  if telescope_builtin_ok then telescope_builtin.lsp_references() end
end, { desc = "Go to references" })

vim.keymap.set("n", "gr", function()
  if goto_preview_ok then goto_preview.goto_preview_references() end
end, { noremap = true })

keymap.set("n", "gI", function()
  if telescope_builtin_ok then telescope_builtin.lsp_implementations() end
end, { desc = "Go to implementations" })

vim.keymap.set("n", "gi", function()
  if goto_preview_ok then goto_preview.goto_preview_implementation() end
end, { noremap = true })

vim.keymap.set("n", "<esc>", function()
  if goto_preview_ok then goto_preview.close_all_win() end
end, { noremap = true })

keymap.set("n", "<leader>f", function()
  if conform_ok then
    conform.format({ async = true, lsp_fallback = true })
  end
end, { desc = "Format buffer" })
keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })


vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Code actions" })

keymap.set("n", "<leader>gs", function()
  if telescope_builtin_ok then telescope_builtin.git_status() end
end, { desc = "Git status" })
-- fugitive
keymap.set("n", "<leader>gg", "<cmd>tabnew | Git | only<cr>", { desc = "Fugitive full page (Git Gud)" })
keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<cr>", { desc = "Git diff split (Git Diff)" })
-- gitsigns
keymap.set("n", "<leader>ga", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
keymap.set("n", "\\", "<cmd>Gitsigns preview_hunk_inline<cr>", { desc = "Preview hunk" }) -- why \ ? bcs its close to next_hunk and prev_hunk below
keymap.set("n", "{", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous hunk" })
keymap.set("n", "}", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next hunk" })
-- grapple
keymap.set("n", "<leader>q", "<cmd>Grapple toggle<cr>", { desc = "Tag file" })
keymap.set("n", "<leader>w", "<cmd>Grapple toggle_tags<cr>", { desc = "Toggle tags" })
keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<cr>", { desc = "Tag 1" })
keymap.set("n", "<leader>2", "<cmd>Grapple select index=2<cr>", { desc = "Tag 2" })
keymap.set("n", "<leader>3", "<cmd>Grapple select index=3<cr>", { desc = "Tag 3" })
keymap.set("n", "<leader>4", "<cmd>Grapple select index=4<cr>", { desc = "Tag 4" })
-- mason
keymap.set("n", "<leader>m", "<cmd>Mason<cr>", { desc = "Open mason" })
-- noice
keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<cr>", { desc = "Dismiss all notifications" })
keymap.set("n", "<leader>np", "<cmd>NoicePick<cr>", { desc = "Dismiss all notifications" })
vim.keymap.set("n", "<leader>x", function()
  if zen_ok then zen.toggle() end
end)
vim.keymap.set("n", "<leader>ci", vim.lsp.buf.incoming_calls, { desc = "Incoming calls" })
vim.keymap.set("n", "<leader>co", vim.lsp.buf.outgoing_calls, { desc = "Outgoing calls" })
-- replacewithregister
vim.keymap.set("n", "r", "<Plug>ReplaceWithRegisterOperator", { noremap = false })
vim.keymap.set("n", "rr", "<Plug>ReplaceWithRegisterLine", { noremap = false })
vim.keymap.set("x", "rw", "<Plug>ReplaceWithRegisterVisual", { noremap = false })
