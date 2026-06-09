local lackluster_ok, lackluster = pcall(require, 'lackluster')
if not lackluster_ok then
  return
end

local function lackluster_tokyo()
  return {
    red = "#aa6666",
    black = "#424242",
    gray1 = "#575757",
    gray2 = "#6a6a6a",
    gray3 = "#7a7a7a",
    gray4 = "#8e8e8e",
    gray5 = "#bebebe",
    gray6 = "#d8d8d8",
    gray7 = "#ececec",
    gray8 = "#ececec",
    gray9 = "#ececec",
  }
end

local tokyo = lackluster_tokyo()

lackluster.setup({
  tweak_colors = {
    black = tokyo.black,
    gray1 = tokyo.gray1,
    gray2 = tokyo.gray2,
    gray3 = tokyo.gray3,
    gray4 = tokyo.gray4,
    gray5 = tokyo.gray5,
    gray6 = tokyo.gray6,
    gray7 = tokyo.gray7,
    gray8 = tokyo.gray8,
    gray9 = tokyo.gray9,
  },
  tweak_syntax = {
    comment = tokyo.black,
    builtin = tokyo.gray1,
    keyword = tokyo.gray2,
    keyword_return = tokyo.gray3
  },
  tweak_highlight = {
    ["@type"] = {
      overwrite = true,
      fg = tokyo.red
    },
    ["@type.builtin"] = {
      overwrite = true,
      fg = tokyo.red
    },
    ["@variable"] = {
      overwrite = true,
      fg = tokyo.gray5
    },
    ["@variable.member"] = {
      overwrite = true,
      fg = tokyo.gray5
    },
    ["@variable.parameter"] = {
      overwrite = true,
      fg = tokyo.gray5
    },
    ["@tag"] = {
      overwrite = true,
      fg = tokyo.gray5
    },
    ["@tag.delimiter"] = {
      overwrite = true,
      fg = tokyo.gray1
    },
    ["@tag.builtin"] = {
      overwrite = true,
      fg = tokyo.gray5
    },
    ["@tag.attribute"] = {
      overwrite = true,
      fg = tokyo.gray3
    },
    ["@operator.tsx"] = {
      overwrite = true,
      fg = tokyo.gray1
    },
    ["@punctuation.bracket.tsx"] = {
      overwrite = true,
      fg = tokyo.gray1
    },
    ["@lsp.type.property"] = {
      overwrite = true,
      fg = tokyo.gray3
    },
    ["@property"] = {
      overwrite = true,
      fg = tokyo.gray3
    },
    ["@function"] = {
      overwrite = true,
      fg = tokyo.gray5,
    },
    ["@function.call"] = {
      overwrite = true,
      fg = tokyo.gray5
    },
    ["@function.method"] = {
      overwrite = true,
      fg = tokyo.gray5
    },
    ["@function.method.call"] = {
      overwrite = true,
      fg = tokyo.gray5
    },
    ["TelescopeBorder"] = {
      fg = tokyo.black
    },
    ["TelescopeSelection"] = {
      fg = tokyo.gray5,
      bg = 'none'
    },
  },
  tweak_background = {
    normal = 'none', -- main background
    -- normal = 'none',    -- transparent
    -- normal = '#a1b2c3',    -- hexcode
    -- normal = color.green,    -- lackluster color
    telescope = 'none', -- telescope
    menu = 'none',      -- nvim_cmp, wildmenu ... (bad idea to transparent)
    popup = 'none',     -- lazy, mason, whichkey ... (bad idea to transparent)
  },
  tweak_ui = {
    disable_undercurl = true

  }
})
pcall(vim.cmd, "colorscheme lackluster-dark")
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { link = 'DiagnosticSignInfo' })
