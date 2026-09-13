local colors = require("colors")
local helpers = require("helpers.space_helpers");
local wm = require("wm")


-- Module-level state storage (persists between update calls)
local workspace_states = {}

-- Add aerospace events
sbar.add("event", "aerospace_workspace_change")
sbar.add("event", "aerospace_monitor_change")

-- Create space items for all aerospace workspaces
local all_workspaces = wm.get_all_workspaces()

-- create initial spaces
for _, sid in ipairs(all_workspaces) do
	-- Determine which monitor this workspace is on
	local monitor_id = wm.get_monitor_id(sid)
	if monitor_id == "" then
		monitor_id = "1"
	end

  helpers.create_space(sid, monitor_id);
  -- store the state items in workspace_states
	workspace_states[sid] = {
		drawing = "off",
		label_string = "",
		icon_color = colors.GREY,
	}
end

-- Build partial current state from aerospace (only non-empty workspaces)
local function build_current_state()
	local state = {}
	local focused_workspace = wm.get_focused_workspace()
  local nonempty_workspaces = wm.get_nonempty_workspaces();

		for _, sid in ipairs(nonempty_workspaces) do
			state[sid] = {
				drawing = "on",
        focused = true
			}
		end

	-- Ensure focused workspace is always visible, even if empty
	if state[focused_workspace] == nil then
		state[focused_workspace] = {
			drawing = "on",
			label_string = "",
			icon_color = colors.WHITE,
      focused = true
		}
	end

	return state
end

-- Function to update all workspace states (with diff-based optimization)
local function update_all_workspaces()
	sbar.begin_config()
	-- Build partial state from aerospace (only non-empty workspaces)
	local new_state = build_current_state()
	-- Move empty workspaces to monitor 1 (side effect)
	local empty_workspaces = wm.get_empty_workspaces();
  local focused = wm.get_focused_workspace();
	for _, sid in ipairs(empty_workspaces) do
		-- WARN: this assumes monitor 1 is your main monitor
    wm.move_workspace_to_monitor(sid, 1)
	end

	-- Loop through all workspaces to handle both non-empty and empty cases
	for _, sid in ipairs(all_workspaces) do
		local old_ws_state = workspace_states[sid]
		local new_ws_state = new_state[sid]
    local is_focused = focused == sid

		if new_ws_state == nil then
			-- Workspace became or stayed empty
			if old_ws_state.drawing == "on" then
				-- Was visible, now hide it
				sbar.set("space." .. sid, {
					drawing = "off",
					icon = { color = colors.WHITE },
          background = {
            color = is_focused and colors.HIGHLIGHT or colors.TRANSPARENT,
          },
				})

				-- Reset to empty state
				workspace_states[sid].drawing = "off"
				workspace_states[sid].label_string = ""
				workspace_states[sid].icon_color = colors.WHITE
			end
		else
      sbar.set("space." .. sid, {
        drawing = new_ws_state.drawing,
        label = {
          string = new_ws_state.label_string,
          color = colors.WHITE
        },
        background = {
          color = is_focused and colors.HIGHLIGHT or colors.TRANSPARENT,
        },
      })

      workspace_states[sid] = new_ws_state
		end
	end
	sbar.end_config()
end

-- Load icons on startup for non-empty workspaces
update_all_workspaces()

local bracket = helpers.create_spaces_bracket(all_workspaces)

-- Subscribe to aerospace events
bracket:subscribe("aerospace_workspace_change", function()
	update_all_workspaces()
end)

bracket:subscribe("space_windows_change", function()
	update_all_workspaces()
end)

bracket:subscribe("front_app_switched", function()
	update_all_workspaces()
end)

bracket:subscribe("aerospace_monitor_change", function(env)
	if env.FOCUSED_WORKSPACE and env.TARGET_MONITOR then
		sbar.set("space." .. env.FOCUSED_WORKSPACE, {
			display = env.TARGET_MONITOR,
		})
	end
end)

