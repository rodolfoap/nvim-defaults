# Setup

## Automatized install

See the purex/home/rap/config/nvim project, where the complete install is automatic and simplified.

## Install

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
