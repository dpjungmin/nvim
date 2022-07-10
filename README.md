<h1 align="center">
    ToVim
</h1>

## Auto-installation for macOS and Arch Linux

Install my [configurations](https://github.com/dpjungmin/dotfiles). This will
automatically install all my configurations including my Neovim setup.

When you first run `nvim`, [packer](https://github.com/wbthomason/packer.nvim) will be installed. After packer is installed re-start `nvim` and run `:PackerSync` to install all packages.

## Configuration (optional)

Create a file called `$MYVIMRC/lua/tovim.lua`. The following are the default values.

```lua
return {
  -- If true, current buffer will be auto-saved when the text changes or when you leave insert mode
  autosave = false,
  -- If true, enable `nvim-notify` plugin
  enable_notify = false,
  format_on_save = {
    python = false, -- requires `black`
    rust = true, -- requires `rustfmt`
  },
  -- If true, sets `number` and `relativenumber`
  line_number = false,
  shell = 'bash', -- bash | fish | zsh | ...
}
```

---

This is currently WIP. 

I am planning to add documentation on how to install and customize settings in detail.
