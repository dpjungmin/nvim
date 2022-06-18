---Returns `true` if we have all dependencies ready.
---
---@param features table required features
---@param executables table required executables
---@return boolean ok
local function ready(features, executables)
  local ok = true

  -- Are all features supported?
  for _, feature in ipairs(features) do
    if vim.fn.has(feature) ~= 1 then
      vim.notify('Feature ' .. feature .. ' is required, but is missing!', vim.log.levels.ERROR)
      ok = false
    end
  end

  -- Does all the executables exist?
  for _, expr in ipairs(executables) do
    if vim.fn.executable(expr) ~= 1 then
      vim.notify('Executable ' .. expr .. ' is required, but is missing!', vim.log.levels.ERROR)
      ok = false
    end
  end

  return ok
end

---Check dependencies and initialize global settings.
---
---@param cfg table tovim configuration
local function init(cfg)
  if not ready(cfg.dependencies.features, cfg.dependencies.executables) then
    vim.cmd 'finish'
  end

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
end

---Returns `true` if we successfully load auto-commands, packer, and modules.
---
---@param mods table required modules
---@return boolean ok
local function load(mods)
  -- Load `auto-commands`
  require('lib.autocmds').load()

  -- Install `packer`, if we don't have it
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

local M = {}

function M.run(cfg)
  init(cfg)

  if not load({ 'options', 'mappings', 'plugins' }) then
    vim.cmd 'finish'
  end
end

return M
