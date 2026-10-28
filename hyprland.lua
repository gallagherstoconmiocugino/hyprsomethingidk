hl.monitor({ output = "eDP-1", mode = "1920x1080@60.01", position = "2560x0", scale = "1"})
hl.monitor({ output = "HDMI-A-1", mode = "2560x1440@120", position = "0x0", scale = "1"})

hl.on("hyprland.start", function ()
hl.exec_cmd("hyprpm reload")
hl.exec_cmd("awww-daemon")
hl.exec_cmd("waybar")
hl.exec_cmd("dunst")
hl.exec_cmd("hypridle")
hl.exec_cmd("/usr/lib/mate-polkit/polkit-mate-authentication-agent-1")
hl.exec_cmd("bash $HOME/batterycheck2.sh")
end)

hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)

hl.config({
 general = {
        gaps_in  = 2,
        gaps_out = 2,

        border_size = 1,

        col = {
            active_border   = "rgb(ffffff)",
            inactive_border = "rgb(1a1a1a)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "hy3",
        --layout = "dwindle",
 },
 decoration = {
     rounding       = 4,
     --rounding_power = 2,

     -- Change transparency of focused and unfocused windows
     active_opacity   = 1.0,
     inactive_opacity = 1.0,

     shadow = {
         enabled      = true,
         range        = 20,
         render_power = 3,
         color        = "rgba(1a1a1aee)",
     },

     blur = {
         enabled   = true,
         size      = 3,
         passes    = 3,
         popups = true,
         vibrancy  = 0.1696,
     },
 },
 animations = {
     enabled = false,
 },
})

hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    misc = {
        force_default_wallpaper = 1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})

hl.config({
    input = {
        kb_layout  = "it",
        numlock_by_default = false,
        follow_mouse = 1,
        sensitivity = -0.5,
        touchpad = {
            natural_scroll = false,
            disable_while_typing = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "logitech-gaming-mouse-g402",
    sensitivity = -0.9,
})

--[[hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = function()
   hl.dsp.focus({ workspace = "e+1" })
  end
})]]


local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + C", hl.dsp.window.close(), { repeating = true })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nemo"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("rofi -show run -no-config -theme 'theme' -theme-str 'window { border: 1px; }'"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + Z", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + ALT +  mouse:272", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + ALT + PRINT", hl.dsp.exec_cmd("hyprshot -m window --clipboard-only"))
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("hyprshot -m output --clipboard-only"))
hl.bind(mainMod .. " + SHIFT + ALT + PRINT", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

hl.bind(mainMod .. " + A",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + D", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + W",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + S",  hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + ALT + right", hl.dsp.window.resize({x=60,y=0,relative=true}))
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.resize({x=-60,y=0,relative=true}))
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.resize({x=0,y=60,relative=true}))
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.resize({x=0,y=-60,relative=true}))

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%- && dunstify -i \"/usr/share/icons/AdwaitaLegacy/48x48/legacy/dialog-information.png\" -t 1000 \"Decreased brightness\" \"Level: $(brightnessctl -m | awk -F',' '{print $4}' | tr -d '%')%\""))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+  && dunstify -i \"/usr/share/icons/AdwaitaLegacy/48x48/legacy/dialog-information.png\" -t 1000 \"Increased brightness\" \"Level: $(brightnessctl -m | awk -F',' '{print $4}' | tr -d '%')%\""))
hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd("dunstify -t 1000 \"Brightness Level\" \"$(brightnessctl -m | awk -F',' '{print $4}' | tr -d '%')%\""))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5% && dunstify -i '/usr/share/icons/AdwaitaLegacy/48x48/legacy/audio-volume-high.png' -t 1000 'Increased volume'"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5% && dunstify -i '/usr/share/icons/AdwaitaLegacy/48x48/legacy/audio-volume-low.png' -t 1000 'Decreased volume'"))

hl.window_rule({name="kitty",match={class="kitty"},opacity="0.8"})
hl.window_rule({name="dolphin",match={class="dolphin"},opacity="0.8"})
hl.window_rule({name="polkit-mate-authentication-agent",match={class="polkit-mate-authentication-agent"},opacity="0.8"})
hl.window_rule({name="nemo",match={class="nemo"},opacity="0.8"})
hl.window_rule({name="vesktop",match={class="vesktop"},opacity="0.8"})
hl.window_rule({name="qt6ct",match={class="qt6ct"},opacity="0.8"})
hl.window_rule({name="nwg-look",match={class="nwg-look"},opacity="0.8"})
hl.window_rule({name="hyprland-share-picker",match={class="hyprland-share-picker"},opacity="0.8"})
hl.window_rule({name="system-config-printer",match={class="system-config-printer"},opacity="0.8"})
hl.window_rule({name="org.kde.ark",match={class="org.kde.ark"},opacity="0.8"})
hl.window_rule({name="mate-calc",match={class="mate-calc"},opacity="0.8"})

hl.layer_rule({name="waybar",match={namespace="waybar"},blur=true})
hl.layer_rule({name="rofi",match={namespace="rofi"},blur=true})
hl.layer_rule({name="notifications",match={namespace="notifications"},blur=true})

hl.env("QT_QTA_PLATFORM","wayland")
hl.env("QT_QPA_PLATFORMTHEME","qt6ct")

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})


local hy3 = hl.plugin.hy3

hl.bind(mainMod .. " + G", hy3.make_group("opposite"))
--hl.bind("ALT + G", hy3.make_group("opposite"))
hl.bind(mainMod .. " + J", hy3.change_group("opposite"))
