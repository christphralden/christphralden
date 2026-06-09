local utils_ok, utils = pcall(require, "christphralden.core.utils")
if not utils_ok then
  return
end

-- thankyou folke

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = utils.augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].nvim_last_loc then
      return
    end
    vim.b[buf].nvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})


-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = utils.augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- yank highlight
vim.api.nvim_create_autocmd('TextYankPost', {
  group = utils.augroup("yank_highlight"),
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 })
  end,
})

-- close on q
vim.api.nvim_create_autocmd('FileType', {
  group = utils.augroup('close_q'),
  pattern = { 'qf', 'help', 'man', 'lspinfo', 'notify' },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})


-- do text wrapping on readable file types
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = utils.augroup("wrap_filetypes"),
  pattern = { "text", "markdown", "gitcommit" },
  callback = function()
    vim.opt.wrap = true
  end,
})


-- format
vim.api.nvim_create_autocmd("BufEnter", {
  group = utils.augroup("format_options"),
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})
