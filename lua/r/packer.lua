-- Packer is automatically installed.
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()
return require('packer').startup(function(use)
	-- Plugins go here -----------------------------------------------------------------------------------------------------
	use 'wbthomason/packer.nvim' -- Packer itself must be here -------------------------------------------------------------
	use 'rodolfoap/vim-grammarous' -- LanguageTool grammar check, just use :GrammarousCheck
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} } 
	}
	

	-- Automatically set up your configuration after cloning packer.nvim: put this at the end after all plugins ------------
	if packer_bootstrap then
		require('packer').sync()
	end
end)
