-- You can use this loaded variable to enable conditional parts of your plugin.
if _G.StowLoaded then
    return
end

_G.StowLoaded = true

_G.stow_cmd = function(opts)
    local args = opts.args
    local module = require "stow"
    local action = module[args]
    if action ~= nil and type(action) == "function" then
        action()
    end
end

_G.stow_complete = function()
    local module = require "stow"
    local forbidden_keys = { "setup", "dir" }
    local keys = {}
    for key, _ in pairs(module) do
        if not vim.tbl_contains(forbidden_keys, key) then
            table.insert(keys, key)
        end
    end
    return keys
end

-- Useful if you want your plugin to be compatible with older (<0.7) neovim versions
if vim.fn.has "nvim-0.7" == 0 then
    -- vim.cmd "command! Stow lua require('stow').toggle()"
    vim.cmd "command! -nargs=1 -complete=customlist,v:lua.stow_complete Stow lua stow_cmd(<f-args>)"
else
    --- Stow
    --- `apply`
    --- `remove`
    --- `reapply`
    vim.api.nvim_create_user_command("Stow", stow_cmd, { nargs = 1, complete = stow_complete })
end
