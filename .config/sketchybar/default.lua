local colors = require("colors")

-- Equivalent to the --default domain
sbar.default({
  icon = {
    font = "CommitMono Nerd Font:Regular:12",
    color = colors.WHITE,
  },
  label = {
    font = "CommitMono Nerd Font:Regular:12",
    color = colors.WHITE,
  },
  updates = "when_shown",
  y_offset = 0
})
