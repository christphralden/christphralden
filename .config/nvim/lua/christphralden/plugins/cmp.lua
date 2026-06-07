local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "buffer" } },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "path" },
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
  },
})

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  window = {
    completion = {
      border = "rounded",
    },
    documentation = {
      border = "rounded"
    }
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-j>"] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_prev_item() else fallback() end
    end, { "i", "s" }),
    ["<C-k>"] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item() else fallback() end
    end, { "i", "s" }),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp", max_item_count = 10 },
    { name = "luasnip",  max_item_count = 3 },
    { name = "buffer",   max_item_count = 3 },
    { name = "path",     max_item_count = 3 },
  }),
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
})
