# Nami.nvim

A beautiful Neovim colorscheme inspired by ocean waves at sunset. Deep blue-black backgrounds meet vibrant teal, coral, and sunset orange for a visually stunning coding experience.

## Features

- **Ocean-Sunset Palette**: Deep ocean blues with warm sunset accents
- **Full TreeSitter Support**: Modern syntax highlighting that just works
- **LSP Integration**: Beautiful diagnostics and semantic highlighting
- **Plugin Support**: Telescope, nvim-tree, GitSigns, nvim-cmp, and more
- **Customizable**: Transparency, inactive window dimming, and style preferences
- **Extensible**: Add your own plugin highlights at runtime

## Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
| Background | `#041220` | Editor background |
| Foreground | `#e8dcc8` | Main text |
| Teal | `#4fc9c9` | Strings |
| Coral | `#ff7356` | Keywords |
| Orange | `#ff9933` | Numbers, constants |
| Yellow | `#ffcc55` | Functions |
| Blue | `#7a9aca` | Types |
| Green | `#5faf7f` | Booleans |
| Purple | `#bb6b8b` | Special elements |
| Cyan | `#5dd9d9` | Parameters |

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "josstei/nami.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nami").setup()
    vim.cmd([[colorscheme nami]])
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "josstei/nami.nvim",
  config = function()
    require("nami").setup()
    vim.cmd([[colorscheme nami]])
  end
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'josstei/nami.nvim'
```

Then in your config:
```vim
colorscheme nami
```

## Configuration

```lua
require("nami").setup({
  -- Enable transparent background
  transparent = false,

  -- Dim inactive windows
  dim_inactive = false,

  -- Customize syntax styles
  styles = {
    comments = { italic = true },
    keywords = { bold = false },
    functions = { bold = false },
    variables = {},
    types = {},
    strings = {},
  },

  -- Custom highlight overrides
  on_highlights = function(colors, config)
    return {
      -- Example: Make TODO comments stand out
      ["@comment.todo"] = { fg = colors.palette.orange, bold = true },
    }
  end,
})
```

### Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `transparent` | boolean | `false` | Transparent background |
| `dim_inactive` | boolean | `false` | Dim inactive windows |
| `styles.comments` | table | `{ italic = true }` | Comment style |
| `styles.keywords` | table | `{ bold = false }` | Keyword style |
| `styles.functions` | table | `{ bold = false }` | Function style |
| `styles.variables` | table | `{}` | Variable style |
| `styles.types` | table | `{}` | Type style |
| `styles.strings` | table | `{}` | String style |
| `on_highlights` | function | `nil` | Custom highlight overrides |

### Style Options

Styles can include: `bold`, `italic`, `underline`, `undercurl`, `strikethrough`

```lua
styles = {
  comments = { italic = true },
  keywords = { bold = true, italic = true },
}
```

## Plugin Support

Built-in support for:

- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [GitSigns](https://github.com/lewis6991/gitsigns.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Built-in LSP diagnostics

### Adding Custom Plugin Support

```lua
require("nami").register_plugin("noice", function(colors, config)
  return {
    NoiceCmdlinePopup = { bg = colors.palette.bg_alt },
    NoiceCmdlinePopupBorder = { fg = colors.semantic.border },
  }
end)
```

## API

### `require("nami").setup(opts)`

Configure nami. Call before `:colorscheme nami`.

### `require("nami").load()`

Load the colorscheme. Called automatically by `:colorscheme nami`.

### `require("nami").register_plugin(name, fn)`

Add custom plugin highlights at runtime.

### `require("nami").unregister_plugin(name)`

Remove a registered plugin.

### `require("nami").set_palette(name)`

Switch palettes at runtime.

### `require("nami").palettes()`

List available palettes.

## Custom Palettes

Create a palette at `lua/nami/palettes/<name>.lua`:

```lua
return {
  name = "my_palette",
  palette = {
    bg = "#041220",
    bg_alt = "#081a2d",
    bg_float = "#061828",
    bg_dark = "#020c16",
    bg_highlight = "#0e2840",
    cursorline = "#081e35",
    fg = "#e8dcc8",
    fg_alt = "#c8d8e8",
    fg_dim = "#a8b8c8",
    fg_dark = "#5a7a8a",
    teal = "#4fc9c9",
    teal_dark = "#3a9ba8",
    teal_darker = "#2a7a87",
    cyan = "#5dd9d9",
    coral = "#ff7356",
    coral_dark = "#ff5533",
    orange = "#ff9933",
    yellow = "#ffcc55",
    blue = "#7a9aca",
    blue_dark = "#5a7aaa",
    purple = "#bb6b8b",
    purple_dark = "#8a5a9a",
    green = "#5faf7f",
    green_dark = "#4a8a6a",
    error = "#ff5555",
    warning = "#ff9933",
    info = "#4fc9c9",
    hint = "#a8b8c8",
    git_add = "#5faf7f",
    git_change = "#ff9933",
    git_delete = "#ff5555",
    diff_add = "#1a3a2a",
    diff_change = "#2a3a1a",
    diff_delete = "#3a1a1a",
    diff_text = "#3a4a2a",
    none = "NONE",
  },
  semantic = {
    bg = "#041220",
    fg = "#e8dcc8",
    border = "#5a7a8a",
    selection = "#0e2840",
    visual = "#0e2840",
    cursor = "#ff7356",
    cursor_line = "#081e35",
    line_nr = "#5a7a8a",
    line_nr_cur = "#ff7356",
    statusline = "#081a2d",
    statusline_fg = "#a8b8c8",
    pmenu = "#081a2d",
    pmenu_sel = "#0e2840",
    pmenu_thumb = "#5a7a8a",
    search = "#ffcc55",
    search_bg = "#0e2840",
    match = "#ff7356",
    keyword = "#ff7356",
    string = "#4fc9c9",
    number = "#ff9933",
    boolean = "#5faf7f",
    constant = "#ff9933",
    func = "#ffcc55",
    type = "#7a9aca",
    variable = "#e8dcc8",
    parameter = "#5dd9d9",
    field = "#c8d8e8",
    property = "#5a7aaa",
    comment = "#5a7a8a",
    operator = "#ff5533",
    delimiter = "#a8b8c8",
    special = "#bb6b8b",
    character = "#ff7356",
    escape = "#ffcc55",
    preproc = "#ff7356",
    include = "#ff7356",
    macro = "#bb6b8b",
    tag = "#ff7356",
    attribute = "#ffcc55",
    error = "#ff5555",
    warning = "#ff9933",
    info = "#4fc9c9",
    hint = "#a8b8c8",
    git_add = "#5faf7f",
    git_change = "#ff9933",
    git_delete = "#ff5555",
    diff_add = "#1a3a2a",
    diff_change = "#2a3a1a",
    diff_delete = "#3a1a1a",
    diff_text = "#3a4a2a",
  },
}
```

Then use it:

```lua
require("nami").setup({ palette = "my_palette" })
```

## Troubleshooting

**Colors not applying?**
- Call `setup()` before `:colorscheme nami`
- Restart Neovim after config changes

**Unknown palette error?**
- Check `require("nami").palettes()` for available palettes
- Verify custom palette file location and structure

**Plugin highlights missing?**
- Ensure the plugin is loaded before nami
- Use `register_plugin()` for unsupported plugins

## License

MIT License - see [LICENSE](LICENSE)

---

