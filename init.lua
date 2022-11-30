local function bootstrap()
  for _, v in ipairs {
    {
      name = 'packer.nvim',
      install = function(p)
        -- stylua: ignore
        vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', p, }
      end,
    },
    {
      name = 'hotpot.nvim',
      install = function(p)
        vim.fn.system { 'git', 'clone', 'https://github.com/rktjmp/hotpot.nvim', p }
        vim.cmd('helptags ' .. p .. '/doc')
      end,
    },
  } do
    local p = vim.fn.stdpath 'data' .. '/site/pack/packer/start/' .. v.name

    if vim.fn.empty(vim.fn.glob(p)) == 1 then
      vim.notify('Installing `' .. v.name .. '`..', vim.log.levels.WARN)
      assert(pcall(v.install, p), 'Failed to install `' .. v.name .. '`')
    end
  end

  local ok, msg = pcall(function()
    -- Enable fnl/ support
    require('hotpot').setup {
      provide_require_fennel = true, -- allows you to call `(require :fennel)`
      enable_hotpot_diagnostics = true,
      compiler = {
        -- options passed to fennel.compile for modules
        modules = {
          correlate = true,
        },
        -- options passed to fennel.compile for macros
        macros = {
          env = '_COMPILER', -- MUST be set along with any other options
          -- you may wish to disable fennels macro-compiler sandbox in some cases,
          -- this allows access to tables like `vim` or `os` inside macro functions.
          -- See fennels own documentation for details on these options.
          -- compilerEnv = _G,
          -- allowGlobals = false,
        },
      },
    }

    require 'main'
  end)

  if not ok then
    if not pcall(require, 'hotpot') then
      vim.notify('Re-start Neovim and run `PackerSync`!', vim.log.levels.INFO)
    else
      vim.notify(msg)
    end
  end
end

bootstrap()
