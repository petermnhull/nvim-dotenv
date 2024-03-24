local M = {}

local function get_lines_from_file(str)
	local lines = {}

	local function insert_line(line)
		table.insert(lines, line)
		return ""
	end

	insert_line((str:gsub("(.-)\r?\n", insert_line)))

	return lines
end

local function split_string(str, separator)
	if separator == nil then
		separator = "%s"
	end

	local t = {}
	for s in string.gmatch(str, "([^" .. separator .. "]+)") do
		table.insert(t, s)
	end

	return t
end

local function set_env_from_file()
	local file_path = "test.env"
	local file, _ = io.open(file_path, "r")
	if file ~= nil then
		local content = file:read("*a")
		local lines = get_lines_from_file(content)
		if next(lines) ~= nil then
			for v in pairs(lines) do
				local line = lines[v]
				if not (line == nil or line == "") and string.sub(line, 1, 1) ~= "#" then
					local line_values = split_string(line, "=")
					if line_values ~= nil then
						local value = line_values[2] and vim.trim(line_values[2]) or ""
						vim.env[line_values[1]] = value
					end
				end
			end
		end
		file:close()
	end
	print("loaded env vars from test.env")
end

local function setup_commands()
	local command = vim.api.nvim_create_user_command
	command("SetEnv", set_env_from_file, {})
end

function M.setup(conf)
	setup_commands()
end

return M
