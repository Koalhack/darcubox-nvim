# darcubox

A color scheme for Neovim inspired by Gruvbox and Darcula written in Lua

![darcubox](https://github.com/dotsilas/darcubox-nvim/assets/84829590/e88ffbf6-a658-4def-83d3-90907f11f07c)

**Note: This repository is forked from [@dotsilas/darcubox-nvim](https://github.com/dotsilas/darcubox-nvim)**

Hello, I've taken over the project created by [@dotsilas](https://github.com/dotsilas) to support its development
and add integration to several plugins, themes and tools. I'm working on this project as a solo developer.

If you encounter problems or have ideas, please open an issue. Your input is valuable in improving the project.
Thanks for your interest!

## Features

### Supported Plugins

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics ](https://neovim.io/doc/user/lsp.html)
- [LSP Saga](https://github.com/nvimdev/lspsaga.nvim)
- [Git](https://github.com/dinhhuy258/git.nvim)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [WichKey](https://github.com/folke/which-key.nvim)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Dashboard](https://github.com/nvimdev/dashboard-nvim)
- [BufferLine](https://github.com/akinsho/bufferline.nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)

### Extras

- [Powershell](https://learn.microsoft.com/fr-fr/powershell/) ([powershell](extras/powershell))
  - [Terminal-Icons](https://github.com/devblackops/Terminal-Icons) ([Terminal-Icons](extras/powershell/Terminal-Icons))
- [Windows Terminal](https://aka.ms/terminal-documentation) ([windows_terminal](extras/windows_terminal))

## Instalation

Using [Lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "Koalhack/darcubox-nvim",
  config = function() vim.cmd("colorscheme darcubox") end
}
```

Using [Packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
  "Koalhack/darcubox-nvim",
  config = function() vim.cmd("colorscheme darcubox") end
}
```

## Usage

### Lua

```lua
vim.cmd[[colorscheme darcubox]]
```

## Configuration

The default configuration for darcubox is as follows:

```lua
require('darcubox').setup({
    options = {
        transparent = false
        styles = {
            comments = {},
            functions = {},
            keywords = {},
            types = {},
        }
    }
})
```

You can change the background to transparent and the styles of `Comment`, `Function`, `Keyword` and `Type` syntax groups as follows:

```lua
require('darcubox').setup({
    options = {
        transparent = true
        styles = {
            comments = { italic = true }, -- italic
            functions = { bold = true }, -- bold
            keywords = { italic = true },
            types = { italic = true, bold = true }, -- italics and bold
        }
    }
})

-- Set the configuration before loading the color scheme

vim.cmd[[colorscheme darcubox]]
```

### Lualine

```lua
local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
  options = {
    theme = 'darcubox'
  }
}
```

## Thanks to:

### Palette inspiration

- [Gruvbox](https://github.com/morhetz/gruvbox)
- [Darcula](https://github.com/bulenkov/Darcula)

### Template ideas

- [Material](https://github.com/marko-cerovac/material.nvim)
- [Tokio Night](https://github.com/folke/tokyonight.nvim)

## Licence

[MIT](./LICENCE)
