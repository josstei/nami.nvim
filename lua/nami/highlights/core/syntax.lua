local M = {}

function M.setup(colors, config)
  return {
    Comment        = { link = "NamiComment" },

    Constant       = { link = "NamiConstant" },
    String         = { link = "NamiString" },
    Character      = { link = "NamiCharacter" },
    Number         = { link = "NamiNumber" },
    Boolean        = { link = "NamiBoolean" },
    Float          = { link = "NamiNumber" },

    Identifier     = { link = "NamiVariable" },
    Function       = { link = "NamiFunction" },

    Statement      = { link = "NamiKeyword" },
    Conditional    = { link = "NamiKeyword" },
    Repeat         = { link = "NamiKeyword" },
    Label          = { link = "NamiSpecial" },
    Operator       = { link = "NamiOperator" },
    Keyword        = { link = "NamiKeyword" },
    Exception      = { link = "NamiKeyword" },

    PreProc        = { link = "NamiPreproc" },
    Include        = { link = "NamiInclude" },
    Define         = { link = "NamiPreproc" },
    Macro          = { link = "NamiMacro" },
    PreCondit      = { link = "NamiPreproc" },

    Type           = { link = "NamiType" },
    StorageClass   = { link = "NamiKeyword" },
    Structure      = { link = "NamiType" },
    Typedef        = { link = "NamiType" },

    Special        = { link = "NamiSpecial" },
    SpecialChar    = { link = "NamiSpecial" },
    Tag            = { link = "NamiTag" },
    Delimiter      = { link = "NamiDelimiter" },
    SpecialComment = { link = "NamiComment" },
    Debug          = { link = "NamiSpecial" },

    Underlined     = { underline = true },
    Ignore         = { link = "NamiComment" },
    Error          = { link = "NamiError" },
    Todo           = { link = "NamiTodo" },

    Added          = { link = "NamiAdded" },
    Changed        = { link = "NamiChanged" },
    Removed        = { link = "NamiRemoved" },
  }
end

return M
