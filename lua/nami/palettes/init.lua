local M = {}

local registry = require("nami.registry")

local builtin = {
  "nami",
}

local required_palette_keys = {
  "bg",
  "bg_alt",
  "bg_float",
  "bg_dark",
  "bg_highlight",
  "cursorline",
  "fg",
  "fg_dim",
  "fg_dark",
  "coral",
  "coral_dark",
  "teal",
  "teal_dark",
  "teal_darker",
  "cyan",
  "orange",
  "yellow",
  "blue",
  "blue_dark",
  "purple",
  "purple_dark",
  "none",
}

local required_semantic_keys = {
  "attribute",
  "boolean",
  "border",
  "comment",
  "constant",
  "cursor",
  "cursor_line",
  "delimiter",
  "diff_add",
  "diff_change",
  "diff_delete",
  "diff_text",
  "error",
  "fg",
  "field",
  "func",
  "git_add",
  "git_change",
  "git_delete",
  "hint",
  "include",
  "info",
  "keyword",
  "line_nr",
  "line_nr_cur",
  "macro",
  "match",
  "number",
  "operator",
  "parameter",
  "pmenu",
  "pmenu_sel",
  "pmenu_thumb",
  "preproc",
  "property",
  "search",
  "selection",
  "special",
  "statusline",
  "statusline_fg",
  "string",
  "tag",
  "type",
  "variable",
  "visual",
  "warning",
}

local function missing_keys(tbl, keys)
  local missing = {}
  for _, key in ipairs(keys) do
    if type(tbl[key]) ~= "string" then
      table.insert(missing, key)
    end
  end
  return missing
end

local function validate_palette(name, palette)
  if type(palette) ~= "table" then
    vim.notify(string.format("[nami] Palette '%s' must return a table", name), vim.log.levels.ERROR)
    return false
  end
  if type(palette.palette) ~= "table" then
    vim.notify(string.format("[nami] Palette '%s' is missing a palette table", name), vim.log.levels.ERROR)
    return false
  end
  if type(palette.semantic) ~= "table" then
    vim.notify(string.format("[nami] Palette '%s' is missing a semantic table", name), vim.log.levels.ERROR)
    return false
  end

  local missing_palette = missing_keys(palette.palette, required_palette_keys)
  local missing_semantic = missing_keys(palette.semantic, required_semantic_keys)

  if #missing_palette > 0 or #missing_semantic > 0 then
    local parts = {}
    if #missing_palette > 0 then
      table.insert(parts, "palette keys: " .. table.concat(missing_palette, ", "))
    end
    if #missing_semantic > 0 then
      table.insert(parts, "semantic keys: " .. table.concat(missing_semantic, ", "))
    end
    vim.notify(
      string.format("[nami] Palette '%s' is missing required %s", name, table.concat(parts, "; ")),
      vim.log.levels.ERROR
    )
    return false
  end

  return true
end

function M.load_builtin()
  for _, name in ipairs(builtin) do
    local ok, palette = pcall(require, "nami.palettes." .. name)
    if ok and validate_palette(name, palette) then
      registry.register_palette(name, palette)
    end
  end
end

function M.load(name)
  local palette = registry.get_palette(name)
  if palette then
    if validate_palette(name, palette) then
      return palette
    end
    return nil
  end

  local ok, loaded = pcall(require, "nami.palettes." .. name)
  if ok and validate_palette(name, loaded) then
    registry.register_palette(name, loaded)
    return loaded
  end

  return nil
end

function M.exists(name)
  if registry.palette_exists(name) then
    return validate_palette(name, registry.get_palette(name))
  end

  local ok, loaded = pcall(require, "nami.palettes." .. name)
  return ok and validate_palette(name, loaded)
end

function M.list()
  return builtin
end

return M
