vim.g.mapleader = " "

local keymap = vim.keymap
local conform_ok, conform = pcall(require, "conform")
local telescope_builtin_ok, telescope_builtin = pcall(require, "telescope.builtin")

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "No highlight" })

keymap.set("n", "x", '"_x"', { desc = "Delete without register" })

keymap.set("x", "p", [["_dP]], { desc = "Paste without losing register" })

keymap.set({ "n", "v" }, "d", [["_d]], { desc = "Delete without register" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertical" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontal" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equal windows" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close window" })

keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Prev tab" })

keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "Toggle maximizer" })

-- netrw
keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "Open explorer" })
keymap.set("n", "<leader>r", ":Rex<CR>", { desc = "Return to explorer" })

-- telescope
keymap.set("n", "<leader>en", function()
  if telescope_builtin_ok then
    telescope_builtin.find_files({ cwd = vim.fn.stdpath("config") })
  end
end, { desc = "Edit neovim config" })
keymap.set("n", "<leader>j", ":Telescope find_files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>u", ":Telescope live_grep<CR>", { desc = "Live grep" })
keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>", { desc = "Grep string under cursor" })
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "List buffers" })
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })
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

keymap.set("n", "<leader>s", ":wa<CR>", { desc = "Save all" })

keymap.set("n", "<leader>ya", ":%y<CR>", { desc = "Yank all lines" })

keymap.set("n", "<Down>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("v", "<Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
keymap.set("v", "<Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("n", "<Up>", ":m .-2<CR>==", { desc = "Move line up" })

keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
keymap.set("n", "N", "Nzzzv", { desc = "Prev search result centered" })

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })

keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart neovim" })

keymap.set("n", "<leader>Y", [[+Y]], { desc = "Yank to clipboard" })

-- lsp
keymap.set("n", "gd", function()
  if telescope_builtin_ok then telescope_builtin.lsp_definitions() end
end, { desc = "Go to definition" })
keymap.set("n", "gr", function()
  if telescope_builtin_ok then telescope_builtin.lsp_references() end
end, { desc = "Go to references" })
keymap.set("n", "gi", function()
  if telescope_builtin_ok then telescope_builtin.lsp_implementations() end
end, { desc = "Go to implementation" })
keymap.set("n", "<leader>f", function()
  if conform_ok then
    conform.format({ async = true, lsp_fallback = true })
  end
end, { desc = "Format buffer" })
keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Code actions" })

keymap.set("n", "<leader>gs", function()
  if telescope_builtin_ok then telescope_builtin.git_status() end
end, { desc = "Git status" })

-- fugitive
keymap.set("n", "<leader>gg", "<cmd>tabnew | Git | only<CR>", { desc = "Fugitive full page (Git Gud)" })
keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", { desc = "Git diff split (Git Diff)" })

-- gitsigns
keymap.set("n", "<leader>ga", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
keymap.set("n", "\\", "<cmd>Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk" }) -- why \ ? bcs its close to next_hunk and prev_hunk below
keymap.set("n", "{", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Previous hunk" })
keymap.set("n", "}", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next hunk" })

-- grapple
keymap.set("n", "<leader>q", "<cmd>Grapple toggle<CR>", { desc = "Tag file" })
keymap.set("n", "<leader>w", "<cmd>Grapple toggle_tags<CR>", { desc = "Toggle tags" })
keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<CR>", { desc = "Tag 1" })
keymap.set("n", "<leader>2", "<cmd>Grapple select index=2<CR>", { desc = "Tag 2" })
keymap.set("n", "<leader>3", "<cmd>Grapple select index=3<CR>", { desc = "Tag 3" })
keymap.set("n", "<leader>4", "<cmd>Grapple select index=4<CR>", { desc = "Tag 4" })


-- mason
keymap.set("n", "<leader>m", "<cmd>Mason<CR>")
