--
-- Please note not all available settings / options are set here.
-- For a full list, see the wiki
--

-- See https://wiki.hyprland.org/Configuring/Monitors/
require("monitors")
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

-- See https://wiki.hyprland.org/Configuring/Keywords/ for more

hl.on("hyprland.start", function()
	--hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("uwsm app -- kitten quick-access-terminal")
	hl.exec_cmd("uwsm app -- hyprland-per-window-layout")
	--hl.exec_cmd("uwsm app -- swaync")
	hl.exec_cmd("uwsm app -- /usr/bin/kdeconnectd")
	hl.exec_cmd("uwsm app -s b -- playerctld")
	-- hl.exec_cmd("uwsm app -s b -- sunsetr")
	-- hl.exec_cmd("uwsm app -s b -- hypridle")
	hl.exec_cmd("uwsm app -- Telegram")
	-- hl.exec_cmd("sleep 20 && systemctl start --user gammastep.service")
	hl.exec_cmd("hyprpm reload -n")
	--hl.exec_cmd("systemctl --user start hyprpolkitagent")
	-- hl.exec_cmd("uwsm app -s b -- hypr_socket")
	hl.exec_cmd("trash-empty 30 -f")
	hl.exec_cmd("gnome-keyring-daemon --start --components=secrets,pkcs11,ssh")
	hl.exec_cmd("dbus-update-activation-environment --systemd GNOME_KEYRING_CONTROL")
end)

-- Source a file (multi-file configs)
-- require("myColors")

-- Some default env vars.
-- hl.env("AQ_NO_MODIFIERS", "1")
-- hl.env("AQ_DRM_DEVICES", "/dev/dri/card2")
-- hl.env("AQ_DRM_DEVICES", "/dev/dri/card2:/dev/dri/card1")
-- hl.env("XCURSOR_SIZE", "24")
-- hl.env("GUAKE_ENABLE_WAYLAND", "1")
-- hl.env("GDK_SCALE", "2")

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},

	cursor = {
		no_hardware_cursors = 2,
	},

	-- For all categories, see https://wiki.hyprland.org/Configuring/Variables/
	input = {
		kb_layout = "us,ua",
		kb_variant = "",
		kb_model = "",
		-- kb_options = "grp:alt_shift_toggle",
		kb_options = "caps:escape_shifted_capslock,grp:alt_shift_toggle",

		follow_mouse = 1,

		touchpad = {
			natural_scroll = false,
		},
		touchdevice = {
			output = "DP-1",
		},

		sensitivity = -0.2, -- -1.0 - 1.0, 0 means no modification.
	},

	general = {
		-- See https://wiki.hyprland.org/Configuring/Variables/ for more
		gaps_in = 2,
		gaps_out = 4,
		border_size = 1,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		layout = "dwindle",

		snap = {
			enabled = true,
		},
	},

	misc = {
		disable_hyprland_logo = true,
		on_focus_under_fullscreen = 1,
		exit_window_retains_fullscreen = true,
		middle_click_paste = false,
		mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,

		-- enable_swallow = true,
		swallow_regex = ".*kitty.*",
	},

	binds = {
		movefocus_cycles_fullscreen = false,
		window_direction_monitor_fallback = true,
	},

	render = {
		-- direct_scanout = 1,
	},

	decoration = {
		-- See https://wiki.hyprland.org/Configuring/Variables/ for more
		rounding = 10,

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
		},

		--drop_shadow = true,
		--shadow_range = 4,
		--shadow_render_power = 3,
		--col = { shadow = "rgba(1a1a1aee)" },
	},

	group = {
		-- group_on_movetoworkspace = true,
		col = {
			border_active = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
		},
		groupbar = {
			render_titles = false,
			height = 1,
			col = {
				active = "rgba(33ccffee)",
				inactive = "rgba(595959aa)",
			},
			gaps_out = 0,
			gaps_in = 0,
			scrolling = false,
		},
	},

	animations = {
		enabled = true,

		-- Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
	},

	dwindle = {
		-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
		preserve_split = true, -- you probably want this
	},

	--master = {
	--    -- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
	--    new_is_master = true,
	--},

	scrolling = {
		fullscreen_on_one_column = true,
		focus_fit_method = 1,
		column_width = 0.99,
		explicit_column_widths = "0.333, 0.5, 0.667, 0.99, 1.0",
	},

	gestures = {
		-- See https://wiki.hyprland.org/Configuring/Variables/ for more
		workspace_swipe_touch = true,
		workspace_swipe_invert = false,
		workspace_swipe_distance = 150,
		workspace_swipe_cancel_ratio = 0.3,
		workspace_swipe_direction_lock = false,
		workspace_swipe_forever = true,
		workspace_swipe_create_new = false,
	},
})

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
-- hyprexpo-gesture = 3, up, expo, on    (plugin gesture — configure via plugin section or plugin docs)
-- hyprexpo-gesture = 3, down, expo, off

