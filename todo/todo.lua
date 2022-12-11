conky.config = {
	-- window
	alignment = "tm",
	background = true,
	own_window = true,
	own_window_class = "Conky",
	own_window_type = "override",
	-- font
	font = "fira code:size=20",
	use_xft = true,
	-- refresh
	update_interval = 30,
	double_buffer = true,
	-- transparent
	own_window_transparent = true,
	own_window_argb_visual = true,
	lua_load = "/home/vinny/Code/todo.conky/todo/code.lua",
}

conky.text = [[
${alignc}${font :size=20} TODO:
$hr
${font :size=12}${lua conky_RefreshTable }
]]
