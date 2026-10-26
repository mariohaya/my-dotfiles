-- Hyprland Lua configuration migrated from hyprland.conf (310 lines).
-- Intended for Hyprland 0.55+; preserves enabled settings and keybinds.
-- Keep your old hyprland.conf as a backup until tested.
-- Reference: https://wiki.hypr.land/Configuring/Start/

------------------------------
-- Monitors and cursor
------------------------------
-- Use the preferred mode for any connected display, at 1x scale.
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})

hl.config({
    cursor = { no_hardware_cursors = 1 },
})

------------------------------
-- Programs and startup
------------------------------
local terminal = "kitty"
local menu = "rofi -show drun -show-icons"

-- Launch these once, when Hyprland starts, not whenever the config reloads.
hl.on("hyprland.start", function()
    hl.exec_cmd("kanshi")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("fcitx5")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("gammastep")
    hl.exec_cmd("hyprpaper")

    -- Clipboard history for text and images
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Intentionally do NOT autostart Overskride.
    -- Bluetooth is handled by the system bluetooth.service.
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

------------------------------
-- Appearance and layouts
------------------------------
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 7,
        border_size = 3,
        col = {
            active_border = {
                colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
                angle = 45,
            },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = true,
        layout = "dwindle",
    },
    decoration = {
        rounding = 7,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    animations = { enabled = true },
    dwindle = { preserve_split = true },
    master = { new_status = "master" },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        vrr = 1,
    },
})

------------------------------
-- Animations
------------------------------
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

------------------------------
-- Keyboard, pointer, gestures
------------------------------
hl.config({
    input = {
        kb_layout = "us,cn",
        kb_variant = "intl,altgr-pinyin",
        kb_model = "",
        kb_options = "grp:ctrl_space_toggle",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = { natural_scroll = false },
    },
    gestures = {
        workspace_swipe_touch = true,
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- The original config contains this example per-device override.
hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })

------------------------------
-- Keybindings
------------------------------
local mainMod = "SUPER"

-- Main window and app shortcuts
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + RETURN", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit"))

-- Focus and window order
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + W", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + E", hl.dsp.window.swap({ next = true }))

-- Workspaces 1..10: keys 1..9 and 0
for workspace = 1, 10 do
    local key = tostring(workspace % 10)
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

-- Workspace navigation through mouse buttons, wheel, and keys
hl.bind(mainMod .. " + mouse:275", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:276", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + backslash", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + tab", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Drag / resize with SUPER + left/right mouse button
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize the active window with SUPER + arrows
hl.bind(mainMod .. " + left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }))
hl.bind(mainMod .. " + right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }))
hl.bind(mainMod .. " + up", hl.dsp.window.resize({ x = 0, y = -20, relative = true }))
hl.bind(mainMod .. " + down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }))

-- Multimedia keys: preserve original pactl and brightnessctl commands
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl -- set-sink-volume 0 -10%"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl -- set-sink-volume 0 +10%"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl -- set-sink-mute 0 toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl -- set-source-mute 0 toggle"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +10%"))

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Favorite applications
hl.bind("SUPER + F", hl.dsp.exec_cmd("prime-run firefox"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("thunderbird"))
hl.bind("SUPER + O", hl.dsp.exec_cmd("prime-run obsidian"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("prime-run dolphin"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("pavucontrol"))
hl.bind("SUPER + P", hl.dsp.exec_cmd("spotify-launcher"))

-- Screenshots
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"))
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/Screenshots"))
hl.bind("PRINT", hl.dsp.exec_cmd("HYPRSHOT_DIR=~/Pictures/Screenshots hyprshot -m output"))

-- Overskride only opens on demand; no window at login.
hl.bind("SUPER + B", hl.dsp.exec_cmd("overskride"))

-- Clipboard history: note that the original shortcut is SUPER+C, not SUPER+V.
hl.bind("SUPER + C", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))

-- No active window/workspace rules in the original configuration.
