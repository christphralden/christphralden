local ok, alpha = pcall(require, "alpha")
if not ok then return end

local utils = require("christphralden.core.utils")
local art = utils.startup_kanji()

alpha.setup({
  layout = {
    {
      type = "padding",
      val = function()
        return math.floor((vim.fn.winheight(0) - #art) / 2)
      end,
    },
    {
      type = "text",
      val = art,
      opts = { position = "center", hl = "ALStartupArt" },
    },
  },
  opts = {},
})
