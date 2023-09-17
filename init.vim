" REMEMBER running :checkhealth to check plugins status
" Great guide: https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/

set nocompatible

" Vundle ----------------------------------------------[START]
"
" REMEMBER running :PluginInstall after modifying this list.
"
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim

" Plugin Manager =======================================[START]
call vundle#begin()

" The very plugin manager
Plugin 'VundleVim/Vundle.vim'

" Left-column tree, activate with [CTRL-N]
Plugin 'scrooloose/nerdtree'

" Grammar check, activate with [CTRL-L]
Plugin 'vim-scripts/LanguageTool'

" Code formatting, apparently not used.
" DISABLED: Plugin 'sbdchd/neoformat'

" Autocomplete, nothing to do, enabled at startup
Plugin 'shougo/deoplete.nvim'

" Deoplete for Python
Plugin 'zchee/deoplete-jedi'

" Deoplete for C++
"lugin 'zchee/deoplete-clang'
Plugin 'sbdchd/neoformat'

" Deoplete for C++ from database, requires running rtags (rdm)
Plugin 'rzaluska/deoplete-rtags'

" Nerdtree-like tree for latex tags, activate with [CTRL-T]
Plugin 'vim-voom/voom'

" Ctags generation, automatically loaded and executed at startup
" DISABLED: Plugin 'ludovicchabant/vim-gutentags'

" GNUPG files edition
Plugin 'jamessan/vim-gnupg'

" Autocomplete for spellcheck
Plugin 'deathlyfrantic/deoplete-spell'

call vundle#end()
" Plugin Manager ========================================[END]

filetype plugin indent on
" Deoplete avoid opening additional window
set completeopt-=preview
" Vundle ------------------------------------------------[END]

" allow backspacing over everything in insert mode
set bs=2

"show a status line even when only one window is shown.
set ls=2

" read/write a .viminfo file, don't store more
" than 50 lines of registers
set viminfo='20,\"50

" keep 1000 lines of command line history
set history=100

" show the cursor position all the time
set ruler

" syntax highlighting
syntax on

" highlight searches
set hlsearch

" no beep
set visualbell

" numbering
set nonumber

" move between splits
"noremap <C-h> <C-w>h
"noremap <C-j> <C-w>j
"noremap <C-k> <C-w>k
"noremap <C-l> <C-w>l

" -- sudo save
cmap w!! w !sudo tee >/dev/null %

" Tabulation management
set noexpandtab
set noautoindent
set nosmartindent
set nocindent
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=8
set tabstop=8

" Spellchecking
if has("spell") " if vim support spell checking
    " Download dictionaries automatically
    if !filewritable($HOME."/.vim/spell")
        call mkdir($HOME."/.vim/spell","p")
    endif
    set spellsuggest=10 " z= will show suggestions (10 at most)
    " spell checking for text, HTML, LaTeX, markdown and literate Haskell
    autocmd BufEnter *.txt,*.tex,*.html,*.md,*.ymd,*.lhs setlocal spell
    autocmd BufEnter *.txt,*.tex,*.html,*.md,*.ymd,*.lhs setlocal spelllang=fr,en
    " better error highlighting with solarized
    highlight clear SpellBad
    highlight SpellBad term=standout ctermfg=2 term=underline cterm=underline
    highlight clear SpellCap
    highlight SpellCap term=underline cterm=underline
    highlight clear SpellRare
    highlight SpellRare term=underline cterm=underline
    highlight clear SpellLocal
    highlight SpellLocal term=underline cterm=underline
endif

" ========
" Personal
" ========
" nmap - normal mode (ESC) maps
" cmap - command-line (:) mode maps
" imap - insert mode (i) maps
" xmap - visual (v) mode maps
" vmap - visual (v) and select mode (UNKNOWN) maps
" smap - select mode (UNKNOWN) maps
" omap - operator pending mode maps: dw='delete word', after pressing d, vim enters in op-pending-mode
"  map - normal, visual and op-pending-mode map

