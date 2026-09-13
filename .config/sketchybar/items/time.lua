local colors = require("colors")

local clock = sbar.add("item", "clock", {
  position = "right",
  icon = {
    string = "󱑎",
    color = colors.HIGHLIGHT,
    padding_right = 4,
  },
  label = {
    color = colors.WHITE
  },
  background = {
    color = colors.TRANSPARENT,
    height = 22,
    padding_left = 5,
    padding_right = 10
  }
})

local day = sbar.add("item", "day", {
  position = "right",
  icon = {
    string = "󱨰",
    color = colors.HIGHLIGHT,
    padding_right = 4,
  },
  label = {
    color = colors.WHITE
  },
  background = {
    color = colors.TRANSPARENT,
    height = 22,
    padding_left = 10,
    padding_right = 5
  }
})


clock:subscribe({ "routine", "forced", "system_woke"}, function() 
  clock:set({ label = { string = os.date("%I:%M %p") }})
end)


day:subscribe({ "routine", "forced", "system_woke" }, function()
	day:set({ label = { string = os.date("%a %b %d") } })
end)

local time_names = {
  "day",
  "clock"
}

local bracket = sbar.add("bracket", "time", time_names, {
    blur_radius = 2,
    background = {
      height = 30,
      border_width = 1,
      color = colors.BRACKET_BACKGROUND,
      border_color = colors.HIGHLIGHT,
    }
  })
  return bracket
