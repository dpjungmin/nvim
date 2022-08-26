-- Ensure `packer` and `hotpot` are installed
local function init()
  for _, v in ipairs {
    {
      name = 'packer.nvim',
      install = function(path)
        -- stylua: ignore
        vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', path }
        _G['install-packages'] = true
      end,
      init = function()
        vim.cmd 'packadd packer.nvim'
      end,
    },
    {
      name = 'hotpot.nvim',
      install = function(path)
        vim.fn.system { 'git', 'clone', 'https://github.com/rktjmp/hotpot.nvim', path }
        vim.cmd('helptags ' .. path .. '/doc')
      end,
      init = function()
        require('hotpot').setup {
          provide_require_fennel = true,
          enable_hotpot_diagnostics = true,
          compiler = {
            modules = {
              correlate = true,
            },
            macros = {
              env = '_COMPILER',
              compilerEnv = _G,
              allowGlobals = false,
            },
          },
        }
      end,
    },
  } do
    local path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/' .. v.name

    if vim.fn.empty(vim.fn.glob(path)) == 1 then
      vim.notify('Installing `' .. v.name .. '`..', vim.log.levels.WARN)
      assert(pcall(v.install, path), 'Failed to install `' .. v.name .. '`')
    end

    local ok, msg = pcall(v.init)

    if not ok then
      vim.notify(msg, vim.log.levels.ERROR)
      vim.cmd 'finish'
    end
  end
end

local function run()
  init()
  require 'main'
  require 'plugins'
end

run()
