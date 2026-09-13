local colors = require("colors")
local wm = require("wm");
local icon_map = require("helpers.icon_map")

local helpers = {}

 function helpers.create_space(sid, monitor_id)
	sbar.add("item", "space." .. sid, {
		position = "left",
		display = monitor_id,
		drawing = "off",
		background = {
			drawing = "on",
      height = 20,
      padding_left = 4,
      padding_right = 4
		},
		icon = {
			string = sid,
			shadow = { drawing = "off" },
      highlight_color=colors.WHITE,
      width = 30,
      align = "center",
			font = "CommitMono Nerd Font:Regular:12",
		},
		click_script = "aerospace workspace " .. sid,
	})
end

function helpers.create_spaces_bracket(all_workspaces)
  local space_names = {}

  for _, sid in ipairs(all_workspaces) do
    table.insert(space_names, "space." .. sid)
  end

  local bracket = sbar.add("bracket", "spaces", space_names, {
    blur_radius = 2,
    background = {
      height = 30,
      border_width = 1,
      color = colors.BRACKET_BACKGROUND,
      border_color = colors.HIGHLIGHT,
    }
  })
  return bracket
end

function helpers.create_highlight()
  local highlight = sbar.add("item", "highlight_space", {
    position = "left",
    width = 22,
    background = {
      color = "0xFFd7827e",
      height = 22
    },
  })

  return highlight
end

function helpers.get_icons_for_workspace(workspace_id)
  local apps_raw = wm.exec(string.format("aerospace list-windows --workspace %s", workspace_id))

  local icon_strip = " "
  for line in apps_raw:gmatch("[^\r\n]+") do
    local app_name = line:match("|%s*(.-)%s*|")
    if app_name then
      icon_strip = icon_strip .. " " .. icon_map(app_name)
    end
  end

  return icon_strip
end

return helpers;
