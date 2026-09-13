local colors = require("colors")

local battery = sbar.add("item", "battery", {
	position = "right",
	update_freq = 120,
  padding_right = 30,
  icon = {
    padding_left = 10,
    padding_right = 2.5,
  },
  label = {
    padding_left = 2.5,
    padding_right = 10,
  },
  background = {
    height = 30,
    border_width = 1,
    color = colors.BRACKET_BACKGROUND,
    border_color = colors.HIGHLIGHT,
  }
})

battery:subscribe({ "routine", "system_woke", "power_source_change" }, function(env)
	sbar.exec("pmset -g batt", function(batt_info)
		local percentage = batt_info:match("(%d+)%%")
		local charging = batt_info:match("AC Power") ~= nil

		if not percentage then
			return
		end

		local percent_num = tonumber(percentage)
		local icon = ""
		local colour = colors.TEXT_GREY

		-- Determine icon and color based on percentage
		if percent_num >= 90 then
			icon = ""
			colour = colors.GREY
		elseif percent_num >= 60 then
			icon = ""
			colour = colors.GREY
		elseif percent_num >= 30 then
			icon = ""
			colour = colors.ORANGE
		elseif percent_num >= 10 then
			icon = ""
			colour = colors.RED
		else
			icon = ""
			colour = colors.RED
		end

		-- Override with charging icon if charging
		if charging then
			icon = ""
		end

		battery:set({
			icon = { string = icon, color = colour },
			label = { string = percentage .. "%", color = colour },
		})
	end)
end)
