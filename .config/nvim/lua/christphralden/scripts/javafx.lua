local function get_project_root()
	local markers = { ".git", ".project" }
	local path = vim.fn.expand("%:p:h")
	while path ~= "/" do
		for _, marker in ipairs(markers) do
			if vim.fn.glob(path .. "/" .. marker) ~= "" then
				return path
			end
		end
		path = vim.fn.fnamemodify(path, ":h")
	end
	return nil
end

local function find_javafx_sdk_path(root)
	local javafx_folders = vim.fn.globpath(root, "javafx-sdk-*", false, 1)
	if #javafx_folders > 0 then
		return javafx_folders[1] .. "/lib"
	else
		print("JavaFX SDK not found in project.")
		return nil
	end
end

local function get_javafx_path()
	local javafx_path = os.getenv("JAVA_FX_SDK")
	if javafx_path then
		return javafx_path .. "/lib"
	else
		print("JAVA_FX_SDK environment variable not set.")
		return nil
	end
end

local function compile_javafx()
	-- Get project root
	local project_root = get_project_root()
	if project_root == nil then
		print("Project root not found!")
		return
	end

	-- Try to find the JavaFX SDK path dynamically
	local javafx_path = find_javafx_sdk_path(project_root) or get_javafx_path()

	if not javafx_path then
		print("JavaFX SDK path not found.")
		return
	end

	-- Get the current Java file
	local current_file = vim.fn.expand("%:p")
	local base_name = vim.fn.expand("%:t:r")

	-- Command to compile the JavaFX project
	local compile_cmd = string.format(
		"javac --module-path %s --add-modules javafx.controls,javafx.fxml,javafx.graphics,javafx.media %s",
		javafx_path,
		current_file
	)
	print(compile_cmd)

	-- Run the compilation
	local compile_status = os.execute(compile_cmd)

	if compile_status == 0 then
		-- Command to run the JavaFX project
		local run_cmd = string.format(
			"java --module-path %s --add-modules javafx.controls,javafx.fxml,javafx.graphics,javafx.media %s",
			javafx_path,
			base_name
		)
		os.execute(run_cmd)
	else
		print("Compilation failed.")
	end
end

-- Create a custom Neovim command to run the JavaFX project
vim.api.nvim_create_user_command("RunJavaFX", compile_javafx, {})
