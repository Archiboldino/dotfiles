--# Generated with hyprdynamicmonitors freeze.
--# This is a template that you can edit, it is just a starter that pulled your current monitor setup,
--# adjust as needed.
--# You can use templates here etc, see https://github.com/fiffeek/hyprdynamicmonitors/blob/main/examples/basic/hyprconfigs/template.go.tmpl.
--# Monitors are given arbitrary tags (the "monitor" prefix and the ID coming from hyprland).
--# If you are using tui to edit, leave this at the end of your file (the last monitor config applies)
--# and leave the markers.
--# <<<<< TUI AUTO START
hl.monitor({
	output = "desc:Thermotrex Corporation TL140BDXP01-0",
	mode = "2560x1440@60.00000",
	position = "384x1152",
	scale = 2.0,
	transform = 0,
	vrr = 0,
})

hl.monitor({
	output = "desc:Dell Inc. DELL P2720D 22TXS03",
	mode = "2560x1440@59.95100",
	position = "0x0",
	scale = 1.25,
	transform = 0,
	vrr = 0,
})
--# <<<<< TUI AUTO END
