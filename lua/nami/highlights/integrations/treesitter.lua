local M = {}

function M.setup(colors, config)
  return {
    ["@variable"]                    = { link = "NamiVariable" },
    ["@variable.builtin"]            = { link = "NamiVariableBuiltin" },
    ["@variable.parameter"]          = { link = "NamiParameter" },
    ["@variable.member"]             = { link = "NamiField" },

    ["@constant"]                    = { link = "NamiConstant" },
    ["@constant.builtin"]            = { link = "NamiConstant" },
    ["@constant.macro"]              = { link = "NamiMacro" },

    ["@module"]                      = { link = "NamiType" },
    ["@label"]                       = { link = "NamiSpecial" },

    ["@string"]                      = { link = "NamiString" },
    ["@string.documentation"]        = { link = "NamiComment" },
    ["@string.regexp"]               = { link = "NamiSpecial" },
    ["@string.escape"]               = { link = "NamiStringEscape" },
    ["@string.special"]              = { link = "NamiSpecial" },
    ["@string.special.symbol"]       = { link = "NamiConstant" },
    ["@string.special.url"]          = { link = "NamiMarkupLink" },

    ["@character"]                   = { link = "NamiCharacter" },
    ["@character.special"]           = { link = "NamiStringEscape" },

    ["@number"]                      = { link = "NamiNumber" },
    ["@number.float"]                = { link = "NamiNumber" },
    ["@boolean"]                     = { link = "NamiBoolean" },

    ["@type"]                        = { link = "NamiType" },
    ["@type.builtin"]                = { link = "NamiType" },
    ["@type.definition"]             = { link = "NamiType" },
    ["@type.qualifier"]              = { link = "NamiKeyword" },

    ["@attribute"]                   = { link = "NamiAttribute" },
    ["@property"]                    = { link = "NamiProperty" },

    ["@function"]                    = { link = "NamiFunction" },
    ["@function.builtin"]            = { link = "NamiFunction" },
    ["@function.call"]               = { link = "NamiFunction" },
    ["@function.macro"]              = { link = "NamiMacro" },
    ["@function.method"]             = { link = "NamiFunction" },
    ["@function.method.call"]        = { link = "NamiFunction" },

    ["@constructor"]                 = { link = "NamiConstructor" },

    ["@operator"]                    = { link = "NamiOperator" },

    ["@keyword"]                     = { link = "NamiKeyword" },
    ["@keyword.coroutine"]           = { link = "NamiKeyword" },
    ["@keyword.function"]            = { link = "NamiKeyword" },
    ["@keyword.operator"]            = { link = "NamiOperator" },
    ["@keyword.import"]              = { link = "NamiInclude" },
    ["@keyword.storage"]             = { link = "NamiKeyword" },
    ["@keyword.repeat"]              = { link = "NamiKeyword" },
    ["@keyword.return"]              = { link = "NamiKeyword" },
    ["@keyword.debug"]               = { link = "NamiSpecial" },
    ["@keyword.exception"]           = { link = "NamiKeyword" },
    ["@keyword.conditional"]         = { link = "NamiKeyword" },
    ["@keyword.conditional.ternary"] = { link = "NamiOperator" },
    ["@keyword.modifier"]            = { link = "NamiKeyword" },
    ["@keyword.type"]                = { link = "NamiKeyword" },
    ["@keyword.directive"]           = { link = "NamiPreproc" },
    ["@keyword.directive.define"]    = { link = "NamiPreproc" },

    ["@punctuation.delimiter"]       = { link = "NamiDelimiter" },
    ["@punctuation.bracket"]         = { link = "NamiDelimiter" },
    ["@punctuation.special"]         = { link = "NamiSpecial" },

    ["@comment"]                     = { link = "NamiComment" },
    ["@comment.documentation"]       = { link = "NamiComment" },
    ["@comment.error"]               = { link = "NamiError" },
    ["@comment.warning"]             = { link = "NamiWarning" },
    ["@comment.todo"]                = { link = "NamiTodo" },
    ["@comment.note"]                = { link = "NamiHint" },

    ["@markup.strong"]               = { link = "NamiMarkupBold" },
    ["@markup.italic"]               = { link = "NamiMarkupItalic" },
    ["@markup.strikethrough"]        = { strikethrough = true },
    ["@markup.underline"]            = { underline = true },
    ["@markup.heading"]              = { link = "NamiMarkupHeading" },
    ["@markup.quote"]                = { link = "NamiComment" },
    ["@markup.math"]                 = { link = "NamiNumber" },
    ["@markup.link"]                 = { link = "NamiMarkupLink" },
    ["@markup.link.label"]           = { link = "NamiMarkupLink" },
    ["@markup.link.url"]             = { link = "NamiMarkupLink" },
    ["@markup.raw"]                  = { link = "NamiMarkupCode" },
    ["@markup.raw.block"]            = { link = "NamiMarkupCode" },
    ["@markup.list"]                 = { link = "NamiMarkupList" },
    ["@markup.list.checked"]         = { link = "NamiAdded" },
    ["@markup.list.unchecked"]       = { link = "NamiComment" },

    ["@diff.plus"]                   = { link = "NamiAdded" },
    ["@diff.minus"]                  = { link = "NamiRemoved" },
    ["@diff.delta"]                  = { link = "NamiChanged" },

    ["@tag"]                         = { link = "NamiTag" },
    ["@tag.attribute"]               = { link = "NamiAttribute" },
    ["@tag.delimiter"]               = { link = "NamiDelimiter" },
  }
end

return M
