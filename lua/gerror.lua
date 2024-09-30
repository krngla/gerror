local augroup = vim.api.nvim_create_augroup("Gerror", { clear = true })

local function create_buffer()
	local buf = vim.api.nvim_create_buf(true, true)
	vim.api.nvim_buf_set_name(buf, "*scratch*")
	vim.api.nvim_set_option_value("filetype", "lua", { buf = buf })
	return buf
end

local function main()
	print("Hello, world!\n\n\n\nyo")
end

local function setup()
	vim.api.nvim_create_autocmd(
		"VimEnter",
		{ group = augroup, desc = "auto generate code for propegating errors", once = true, callback = main }
	)
end

vim.api.nvim_create_user_command("Gerrorer", function()
	print("in the future i will handle error handlers\n")
	line = vim.fn.line(".")
	print(vim.api.nvim_get_current_line())
	--	vim.api.nvim_buf_get_lines
end, {})

vim.api.nvim_create_user_command("Gighlight", function()
	line = vim.fn.line(".")
	vim.api.nvim_buf_add_highlight(0, -1, "ghighlight", line, 0, 80)
end, {})
--[[
local buf = create_buffer()
vim.api.nvim_buf_set_lines(buf, 0, -1, true, { "-- Welcome to Neovim!", "" })

vim.api.nvim_win_set_buf(0, buf)
vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(buf), 0 })
]]
return { setup = setup }