" Easier anti-quote
imap éé `

" Use CTRL-N to open the NerdTree
map <C-a> :NERDTreeToggle<CR>
" Opens latex tree with Vim Outliner
map <C-n> :Voom latex<CR>:vertical resize 50<CR>
" Syntax/Semantics checking
map <C-l> :LanguageToolCheck<CR>

" C++ formatting requires apt install astyle
" autocmd BufEnter *.cpp 		map <C-f> :%!ls astyle --style=java --indent=force-tab -O -o -xe -xC200<CR>
autocmd BufEnter *.cpp 		map <C-f> :%!/home/rodolfoap/bin/rlang-format<CR>
autocmd BufEnter *.py		map <C-f> :%!yapf<CR>

" CONTROL-t: Selects all visual block, tex-izes it (requires ~/bin/texize);
" V selects all visual block, !command<CR> runs an external command
nmap <C-t> V!texize<CR>
" Or, if the text is already selected, and the user is already in visual mode:
vmap <C-t> !texize<CR>

" CONTROL-t: Selects all visual block, translates it (requires google trans);
" V selects all visual block, !command<CR> runs an external command
" vmap <C-l> !vim.translate.fr2en<CR>
nmap <C-l> V!vim.translate.es2en<CR>

" CONTROL-f: Folds block to 100 chars
" Visual mode fold to 100 with ^f (requires /usr/bin/fold)
vmap <C-f> !fold -s -w 100<CR>

" Wise vertical motion in insert mode
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk

" Wise vertical motion in visual mode
xmap <silent> <Down> gj
xmap <silent> <Up> gk

" Deoplete works only with tabs
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" NEW: mapping visual-select/copy/paste like MSWord --- START

" Selecting text with SHIFT+arrows
" nnoremap <S-Right> v
" nnoremap <S-Left> v
" nnoremap <S-Up> v
" nnoremap <S-Down> v

" Copy/paste/cut with CTRL-C/V/X
noremap <C-C> "+y
noremap <C-V> "+p
noremap <C-X> "+x

" NEW: mapping visual-select/copy/paste like MSWord --- END

 map	<F7>  gT<C-w>W
imap	<F7>  <Esc>gT<C-w>W
 map	<F8>  gt<C-w><C-w>
imap	<F8>  <Esc>gt<C-w><C-w>
 map 	<F9>  :x<CR>
imap 	<F9>  <Esc>:x<CR>
 map	<F10> :xa<CR>
imap	<F10> <Esc>:xa<CR>
 map	<F5>  :wa!<CR>
imap	<F5>  <Esc>:wa!<CR>

" To jump to the tag of the word under cursor, we use CTRL-J
" This will also work: <C-R><C-W> puts the word under the cursor to the
" command line:
"map	<C-J> <Esc>:tag <C-R><C-W><CR><CR>
 map	<C-J> <Esc>:tag <C-R>=expand('<cword>')<CR><CR>
imap	<C-J> <Esc>:tag <C-R>=expand('<cword>')<CR><CR>
" In addition, notice that C-M maps to CTRL-ENTER

" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

set foldlevel=20
set whichwrap+=<,>,[,]
set wrap lbr

" Try the following if your GUI uses a dark background.
:highlight ExtraWhitespace ctermbg=darkred guibg=darkred
:match ExtraWhitespace /\s\+$/

let g:languagetool_jar='/opt/languagetool/languagetool-commandline.jar'
let g:languagetool_lang='en'

"" Deoplete https://github.com/Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

" Disable VISUAL mode when using mouse
set mouse=

" Cursor (:help guicursor)
set guicursor=a:hor20-blinkwait0-blinkoff10-blinkon10

" Disable Python formatting style, see expandtab in /usr/share/nvim/runtime/ftplugin/python.vim and https://github.com/vim/vim/issues/989
let g:python_recommended_style = 0

let g:gutentags_ctags_tagfile='ctags'
let g:gutentags_cache_dir='/home/rap/.ctags/'

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd BufRead,BufNewFile *.rl set filetype=go
autocmd BufRead,BufNewFile *.y  set filetype=go
autocmd BufRead,BufNewFile .x   set filetype=sh
autocmd BufRead,BufNewFile .k   set filetype=sh
