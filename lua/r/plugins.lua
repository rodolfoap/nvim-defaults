-- See: https://www.chiarulli.me/Neovim-2/03-plugins/

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

-- Install your plugins here
return packer.startup(function(use)
	-- Packer itself
	use('wbthomason/packer.nvim')

	-- Left-column tree, activate with [CTRL-N]
	use('scrooloose/nerdtree')

	-- Grammar check, activate with [CTRL-L]
	use('vim-scripts/LanguageTool')

	-- Autocomplete, nothing to do, enabled at startup
	-- use('Shougo/deoplete.nvim', run = ':UpdateRemotePlugins')
	-- Deoplete ++
	-- use {'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins'}
	use 'deoplete-plugins/deoplete-tag'
	use {'deathlyfrantic/deoplete-spell', branch = 'main'}
	-- Deoplete relatives
	use 'Shougo/neco-syntax'
	use 'Shougo/context_filetype.vim'

	-- Deoplete for Python
	use('zchee/deoplete-jedi')

	-- Deoplete for C++
	use('sbdchd/neoformat')

	-- Deoplete for C++ from database, requires running rtags (rdm)
	use('rzaluska/deoplete-rtags')

	-- Nerdtree-like tree for latex tags, activate with [CTRL-T]
	use('vim-voom/voom')

	-- GNUPG files edition
	use('jamessan/vim-gnupg')

	-- Autocomplete for spellcheck
	use('deathlyfrantic/deoplete-spell')
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
