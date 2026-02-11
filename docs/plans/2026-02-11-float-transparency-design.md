# Float Transparency Design

## Problem

When `transparent = true` is configured, `Normal.bg` correctly becomes `"NONE"` but all floating window highlights (`NormalFloat`, `FloatBorder`, `FloatTitle`) remain solid (`p.bg_float = "#061828"`). This causes floating windows (luxterm, Telescope, cmp popups) to render opaque against a transparent editor background.

## Root Cause

In `highlights/core/editor.lua`, `bg` is transparency-aware:

```lua
local bg = config.transparent and p.none or p.bg
```

But `NormalFloat`, `FloatBorder`, and `FloatTitle` bypass this and reference `p.bg_float` directly.

The same pattern exists in `highlights/plugins/telescope.lua` for Telescope-specific float groups.

## Solution

Introduce a `bg_float` local variable that follows the same transparency pattern as `bg`, then replace all direct `p.bg_float` references in floating window highlights.

### Changes

#### `highlights/core/editor.lua`

Add transparency-aware `bg_float` local:

```lua
local bg       = config.transparent and p.none or p.bg
local bg_float = config.transparent and p.none or p.bg_float
```

Replace `p.bg_float` with `bg_float` in:
- `NormalFloat` (line 12)
- `FloatBorder` (line 14)
- `FloatTitle` (line 15)

#### `highlights/plugins/telescope.lua`

Add the same `bg_float` local and replace `p.bg_float` in:
- `TelescopeNormal` (line 8)
- `TelescopeBorder` (line 9)
- `TelescopeResultsNormal` (line 18)
- `TelescopeResultsBorder` (line 19)

### What Does NOT Change

- `Pmenu` groups — popup menus use `c.pmenu`, a semantic color (separate concern)
- `TelescopePrompt*` groups — use `p.bg_highlight`, not `p.bg_float`
- `TelescopePreview*` groups — use `p.bg`, already handled by existing `bg` local
- No config schema changes — leverages the existing `transparent` boolean
- No palette changes — `p.bg_float` retains its value for non-transparent mode

## Scope

- **2 files modified**
- **7 highlight groups updated**
- **0 new config options**
