-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
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
end)
