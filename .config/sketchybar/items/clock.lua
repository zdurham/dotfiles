local colors = require("colors")

local clock = sbar.add("item", "clock", {
	position = "right",
	update_freq = 1,
	padding_left = 5,
	icon = {
		padding_left = 5,
		font = "Hack Nerd Font:Regular:14.0",
		color = colors.CLOCK_COLOR,
	},
	label = {
		color = colors.CLOCK_COLOR,
		font = "Hack Nerd Font:Regular:14.0",
		padding_right = 5,
	},
	background = {
		color = colors.TRANSPARENT,
		corner_radius = 5,
		border_width = 1,
		border_color = colors.CLOCK_COLOR,
		height = 23,
	},
})

clock:subscribe({ "routine", "forced", "system_woke" }, function(env)
	clock:set({ icon = os.date("%a. %d %b."), label = os.date("%I:%M %p") })
end)
