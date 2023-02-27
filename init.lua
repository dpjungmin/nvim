local function load_hotpot()
  local path = vim.fn.stdpath 'data' .. '/lazy/hotpot.nvim'

  if not vim.loop.fs_stat(path) then
    vim.notify("Installing 'hotpot.nvim'", vim.log.levels.WARN)
    vim.fn.system { 'git', 'clone', 'https://github.com/rktjmp/hotpot.nvim', path }
    vim.cmd('helptags ' .. path .. '/doc')
  end

  vim.opt.rtp:prepend(path)

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
end

local function load_lazy()
  local path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

  if not vim.loop.fs_stat(path) then
    vim.notify("Installing 'lazy.nvim'", vim.log.levels.WARN)
    vim.fn.system {
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      path,
    }
  end

  vim.opt.rtp:prepend(path)

  local plugins = require 'plugins'
  local opts = {
    root = vim.fn.stdpath 'data' .. '/lazy',
    lockfile = vim.fn.stdpath 'config' .. '/lazy-lock.json',
    ui = {
      border = 'single',
    },
  }

  require('lazy').setup(plugins, opts)
end

local function load_theme()
  local theme = os.getenv 'THEME' or 'tissue-dark'
  vim.cmd('colorscheme ' .. theme)
end

local function run()
  load_hotpot()
  require 'main'
  load_lazy()
  load_theme()
end

run()
