sloppy_focus               = false
bypass_surface_visibility  = false
log_level                  = "error"  -- "silent", "error", "info", "debug"

appearance = {
    inner_border_px = 1,
    outer_border_px = 8,
    gaps            = 8,
    smart_gaps      = false,

    root_color          = 0x222222ff,
    inner_border_color  = 0xd64933ff,
    outer_border_color  = 0x0e0e0eff,

    inner_focus_color   = 0xe8e8e8ff,
    outer_focus_color   = 0x0e0e0eff,

    inner_urgent_color  = 0xff0000ff,
    outer_urgent_color  = 0xff0000ff,

    fullscreen_bg = 0x000000ff,
}

input = {
    repeat_rate             = 50,
    repeat_delay            = 200,
    tap_to_click            = true,
    tap_and_drag            = true,
    drag_lock               = true,
    natural_scrolling       = false,
    disable_while_typing    = true,
    left_handed             = false,
    middle_button_emulation = false,
    scroll_method           = "2fg",        -- "2fg", "edge", "button"
    click_method            = "button_areas", -- "button_areas", "clickfinger"
    accel_profile           = "adaptive",   -- "adaptive", "flat"
    accel_speed             = 0.0,
}

monitors = {
    { name = nil, mfact = 0.55, nmaster = 1, scale = 1.0,
      layout = "dwindle", x = -1, y = -1 },
}

autostart = {
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_SESSION_TYPE XDG_CURRENT_DESKTOP",
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_SESSION_TYPE XDG_CURRENT_DESKTOP",
    "waybar",
    "awww-daemon",
}

keybinds = {
    { mods = {"logo"}, key = "t", action = "spawn", args = {"alacritty"} },
    { mods = {"logo"}, key = "q", action = "spawn", args = {"firefox"} },
    { mods = {"alt"},  key = "space", action = "spawn", args = {"wofi", "--show", "drun", "--prompt", "Find..."} },
    { mods = {"logo"}, key = "x", action = "spawn", args = {"wofi-emoji"} },
    { mods = {"logo"}, key = "l", action = "spawn", args = {"hyprlock"} },
    { mods = {"logo"}, key = "e", action = "spawn", args = {"nautilus", "-w"} },
    { mods = {"logo"}, key = "escape", action = "spawn", args = {"wofi-power-menu"} },
    { mods = {"logo"}, key = "n", action = "spawn", args = {"swaync-client", "-t"} },

    { mods = {}, key = "XF86AudioRaiseVolume", action = "spawn", args = {"wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "0.1+"} },
    { mods = {}, key = "XF86AudioLowerVolume", action = "spawn", args = {"wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "0.1-"} },
    { mods = {}, key = "XF86AudioMute", action = "spawn", args = {"wpctl", "set-mute", "@DEFAULT_AUDIO_SINK@", "toggle"} },
    { mods = {}, key = "XF86AudioMicMute", action = "spawn", args = {"wpctl", "set-mute", "@DEFAULT_AUDIO_SOURCE@", "toggle"} },

    { mods = {}, key = "XF86AudioPlay", action = "spawn", args = {"playerctl", "play-pause"} },
    { mods = {}, key = "XF86AudioPause", action = "spawn", args = {"playerctl", "play-pause"} },
    { mods = {}, key = "XF86AudioNext", action = "spawn", args = {"playerctl", "next"} },
    { mods = {}, key = "XF86AudioPrev", action = "spawn", args = {"playerctl", "previous"} },

    { mods = {}, key = "XF86MonBrightnessUp", action = "spawn", args = {"brightnessctl", "--class=backlight", "set", "+10%"} },
    { mods = {}, key = "XF86MonBrightnessDown", action = "spawn", args = {"brightnessctl", "--class=backlight", "set", "10%-"} },

    { mods = {"logo"}, key = "w", action = "killclient" },
    { mods = {"logo"}, key = "v", action = "togglefloating" },
    { mods = {"logo"}, key = "f", action = "togglefullscreen" },
    { mods = {"logo"}, key = "g", action = "togglegaps" },

    { mods = {"logo"}, key = "left",  action = "focusdir", args = {"left"} },
    { mods = {"logo"}, key = "down",  action = "focusdir", args = {"down"} },
    { mods = {"logo"}, key = "up",    action = "focusdir", args = {"up"} },
    { mods = {"logo"}, key = "right", action = "focusdir", args = {"right"} },

    { mods = {"logo", "shift"}, key = "left",  action = "swapdir", args = {"left"} },
    { mods = {"logo", "shift"}, key = "down",  action = "swapdir", args = {"down"} },
    { mods = {"logo", "shift"}, key = "up",    action = "swapdir", args = {"up"} },
    { mods = {"logo", "shift"}, key = "right", action = "swapdir", args = {"right"} },

    { mods = {"logo"}, key = "comma", action = "focusmon", args = {"left"} },
    { mods = {"logo"}, key = "period", action = "focusmon", args = {"right"} },
    { mods = {"logo", "shift"}, key = "less", action = "tagmon", args = {"left"} },
    { mods = {"logo", "shift"}, key = "greater", action = "tagmon", args = {"right"} },

    { mods = {"logo"}, key = "tab", action = "view" },
    { mods = {"logo"}, key = "0", action = "view", args = {"all"} },

    { mods = {"logo", "shift"}, key = "e", action = "quit" },
}

for i = 1, 9 do
    local mask = 1 << (i - 1)

    table.insert(keybinds, {
        mods = {"logo"},
        key = tostring(i),
        action = "view",
        args = { tostring(mask) }
    })

    table.insert(keybinds, {
        mods = {"logo", "ctrl"},
        key = tostring(i),
        action = "toggleview",
        args = { tostring(mask) }
    })

    table.insert(keybinds, {
        mods = {"logo", "shift"},
        key = tostring(i),
        action = "tag",
        args = { tostring(mask) }
    })

    table.insert(keybinds, {
        mods = {"logo", "ctrl", "shift"},
        key = tostring(i),
        action = "toggletag",
        args = { tostring(mask) }
    })
end

buttons = {
    { mods = {"logo"}, button = "left",   action = "moveresize",     args = {"move"} },
    { mods = {"logo"}, button = "middle", action = "togglefloating" },
    { mods = {"logo"}, button = "right",  action = "moveresize",     args = {"resize"} },
}
