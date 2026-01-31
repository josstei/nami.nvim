--- Public API for the nami colorscheme.
local M = {}

local registry = require("nami.registry")
local config_module = require("nami.config")
local palettes = require("nami.palettes")
local loader = require("nami.loader")

local function notify_failure(action, err)
  vim.notify(string.format("[nami] %s failed: %s", action, err), vim.log.levels.ERROR)
end

--- Configure and initialize nami.
--- @param opts table|nil Configuration options (see README/doc)
function M.setup(opts)
  local ok, err = pcall(function()
    local config = config_module.resolve(opts)

    if not palettes.exists(config.palette) then
      vim.notify(
        string.format("[nami] Unknown palette '%s', falling back to 'nami'", config.palette),
        vim.log.levels.WARN
      )
      config.palette = "nami"
    end

    registry.set_config(config)
    palettes.load_builtin()

    local palette = palettes.load(config.palette)
    if palette then
      registry.set_active_palette(config.palette)
      return
    end

    if config.palette ~= "nami" then
      vim.notify(
        string.format("[nami] Failed to load palette '%s', falling back to 'nami'", config.palette),
        vim.log.levels.WARN
      )
      local fallback = palettes.load("nami")
      if fallback then
        registry.set_active_palette("nami")
      end
    end
  end)

  if not ok then
    notify_failure("setup", err)
  end
end

--- Load the colorscheme (normally called by :colorscheme nami).
function M.load()
  local ok, err = pcall(function()
    local config = registry.get_config()
    if not config then
      M.setup({})
      config = registry.get_config()
      if not config then
        return
      end
    end
    loader.load()
  end)

  if not ok then
    notify_failure("load", err)
  end
end

--- Register a plugin highlight callback.
--- @param name string
--- @param highlight_fn fun(colors: table, config: table): table
function M.register_plugin(name, highlight_fn)
  registry.register_plugin(name, highlight_fn)

  if registry.is_applied() then
    local palette = registry.get_active_palette()
    local config = registry.get_config()
    local colors = {
      palette = palette.palette,
      semantic = palette.semantic,
    }
    local ok, highlights = pcall(highlight_fn, colors, config)
    if ok and highlights then
      loader.apply(highlights)
    end
  end
end

--- Unregister a previously registered plugin callback.
--- @param name string
function M.unregister_plugin(name)
  registry.unregister_plugin(name)
end

--- Switch to a different palette and reload highlights.
--- @param name string
function M.set_palette(name)
  local ok, err = pcall(function()
    if not palettes.exists(name) then
      vim.notify(string.format("[nami] Unknown palette '%s'", name), vim.log.levels.ERROR)
      return
    end

    local palette = palettes.load(name)
    if palette then
      registry.set_active_palette(name)
      loader.load()
    else
      vim.notify(string.format("[nami] Failed to load palette '%s'", name), vim.log.levels.ERROR)
    end
  end)

  if not ok then
    notify_failure("set_palette", err)
  end
end

--- List available palette names.
--- @return string[]
function M.palettes()
  return palettes.list()
end

return M
