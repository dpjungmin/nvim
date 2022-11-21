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

local function load_autocmds()
  require('lib.autocmds').load()
end

local function load_packer()
  -- Install 'packer', if we don't have it
  local packer_repo = 'https://github.com/wbthomason/packer.nvim'
  local packer_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

  if vim.fn.empty(vim.fn.glob(packer_path)) == 1 then
    local cmd = string.format('20split |term git clone --depth=1 %s %s', packer_repo, packer_path)
    vim.cmd(cmd .. ' && echo Re-start Neovim and run "PackerSync"')
    vim.cmd 'finish'
  end

  -- Load 'packer.nvim'
  vim.cmd 'packadd packer.nvim'
end

local function load_modules(mods)
  for _, mod in ipairs(mods) do
    require(mod)
  end
end

local M = {}

function M.run(config)
  -- Are all dependencies installed?
  if not is_ready(config.features, config.executables) then
    vim.cmd 'finish'
  end

  load_autocmds()
  load_packer()
  load_modules(config.modules)
end

return M
