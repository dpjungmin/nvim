local notify = require('lib.utils').notify

local function is_ready(features, executables)
  local ok = true

  -- Are all features supported?
  for _, feature in ipairs(features) do
    if vim.fn.has(feature) ~= 1 then
      notify('Feature ' .. feature .. ' is required, but is missing!')
      ok = false
    end
  end

  -- Does all the executables exist?
  for _, expr in ipairs(executables) do
    if vim.fn.executable(expr) ~= 1 then
      notify('Executable ' .. expr .. ' is required, but is missing!')
      ok = false
    end
  end

  return ok
end

local function load(mods)
  -- Load 'auto-commands'
  require('lib.autocmds').load()

  -- Install 'packer', if we don't have it
  local packer_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

  if vim.fn.empty(vim.fn.glob(packer_path)) == 1 then
    local packer_repo = 'https://github.com/wbthomason/packer.nvim'
    local cmd = string.format('20split |term git clone --depth=1 %s %s', packer_repo, packer_path)

    vim.cmd(cmd .. ' && echo Re-start Neovim and run "PackerSync"')
    return false
  end

  -- Load 'packer.nvim'
  vim.cmd 'packadd packer.nvim'

  -- Load modules
  for _, mod in ipairs(mods) do
    require(mod)
  end

  return true
end

local M = {}

function M.run()
  local features = { 'nvim-0.7.0', 'python3' }
  local executables = { 'git', 'rg', 'fd', 'lazygit' }

  -- Are all dependencies installed?
  if not is_ready(features, executables) then
    vim.cmd 'finish'
  end

  -- Load auto-commands and modules
  if not load { 'globals', 'mappings', 'options', 'plugins' } then
    vim.cmd 'finish'
  end
end

return M
