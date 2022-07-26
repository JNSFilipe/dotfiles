local wezterm = require "wezterm"

local nord = {
  ansi = {
    '#3b4252',
    '#bf616a',
    '#a3be8c',
    '#ebcb8b',
    '#81a1c1',
    '#b48ead',
    '#88c0d0',
    '#e5e9f0',
  },
  -- background = '#2e3440',
  background = '#1d2026',
  brights = {
    '#4c566a',
    '#bf616a',
    '#a3be8c',
    '#ebcb8b',
    '#81a1c1',
    '#b48ead',
    '#8fbcbb',
    '#eceff4',
  },
  cursor_bg = '#eceff4',
  cursor_border = '#eceff4',
  cursor_fg = '#282828',
  foreground = '#d8dee9',
  selection_bg = '#eceff4',
  selection_fg = '#4c566a',
}

return {
  -- color_scheme = "nord",
  colors = nord,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  window_decorations = "NONE",
  -- enable_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  force_reverse_video_cursor = true,
  window_background_opacity = 0.8,
  font_size = 11.5,
  -- font = wezterm.font('Fira Code', { weight = "Medium",  italic=false}),
  font = wezterm.font("JetBrains Mono", { weight = "Regular", style = "Normal", italic = false}),
  -- default_prog = {"tmux"},
  default_prog = {"fish"},

  use_dead_keys = false,
  leader = { key="a", mods="CTRL", timeout_milliseconds=1001 },
  keys = {
      { key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" }})},
      { key = "v", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" }})},
      { key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" })},
      { key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" })},
      { key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
      { key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" })},
      { key = "H", mods = "LEADER", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
      { key = "L", mods = "LEADER", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
      { key = "K", mods = "LEADER", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
      { key = "J", mods = "LEADER", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
      { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
      { key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true }})},
      { key = "q", mods = 'LEADER', action = wezterm.action({ CloseCurrentTab = { confirm=true }})},
      { key = "{", mods = "LEADER", action = wezterm.action{ ActivateTabRelative=-1 }},
      { key = "}", mods = "LEADER", action = wezterm.action{ ActivateTabRelative=1 }},
      { key = "n", mods = "LEADER", action = wezterm.action{ SpawnTab="CurrentPaneDomain" }},
      { key = "+", mods = "CTRL", action = "IncreaseFontSize" },
      { key = "-", mods = "CTRL", action = "DecreaseFontSize" },
      { key = "0", mods = "CTRL", action = "ResetFontSize" },
  },
}
