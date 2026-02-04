local colors = require("colors")

-- Equivalent to the --default domain
sbar.default({
	padding_left = 5,
	padding_right = 5,
	icon = {
		font = "Hack Nerd Font:Bold:14.0",
		color = colors.HIGHLIGHT_TEXT,
		padding_left = 4,
		padding_right = 4,
	},
	label = {
		font = "Hack Nerd Font:Semibold:14.0",
		color = colors.HIGHLIGHT_TEXT,
		padding_left = 4,
		padding_right = 4,
	},
	updates = "on",
})
