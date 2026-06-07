local tresitter_ok, treesitter = pcall(require, "nvim-treesitter")
if not tresitter_ok then
  return
end

local utils_ok, utils = pcall(require, "christphralden.core.utils")
if not utils_ok then
  return
end

local ensure_installed = {
  "go",
  "rust",
  "typescript",
  "javascript",
  "tsx",
  "html",
  "css",
  "jsdoc",
  "json",
  "bash",
  "http",
  "dockerfile",
  "lua",
  "luadoc",
  "regex",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
  "diff",
}

treesitter.install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
  group = utils.augroup("treesitter_filetype"),
  -- when we do pattern="*" it runs infinitely for some reason
  pattern = {
    -- treesitter parsers
    "go", "rust", "typescript", "javascript", "typescriptreact", "javascriptreact",
    "html", "css", "scss", "json", "bash", "sh", "dockerfile", "lua", "vim",
    "xml", "yaml", "diff",
    -- lsp servers
    "python", "java", "c", "cpp", "cmake", "astro",
  },
  callback = function(args)
    local buf = args.buf
    if vim.bo[buf].buftype ~= "" then
      return
    end
    if vim.treesitter.highlighter.active[buf] then
      return
    end

    pcall(vim.treesitter.start, buf)
  end,
})
