-- Helper function to get the current Git branch name
local function git_branch()
	local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	local branch = handle:read("*a")
	handle:close()
	return branch ~= "" and branch or "Empty" -- Return "Empty" if no branch found
end

-- Define highlight groups for styling the statusline
local function setup_highlights()
	vim.api.nvim_set_hl(0, "StatuslineBranch", { fg = "#ebbcba", bold = true }) -- Rose Pine pink
	vim.api.nvim_set_hl(0, "StatuslineFile", { fg = "#c4a7e7" }) -- Rose Pine purple
	vim.api.nvim_set_hl(0, "StatuslineCWD", { fg = "#9ccfd8" }) -- Rose Pine teal
end

local function setup_statusline()
	local statusline = table.concat({
		"%#StatuslineBranch#", -- Branch section color
		" " .. git_branch() .. " ", -- Git branch symbol and name

		"%#StatuslineFile#", -- File section color
		"%f", -- Filename

		"%m", -- Modified indicator

		"%=%#StatuslineCWD#", -- Align CWD to the right and set color
		vim.fn.getcwd(), -- Current working directory
	})

	vim.opt.statusline = statusline
end

local function init()
	setup_highlights()
	setup_statusline()
end

-- Run the initialization
init()
