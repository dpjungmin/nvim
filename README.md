<h1 align="center">
    ToVim
</h1>

![Screen Shot 2022-07-04 at 4 10 49 PM](https://user-images.githubusercontent.com/64093170/177224649-9a320eb8-a6a4-45a6-a799-25a50d5947c6.png)

![Screen Shot 2022-07-04 at 4 10 16 PM](https://user-images.githubusercontent.com/64093170/177224702-df65a3a8-d5fd-42b3-825f-eac566ba29de.png)

![Screen Shot 2022-07-04 at 4 54 03 PM](https://user-images.githubusercontent.com/64093170/177226428-85bc2f86-e3cc-4807-a0d8-bb93a490c863.png)

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
  shell = 'bash', -- bash | fish | zsh | ...
  theme = 'tovim' -- tovim | melange
}
```

---

This is currently WIP. 

I am planning to add documentation on how to install and customize settings in detail.
