local colors = require("colors")

-- Right items bracket
sbar.add("bracket", "rightItems", { "volume", "battery", "wifi" }, {
	background = {
		height = 23,
		border_width = 1,
		border_color = colors.HIGHLIGHT_TEXT,
		corner_radius = 5,
		color = colors.BACKGROUND_BASE,
	},
})
