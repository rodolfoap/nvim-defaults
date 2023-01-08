
  -- common
  use 'rhysd/vim-grammarous' -- LanguageTool grammar check

  -- go together
  use 'neovim/nvim-lspconfig' -- https://github.com/neovim/nvim-lspconfig
  use 'kabouzeid/nvim-lspinstall' -- LSP Installer https://github.com/williamboman/nvim-lsp-installer, depends on the previous one
  use 'glepnir/lspsaga.nvim' -- https://github.com/glepnir/lspsaga.nvim (seems like an alternative to neovim LSP
  use 'hrsh7th/nvim-compe' -- DEPRECATED, use https://github.com/hrsh7th/nvim-cmp
  --use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Syntax tree https://github.com/nvim-treesitter/nvim-treesitter
  -- nvim-ts-rainbow: colored parentheses: https://github.com/mrjones2014/nvim-ts-rainbow
  use 'scrooloose/nerdcommenter' -- commenting shortcuts

 -- require'nvim-treesitter.configs'.setup {
 --   highlight = {
 --     enable = true,
 --     disable = { "ruby" }
 --   }
 -- }

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      }
  )

  -- search
  -- TELESCOPE: https://github.com/nvim-telescope/telescope.nvim
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  use 'tpope/vim-eunuch' -- wrappers UNIX commands EXCLUDE
  use 'tpope/vim-surround' -- surround characters shortcuts EXCLUDE for now
  use 'tpope/vim-vinegar' -- file browser: USE https://github.com/nvim-tree/nvim-tree.lua
  use 'kyazdani42/nvim-web-devicons' -- icons when searching EXCLUDE

  -- testing
  use 'kassio/neoterm' -- terminal https://github.com/kassio/neoterm
  use 'janko-m/vim-test' -- testing commands EXCLUDE

  -- javascript
  use { 'HerringtonDarkholme/yats.vim', ft = 'typescript' }
  use { 'posva/vim-vue' } -- Vue highlighting
  use 'othree/javascript-libraries-syntax.vim'

  -- python
  use { 'Vimjas/vim-python-pep8-indent', ft = 'python' }

  -- ruby
  use { 'tpope/vim-rails', ft = 'ruby' }
  use { 'ecomba/vim-ruby-refactoring', ft = 'ruby' }
  use { 'tpope/vim-haml', ft = 'ruby' }

  -- elixir
  use { 'elixir-lang/vim-elixir', ft = 'elixir' }
  use { 'mattreduce/vim-mix', ft = 'elixir' }
  use { 'slashmili/alchemist.vim', ft = 'elixir' }
