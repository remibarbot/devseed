local wezterm = require 'wezterm'

return {
  -- Appearance
  font = wezterm.font_with_fallback {
    "JetBrainsMono Nerd Font",
    },
  font_size = 12.5,

  color_scheme = "Monokai Pro (Gogh)",

  -- Transparency (set between 0.0 and 1.0)
  window_background_opacity = 1.0,

  -- Tab bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  use_fancy_tab_bar = true,

  -- Behavior
  scrollback_lines = 5000,
  window_decorations = "RESIZE",
  enable_wayland = false,  -- helps on X11-based systems
  check_for_updates = false,

  -- Launch shell
  default_prog = { "/usr/bin/zsh", "-l" },

  keys = {
    -- This will create a new split and run your default program inside it
    {
      key = 'h',
      mods = 'CTRL|SUPER|ALT',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'v',
      mods = 'CTRL|SUPER|ALT',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'LeftArrow',
      mods = 'CTRL|SUPER|ALT',
      action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
      key = 'RightArrow',
      mods = 'CTRL|SUPER|ALT',
      action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
      key = 'UpArrow',
      mods = 'CTRL|SUPER|ALT',
      action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
      key = 'DownArrow',
      mods = 'CTRL|SUPER|ALT',
      action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
      key = 'k',
      mods = 'CTRL|SUPER|ALT',
      action = wezterm.action.CloseCurrentPane { confirm = false },
    },
  }
}
