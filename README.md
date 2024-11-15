# `stow.nvim`

A neovim plugin that makes working with multiple configuration directories a breeze.
Quickly remove and apply stow to your configuration directory

## Installation

With `lazy.nvim` use the following:

```lua
{
 "stephansama/stow.nvim",
 cmd = "Stow",
 config = true,
 opts = { -- default configuration
  dir = "~/.dotfiles"
 },
 keys = {
  { "<leader>sr", "<cmd>Stow remove<CR>", desc = "Remove Stow symlink" },
  { "<leader>sa", "<cmd>Stow reapply<CR>", desc = "Reapply Stow symlink" },
 },
},
```

## Commands

| Command      | Description                                           |
| ---          | ---                                                   |
| Stow apply   | Apply stow configuration for set directory            |
| Stow remove  | Remove stow configuration for set directory            |
| Stow reapply | Remove and Apply stow configuration for set directory |

Based on <https://github.com/shortcuts/neovim-plugin-boilerplate>