-- Example per-device config
-- See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
hl.device({
	name = "logitech-mx-master-3000-1",
	sensitivity = -0.5,
})

hl.config({
	plugin = {
		-- ["dynamiccursors"] = {
		-- 	mode = "none",
		-- 	shake = {
		-- 		-- enables shake to find
		-- 		enabled = true,
		--
		-- 		-- use nearest-neighbour (pixelated) scaling when shaking
		-- 		-- may look weird when effects are enabled
		-- 		nearest = true,
		--
		-- 		-- controls how soon a shake is detected
		-- 		-- lower values mean sooner
		-- 		threshold = 4.0,
		--
		-- 		-- magnification level immediately after shake start
		-- 		base = 4.0,
		-- 		-- magnification increase per second when continuing to shake
		-- 		speed = 5.0,
		-- 		-- how much the speed is influenced by the current shake intensity
		-- 		influence = 0.2,
		--
		-- 		-- maximal magnification the cursor can reach
		-- 		-- values below 1 disable the limit (e.g. 0)
		-- 		limit = 0.0,
		--
		-- 		-- time in milliseconds the cursor will stay magnified after a shake has ended
		-- 		timeout = 1000,
		--
		-- 		-- show cursor behaviour `tilt`, `rotate`, etc. while shaking
		-- 		effects = false,
		--
		-- 		-- enable ipc events for shake
		-- 		-- see the `ipc` section below
		-- 		ipc = false,
		-- 	},
		-- },
		-- hyprexpo = {
		-- 	columns = 3,
		-- 	gap_size = 5,
		-- 	bg_col = "rgb(111111)",
		-- 	-- workspace_method = "center m+1", -- [center/first] [workspace] e.g. first 1 or center m+1
		-- 	skip_empty = true,
		--
		-- 	enable_gesture = true, -- laptop touchpad
		-- 	-- finger_count = 3,      -- 3 or 4
		-- 	-- gesture_distance = 200, -- how far is the "max"
		-- 	-- gesture_positive = false, -- positive = swipe down. Negative = swipe up.
		-- },
	},
})

-- Example windowrule v1
-- windowrule = float, ^(kitty)$
-- Example windowrule v2
-- windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

