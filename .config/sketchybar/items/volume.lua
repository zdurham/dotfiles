local colors = require("colors")

local volume = sbar.add("item", "volume", {
	position = "right",
  padding_right = 30,
  icon = {
    padding_right = 2.5,
    padding_left = 10,
  },
  label = {
    padding_right = 10,
    padding_left = 2.5,
  },
  background = {
    height = 30,
    border_width = 1,
    color = colors.BRACKET_BACKGROUND,
    border_color = colors.HIGHLIGHT,
  }
})

volume:subscribe("volume_change", function(env)
	local volume_info = tonumber(env.INFO) or 0
	local icon = "󰖀"
	if volume_info == 0 then
		icon = "󰖁"
	elseif volume_info > 50 then
		icon = "󰕾"
	end

	volume:set({
		icon = { string = icon },
		label = { string = string.format("%d%%", volume_info) },
	})
end)

-- Trigger initial update
sbar.trigger("volume_change")
