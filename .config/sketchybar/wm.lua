-- Table of helpers that capture all relevant window manager shell commands
local wm = {}

-- Helper function to execute shell commands and get output
function wm.exec(command)
	local handle = io.popen(command)
	local result = handle:read("*a")
	handle:close()
	return result:gsub("%s+$", "")
end

-- Helper function to get lines from command output
function wm.exec_lines(command)
	local lines = {}
	for line in wm.exec(command):gmatch("[^\r\n]+") do
		table.insert(lines, line)
	end
	return lines
end

function wm.get_monitor_id(sid)
		return wm.exec(string.format(
			"aerospace list-windows --workspace %s --format '%%{monitor-appkit-nsscreen-screens-id}' | cut -c1",
			sid
		))
end

function wm.get_empty_workspaces()
  return wm.exec_lines("aerospace list-workspaces --empty --monitor all")
end

function wm.move_workspace_to_monitor(workspace_id, monitor_id)
  local cmd = string.format("aerospace move-workspace-to-monitor --workspace %s %s", workspace_id, monitor_id)
  sbar.exec(cmd)

end

function wm.get_all_workspaces()
  return wm.exec_lines("aerospace list-workspaces --all")
end

function wm.get_focused_workspace()
  return wm.exec("aerospace list-workspaces --focused")
end

function wm.get_workspace_count()
  return wm.exec("aerospace list-workspaces --all --count")
end

function wm.get_nonempty_workspaces()
  return wm.exec_lines("aerospace list-workspaces --monitor all --empty no")
end

function wm.get_monitors()
  return wm.exec("aerospace list-monitors")
end
return wm
