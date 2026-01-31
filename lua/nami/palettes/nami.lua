local M = {}

M.name = "nami"

M.palette = {
  bg           = "#041220",
  bg_alt       = "#081a2d",
  bg_float     = "#061828",
  bg_dark      = "#020c16",
  bg_highlight = "#0e2840",
  cursorline   = "#081e35",

  fg           = "#e8dcc8",
  fg_alt       = "#c8d8e8",
  fg_dim       = "#a8b8c8",
  fg_dark      = "#5a7a8a",

  teal         = "#4fc9c9",
  teal_dark    = "#3a9ba8",
  teal_darker  = "#2a7a87",
  cyan         = "#5dd9d9",

  coral        = "#ff7356",
  coral_dark   = "#ff5533",

  orange       = "#ff9933",
  yellow       = "#ffcc55",

  blue         = "#7a9aca",
  blue_dark    = "#5a7aaa",

  purple       = "#bb6b8b",
  purple_dark  = "#8a5a9a",

  green        = "#5faf7f",
  green_dark   = "#4a8a6a",

  error        = "#ff5555",
  warning      = "#ff9933",
  info         = "#4fc9c9",
  hint         = "#a8b8c8",

  git_add      = "#5faf7f",
  git_change   = "#ff9933",
  git_delete   = "#ff5555",

  diff_add     = "#1a3a2a",
  diff_change  = "#2a3a1a",
  diff_delete  = "#3a1a1a",
  diff_text    = "#3a4a2a",

  none         = "NONE",
}

M.semantic = {
  bg           = M.palette.bg,
  fg           = M.palette.fg,

  border       = M.palette.fg_dark,
  selection    = M.palette.bg_highlight,
  visual       = M.palette.bg_highlight,
  cursor       = M.palette.coral,
  cursor_line  = M.palette.cursorline,
  line_nr      = M.palette.fg_dark,
  line_nr_cur  = M.palette.coral,

  statusline   = M.palette.bg_alt,
  statusline_fg = M.palette.fg_dim,

  pmenu        = M.palette.bg_alt,
  pmenu_sel    = M.palette.bg_highlight,
  pmenu_thumb  = M.palette.fg_dark,

  search       = M.palette.yellow,
  search_bg    = M.palette.bg_highlight,
  match        = M.palette.coral,

  keyword      = M.palette.coral,
  string       = M.palette.teal,
  number       = M.palette.orange,
  boolean      = M.palette.green,
  constant     = M.palette.orange,
  func         = M.palette.yellow,
  type         = M.palette.blue,
  variable     = M.palette.fg,
  parameter    = M.palette.cyan,
  field        = M.palette.fg_alt,
  property     = M.palette.blue_dark,
  comment      = M.palette.fg_dark,
  operator     = M.palette.coral_dark,
  delimiter    = M.palette.fg_dim,
  special      = M.palette.purple,
  character    = M.palette.coral,
  escape       = M.palette.yellow,
  preproc      = M.palette.coral,
  include      = M.palette.coral,
  macro        = M.palette.purple,
  tag          = M.palette.coral,
  attribute    = M.palette.yellow,

  error        = M.palette.error,
  warning      = M.palette.warning,
  info         = M.palette.info,
  hint         = M.palette.hint,

  git_add      = M.palette.git_add,
  git_change   = M.palette.git_change,
  git_delete   = M.palette.git_delete,

  diff_add     = M.palette.diff_add,
  diff_change  = M.palette.diff_change,
  diff_delete  = M.palette.diff_delete,
  diff_text    = M.palette.diff_text,
}

return M
