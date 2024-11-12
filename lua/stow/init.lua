local Stow = {}

---@class (exact) stow.ConfigOptions
---@field dir? string Directory to use stow from

---@desc default configuration options if none are passed to setup
---@type stow.ConfigOptions
local config = { dir = "~/.dotfiles" }

--- remove and reapply `stow` directory
function Stow.reapply()
    local dir = _G.Stow.dir
    vim.cmd("!stow -D " .. dir .. " && stow " .. dir)
end

--- apply `stow` directory
function Stow.apply()
    vim.cmd("!stow " .. _G.Stow.dir)
end

--- remove `stow` directory
function Stow.remove()
    vim.cmd("!stow -D " .. _G.Stow.dir)
end

--- setup Stow options and merge them with user provided ones.
--- @param opts stow.ConfigOptions | nil
--- @return nil
function Stow.setup(opts)
    local options = vim.deepcopy(vim.tbl_deep_extend("keep", opts or {}, config or {}))
    _G.Stow.dir = "-d " .. options.dir .. " ."
end

_G.Stow = Stow

return Stow
