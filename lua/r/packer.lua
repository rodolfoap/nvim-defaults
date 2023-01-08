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
--	use 'shaunsingh/moonlight.nvim' -- Nice themes
	use 'rodolfoap/vim-grammarous' -- LanguageTool grammar check, just use :GrammarousCheck

	-- Completion + LSP ----------------------------------------------------------------------------------------------------
	use {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig",}
	use {"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
			'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
			'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
			'f3fora/cmp-spell', 'hrsh7th/cmp-emoji',
		}
	}
	use {
		'tzachar/cmp-tabnine',
		run = './install.sh',
		requires = 'hrsh7th/nvim-cmp'
	}

	-- Completion + LSP ----------------------------------------------------------------------------------------------------
	-- Automatically set up your configuration after cloning packer.nvim: put this at the end after all plugins ------------
	if packer_bootstrap then
		require('packer').sync()
	end
end)
