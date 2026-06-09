pcall(require, "christphralden.core.jsdoc")

vim.api.nvim_create_user_command("PackAdd", function(opts)
  vim.pack.add(opts.fargs)
end, { nargs = "+", desc = "Add plugins (:PackAdd user/repo1 user/repo2" })

vim.api.nvim_create_user_command("PackDel", function(opts)
  vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete plugins (:PackAdd plugin1 plugin2" })

vim.api.nvim_create_user_command("PackUpdate", function(opts)
  -- check if arg passed
  if opts.args:match("%S") then
    -- update specific
    local plugins = vim.split(opts.args, "%s+", { trimempty = true })
    vim.pack.update(plugins)
  else
    vim.pack.update()
  end
end, { nargs = "*", desc = "Update plugins or all" })

vim.api.nvim_create_user_command("PackCheck", function()
  local non_active = vim.iter(vim.pack.get()):filter(function(x) return not x.active end):map(function(x)
    return x.spec
        .name
  end):totable()

  if #non_active == 0 then
    vim.notify("No non active plugins found", vim.log.levels.INFO)
    return
  end
end, { nargs = "*", desc = "Check plugins for updates" })

vim.api.nvim_create_user_command("TmuxRenameWindow", function(opts)
  if opts.args:match("%S") then
    local name = vim.fn.shellescape(opts.args)
    vim.fn.system("tmux rename-window " .. name)
    vim.notify("Renamed to " .. name, vim.log.levels.SUCCESS)
  else
    vim.notify("Bad argument: must be a string", vim.log.levels.ERROR)
  end
end, { nargs = "?" })
