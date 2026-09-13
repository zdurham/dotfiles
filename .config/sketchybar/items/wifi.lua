local colors = require("colors")

local wifi = sbar.add("item", "wifi", {
	position = "right",
	label = {
		font = "CommitMono Nerd Font:Regular:12",
		max_chars = 8,
	},
	scroll_texts = true,
	popup = {
		background = {
			color = colors.TRANSPARENT,
			border_width = 2,
			border_color = colors.HIGHLIGHT,
		},
		y_offset = 5,
	},
})

-- Add popup items
local privAddr = sbar.add("item", {
	position = "popup." .. wifi.name,
	icon = { string = "󰌗", padding_left = 5 },
})

local pubAddr = sbar.add("item", {
	position = "popup." .. wifi.name,
	icon = { string = "󰖟", padding_left = 5 },
})

wifi:subscribe({ "wifi_change", "mouse.entered", "mouse.exited" }, function(env)
	sbar.exec("networksetup -getinfo Wi-Fi", function(localInfo)
		local ipv4 = localInfo:match("IP address:%s*(%d+%.%d+%.%d+%.%d+)")
		local ipv6 = localInfo:match("IPv6 IP address:%s*([%x:]+)")

		-- Filter out the "none" case for IPv6
		if ipv6 == "none" then
			ipv6 = nil
		end

		if ipv4 or ipv6 then
			sbar.exec("networksetup -listpreferredwirelessnetworks en0 | sed -n '2s/^\t//p'", function(ssid)
				wifi:set({
					icon = { string = "󰄍" },
					label = { string = ssid },
				})
				sbar.exec(
					"networksetup -getinfo Wi-Fi | grep 'IP address' | head -n 1 | awk -F ':' '{print $2}'",
					function(addr)
						privAddr:set({
							label = addr,
						})
					end
				)
				sbar.exec("curl -s https://ipinfo.io/ip; echo", function(addr)
					pubAddr:set({
						label = addr,
					})
				end)
			end)
		else
			wifi:set({
				icon = { string = "" },
				label = { string = "Disconnected" },
			})
		end
	end)
end)

wifi:subscribe("mouse.entered", function(env)
	wifi:set({ popup = { drawing = "toggle" } })
end)

wifi:subscribe("mouse.exited.global", function(env)
	wifi:set({ popup = { drawing = false } })
end)