local mainMod = "SUPER"

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("tofi-uwsm"))
hl.bind("ALT + R", hl.dsp.exec_cmd("$(tofi-run)"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("uwsm-app -- firefox"))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("uwsm-app -- kitty"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + F11", hl.dsp.exec_cmd("uwsm stop"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("uwsm-app -- dolphin"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind("CTRL + grave", hl.dsp.exec_cmd("kitten quick-access-terminal"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("screenshot"))
hl.bind("CTRL + SHIFT + " .. mainMod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind("CTRL + " .. mainMod .. " + M", hl.dsp.workspace.toggle_special())
hl.bind(mainMod .. " + N", hl.dsp.window.move({ workspace = "special" }))
-- bind = $mainMod, A, hymission:toggle

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + U", hl.dsp.focus({ urgent_or_last = true }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + Space", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind("CTRL + " .. mainMod .. " + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind("CTRL + " .. mainMod .. " + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind("CTRL + " .. mainMod .. " + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind("CTRL + " .. mainMod .. " + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

-- scrolling
hl.bind(mainMod .. " + period", hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + comma", hl.dsp.layout("colresize -conf"))
hl.bind(mainMod .. " + SHIFT + period", hl.dsp.layout("promote"))

-- Groups
hl.bind(mainMod .. " + D", hl.dsp.group.toggle())
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("hypr_tab"))
-- NOTE: original shell pipeline; switch to native dispatchers if desired
hl.bind(
	mainMod .. " + Tab",
	hl.dsp.exec_cmd(
		'hyprctl eval "hl.dispatch(hl.dsp.group.next())" | grep ok || hyprctl eval "hl.dispatch(hl.dsp.window.cycle_next())"' -- TODO: Use lua
	)
)
hl.bind("ALT + Tab", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.move({ out_of_group = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + L", hl.dsp.window.move({ into_or_create_group = "r" }))
hl.bind(mainMod .. " + CTRL + SHIFT + H", hl.dsp.window.move({ into_or_create_group = "l" }))
hl.bind(mainMod .. " + CTRL + SHIFT + K", hl.dsp.window.move({ into_or_create_group = "u" }))
hl.bind(mainMod .. " + CTRL + SHIFT + J", hl.dsp.window.move({ into_or_create_group = "d" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.focus({ workspace = i, on_current_monitor = true })) -- focusworkspaceoncurrentmonitor
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- F-key workspace binds (6-10)
local fkey_map = { { 6, "F1" }, { 7, "F2" }, { 8, "F3" }, { 9, "F4" }, { 10, "F5" } }
for _, v in ipairs(fkey_map) do
	local ws, fk = v[1], v[2]
	hl.bind(mainMod .. " + " .. fk, hl.dsp.focus({ workspace = ws }))
	hl.bind(mainMod .. " + CTRL + " .. fk, hl.dsp.focus({ workspace = ws, on_current_monitor = true })) -- focusworkspaceoncurrentmonitor
	hl.bind(mainMod .. " + SHIFT + " .. fk, hl.dsp.window.move({ workspace = ws, follow = false }))
end
-- bind = $mainMod, 1, split-workspace, 1  ... (commented out in original)
-- bind = $mainMod SHIFT, 1, split-movetoworkspacesilent, 1 ...

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + mouse_left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + mouse_right", hl.dsp.focus({ direction = "r" }))
-- bind = $mainMod, mouse_down, split-cycleworkspaces, next ...
-- bind = $mainMod, left, exec, next_workspace prev ...
hl.bind(mainMod .. " + left", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + O", hl.dsp.window.move({ monitor = "+1" }))
hl.bind(mainMod .. " + CTRL + O", hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(mainMod .. " + CTRL + SHIFT + O", hl.dsp.workspace.swap_monitors({ monitor1 = "current", monitor2 = "+1" }))

-- binde = , XF86KbdBrightnessDown, exec, brightnessctl s 10%-
hl.bind("XF86KbdBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true })
-- TEMP: while f2 f3 are not working
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true })
hl.bind("CTRL + XF86KbdBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 100%"))
-- hl.bind("CTRL + XF86KbdBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 0%"))
hl.bind("CTRL + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 100%"))
hl.bind("CTRL + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 0%"))
hl.bind(
	"SHIFT + XF86MonBrightnessDown",
	hl.dsp.exec_cmd("sunsetr set night_gamma=$(( $(sunsetr get night_gamma) - 10 ))"),
	{ repeating = true }
)
hl.bind(
	"SHIFT + XF86MonBrightnessUp",
	hl.dsp.exec_cmd("sunsetr set night_gamma=$(( $(sunsetr get night_gamma) + 10 ))"),
	{ repeating = true }
)
hl.bind("SHIFT + CTRL + XF86MonBrightnessUp", hl.dsp.exec_cmd("sunsetr set night_gamma=100"))
hl.bind("SHIFT + CTRL + XF86MonBrightnessDown", hl.dsp.exec_cmd("sunsetr preset noblue"))
hl.bind("ALT + XF86KbdBrightnessUp", hl.dsp.exec_cmd("ddcci_brightness +10"))
-- hl.bind("ALT + XF86KbdBrightnessDown", hl.dsp.exec_cmd("ddcci_brightness -10"))
hl.bind("ALT + XF86MonBrightnessUp", hl.dsp.exec_cmd("ddcci_brightness +10"))
hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd("ddcci_brightness -10"))
hl.bind("CTRL + ALT + XF86KbdBrightnessUp", hl.dsp.exec_cmd("ddcci_brightness -set 80"))
-- hl.bind("CTRL + ALT + XF86KbdBrightnessDown", hl.dsp.exec_cmd("ddcci_brightness -set 10"))
hl.bind("CTRL + ALT + XF86MonBrightnessUp", hl.dsp.exec_cmd("ddcci_brightness -set 80"))
hl.bind("CTRL + ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd("ddcci_brightness -set 10"))
hl.bind("XF86Launch3", hl.dsp.exec_cmd("kb_brightness_toggle"))
hl.bind("XF86Launch4", hl.dsp.exec_cmd("toggle_profile"))
hl.bind("XF86Launch1", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))

-- Disable middle click pasting
hl.bind("mouse:274", hl.dsp.exec_cmd("wl-copy -pc"), { non_consuming = true })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
-- hl.bind("switch:Lid Switch", hl.dsp.exec_cmd("playerctl -a pause"))

-- Window rules
hl.window_rule({
	name = "telegram_media_float",
	float = true,
	match = {
		class = "^(org.telegram.desktop|telegramdesktop)$",
		title = "^(Media viewer)$",
	},
})
hl.window_rule({
	name = "event_tester_float",
	float = true,
	match = { title = "Event Tester" },
})
hl.window_rule({
	name = "satty_float",
	float = true,
	group = "barred",
	match = { title = "satty" },
})

hl.layer_rule({
	name = "guake",
	-- match layer id
	match = { namespace = "guake" },
	animation = "slide",
})

hl.window_rule({
	name = "tag_5_telegram",
	workspace = "5 silent",
	maximize = true,
	match = { class = "^(org.telegram.desktop|telegramdesktop)$" },
})
hl.window_rule({
	name = "tag_5_teams",
	workspace = "5 silent",
	maximize = true,
	match = { class = ".*teams.*" },
})

hl.window_rule({ match = { class = ".*pavucontrol.*" }, float = true, group = "barred" })
hl.window_rule({ match = { class = ".*blueman-manager.*" }, float = true, group = "barred" })
hl.window_rule({ match = { class = ".*iwgtk.*" }, float = true, group = "barred" })
hl.window_rule({ match = { class = ".*xfce4-power-manager-settings.*" }, float = true, group = "barred" })

-- -- Fix odd behaviors in IntelliJ IDEs --
--! Fix focus issues when dialogs are opened or closed
-- hl.window_rule({ match = { class = "^(jetbrains-.*)$", float = true }, window_dance = true })
--! Fix splash screen showing in weird places and prevent annoying focus takeovers
-- hl.window_rule({ match = { class = "^(jetbrains-.*)$", title = "^(splash)$", float = true }, center = true })  -- TODO: prob not needed
-- hl.window_rule({ match = { class = "^(jetbrains-.*)$", title = "^(splash)$", float = true }, no_focus = true })
-- hl.window_rule({ match = { class = "^(jetbrains-.*)$", title = "^(splash)$", float = true }, no_border = true })

--! Center popups/find windows
-- hl.window_rule({ match = { class = "^(jetbrains-.*)$", title = "^ $", float = true }, center = true })
-- hl.window_rule({ match = { class = "^(jetbrains-.*)$", title = "^ $", float = true }, stay_focused = true })
-- hl.window_rule({ match = { class = "^(jetbrains-.*)$", title = "^ $", float = true }, no_border = true })
-- #! Disable window flicker when autocomplete or tooltips appear
-- hl.window_rule({ match = { class = "^(jetbrains-.*)$", title = "^(win.*)$", float = true }, no_focus = true })
-- # idea
-- hl.window_rule({ match = { class = "^(jetbrains-.*)", title = "^(win.*)" }, float = true })
-- hl.window_rule({ match = { class = "^(jetbrains-.*)" }, no_initial_focus = true, opacity = "0.9 0.9" })
-- hl.window_rule({ match = { class = "^(jetbrains-.*)" }, opacity = "1.0 override" })

hl.layer_rule({ match = { namespace = "swaync-control-center" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, blur = true })

hl.layer_rule({ match = { namespace = "swaync-control-center" }, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, ignore_alpha = 0.5 })

-- Smart gaps
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0, rounding = 0 })

-- ctrl-c to copy from the flameshot gui gives warped images sometimes, but
-- setting the env fixes it

-- Workspace monitor
-- hl.workspace_rule({ workspace = "r[1-10]",  monitor = "eDP-1" })
-- hl.workspace_rule({ workspace = "r[11-20]", monitor = "HDMI-A-1" })
-- hl.workspace_rule({ workspace = "r1",  default = true })
-- hl.workspace_rule({ workspace = "r11", default = true })

-- Maximized workspaces
-- hl.workspace_rule({ workspace = "2", ...})
-- hl.workspace_rule({ workspace = "3", ...})
-- hl.workspace_rule({ workspace = "5", ...})

hl.workspace_rule({ workspace = "5", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "3", layout = "scrolling", gaps_out = 0, gaps_in = 0, no_rounding = true })
hl.workspace_rule({ workspace = "2", layout = "scrolling", gaps_out = 0, gaps_in = 0, no_rounding = true })
hl.workspace_rule({ workspace = "7", layout = "scrolling", gaps_out = 0, gaps_in = 0, no_rounding = true })
hl.workspace_rule({ workspace = "8", layout = "scrolling", gaps_out = 0, gaps_in = 0, no_rounding = true })
