function conky_RefreshTable()
	local filename = debug.getinfo(1).source:match("@?(.*/)") .. "/todo.md"
	local file = io.open(filename)
	local todo = ""
	local complete = {}
	local progress = {}
	local total = {}
	local order = {}

	if file ~= nil then
		for line in file:lines() do
			if line:match("^##.*") ~= nil then
				todo = string.sub(line, 4, #line)
				complete[todo] = 0
				progress[todo] = 0
				total[todo] = 0
				order[#order + 1] = todo
			elseif line:match("^%[ %].*") ~= nil then
				total[todo] = total[todo] + 1
			elseif line:match("^%[x%].*") ~= nil then
				total[todo] = total[todo] + 1
				complete[todo] = complete[todo] + 1
			elseif line:match("^%[.%].*") ~= nil then
				total[todo] = total[todo] + 1
				progress[todo] = progress[todo] + 1
			end
		end
		file:close()
	end

	local TODOS = ""
	for _, k in ipairs(order) do
		TODOS = TODOS .. string.format("%02d/%02d %s (%d)\n", complete[k], total[k], k, progress[k])
	end


  print(TODOS)
  return TODOS
end
