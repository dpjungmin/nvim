local M = {}

function M:init(cfg)
  local features = { 'nvim-0.7.0', 'python3' }
  local executables = { 'git', 'rg', 'fd', 'lazygit' }

  if not M:ready(features, executables) then
    vim.cmd 'finish'
  end

  cfg = M:make_config(cfg)
  local mods = { 'options', 'mappings', 'plugins' }

  if not M:load(cfg, mods) then
    vim.cmd 'finish'
  end
end

-- Returns `true` if we have all dependencies ready
function M:ready(features, executables)
  local ok = true

  -- Check if we have all required features
  for _, feature in ipairs(features) do
    if vim.fn.has(feature) ~= 1 then
      vim.notify('Feature ' .. feature .. ' is required, but is missing!', vim.log.levels.ERROR)
      ok = false
    end
  end

  -- Check if we have all required executables
  for _, expr in ipairs(executables) do
    if vim.fn.executable(expr) ~= 1 then
      vim.notify('Executable ' .. expr .. ' is required, but is missing!', vim.log.levels.ERROR)
      ok = false
    end
  end

  return ok
end

-- Creates our vim configurations
function M:make_config(cfg)
  local config = {
    autosave = false,
    buffer_groups = {},
    format_on_save = {
      c = false,
      cpp = false,
      python = false,
      rust = false,
    },
    leader = '\\',
    shell = 'bash',
    theme = 'dark',
  }

  config = vim.tbl_extend('force', config, cfg)

  return config
end

-- Returns `true` if we successfully load all configurations
function M:load(cfg, mods)
  -- Set global variables
  _G.tovim = vim.tbl_extend('force', {
    is_mac = vim.fn.has('macunix') == 1,
    is_linux = vim.fn.has('unix') == 1 and vim.fn.has('macunix') ~= 1,
    indent_blankline = true,
  }, cfg)

  -- Enable embedded script highlighting (see `:h g:vimsyn_embed`)
  vim.g.vimsyn_embed = 'lP'

  -- Add custom snippets
  vim.g.UltiSnipsSnippetDirectories = { 'UltiSnips', 'snips' }
  vim.g.UltiSnipsJumpForwardTrigger = '<c-j>'
  vim.g.UltiSnipsJumpBackwardTrigger = '<c-k>'

  -- Load auto-commands
  require('lib.autocmds').load()

  -- Check if we have packer installed
  local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  if vim.fn.empty(vim.fn.glob(packer_path)) == 1 then
    local packer_repo = 'https://github.com/wbthomason/packer.nvim'
    local cmd = string.format("20split |term git clone --depth=1 %s %s", packer_repo, packer_path)

    vim.cmd(cmd .. " && echo Re-start Neovim and run \"PackerSync\"")
    return false
  end

  -- Load `packer.nvim`
  vim.cmd 'packadd packer.nvim'

  -- Load modules
  for _, mod in ipairs(mods) do
    require(mod)
  end

  return true
end

return M
