# Setup

Neovim requires of some plugins. The `setup` performs the whole install:

```
cd ~
rm -rf .vim .Xresources .style.yapf .config/nvim/bundle
mkdir -p .ctags .local/share/nvim/shada/
touch .local/share/nvim/shada/
ln -s .config/nvim .vim
ln -s .config/nvim/_Xresources .Xresources
ln -s .config/nvim/_style.yapf .style.yapf
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
vim -s .config/nvim/vim.1 # Runs :UpdateRemotePlugins
vim -s .config/nvim/vim.2 # Runs :PluginInstall
```

## Python2

If required, launch the `./install.pip2` script which will install python2, pip2 and the required plugins. Not recommended.

## Install issues

There are a couple of issues that can't be solved for now, although they seem not to affect the setup:
```
  " Installing plugins to /home/rap/.   │
  vim/bundle                            │~
. Plugin 'VundleVim/Vundle.vim'         │~
+ Plugin 'scrooloose/nerdtree'          │~
+ Plugin 'vim-scripts/LanguageTool'     │~
+ Plugin 'shougo/deoplete.nvim'         │~
+ Plugin 'zchee/deoplete-jedi'          │~
+ Plugin 'sbdchd/neoformat'             │~
+ Plugin 'rzaluska/deoplete-rtags'      │~
+ Plugin 'vim-voom/voom'                │~
+ Plugin 'jamessan/vim-gnupg'           │~
+ Plugin 'deathlyfrantic/deoplete-spell'│~
* Helptags                              │~

Done!
[deoplete] Vim(call):E117: Unknown function: _deoplete_init
[deoplete] function deoplete#enable[9]..deoplete#initialize[1]..deoplete#init#_i
nitialize[15]..deoplete#init#_channel, line 31
[deoplete] deoplete failed to load. Try the :UpdateRemotePlugins command and res
tart Neovim. See also :checkhealth.
remote/host: python3 host registered plugins ['deoplete']
remote/host: generated rplugin manifest: /home/rap/.local/share/nvim/rplugin.vim
```
