-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
	group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
	pattern = 'plugins.lua',
	command = 'source <afile> | PackerCompile',
})

return require('packer').startup({function(use)
	-- Packer itself
	use('wbthomason/packer.nvim')

	-- Left-column tree, activate with [CTRL-N]
	use('scrooloose/nerdtree')

	-- Grammar check, activate with [CTRL-L]
	use('vim-scripts/LanguageTool')

	-- Autocomplete, nothing to do, enabled at startup
	use('shougo/deoplete.nvim')

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
end,
	config = {
		display = {
		open_fn = function()
		return require('packer.util').float({ border = 'single' })
		end,
		},
	},
})
