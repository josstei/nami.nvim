local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local styles = config.styles

  return {
    NamiVariable        = vim.tbl_extend("force", { fg = c.variable }, styles.variables),
    NamiVariableBuiltin = { fg = c.special },
    NamiParameter       = { fg = c.parameter },
    NamiField           = { fg = c.field },
    NamiProperty        = { link = "NamiField" },
    NamiConstant        = { fg = c.constant },

    NamiFunction        = vim.tbl_extend("force", { fg = c.func }, styles.functions),
    NamiMacro           = { fg = c.macro },
    NamiConstructor     = { fg = c.type },

    NamiType            = vim.tbl_extend("force", { fg = c.type }, styles.types),
    NamiAttribute       = { fg = c.attribute },

    NamiKeyword         = vim.tbl_extend("force", { fg = c.keyword }, styles.keywords),
    NamiOperator        = { fg = c.operator },
    NamiPreproc         = { fg = c.preproc },
    NamiInclude         = { fg = c.include },

    NamiString          = vim.tbl_extend("force", { fg = c.string }, styles.strings),
    NamiStringEscape    = { fg = c.escape },
    NamiNumber          = { fg = c.number },
    NamiBoolean         = { fg = c.boolean },
    NamiCharacter       = { fg = c.character },

    NamiDelimiter       = { fg = c.delimiter },
    NamiSpecial         = { fg = c.special },
    NamiTag             = { fg = c.tag },

    NamiComment         = vim.tbl_extend("force", { fg = c.comment }, styles.comments),
    NamiTodo            = { fg = c.info, bold = true },

    NamiError           = { fg = c.error },
    NamiWarning         = { fg = c.warning },
    NamiInfo            = { fg = c.info },
    NamiHint            = { fg = c.hint },

    NamiAdded           = { fg = c.git_add },
    NamiChanged         = { fg = c.git_change },
    NamiRemoved         = { fg = c.git_delete },

    NamiMarkupHeading   = { fg = c.func, bold = true },
    NamiMarkupBold      = { bold = true },
    NamiMarkupItalic    = { italic = true },
    NamiMarkupLink      = { fg = c.info, underline = true },
    NamiMarkupCode      = { fg = c.string },
    NamiMarkupList      = { fg = c.special },
  }
end

return M
