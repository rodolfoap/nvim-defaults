" REMEMBER running :checkhealth to check plugins status

set nocompatible

" Vundle ----------------------------------------------[START]
"
" REMEMBER running :PluginInstall after modifying this list.
"
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
"
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/LanguageTool'
Plugin 'shougo/deoplete.nvim'
Plugin 'zchee/deoplete-jedi'
"Plugin 'zchee/deoplete-clang'
"Plugin 'rzaluska/deoplete-rtags'
"Plugin 'deoplete-plugins/deoplete-docker'
"
call vundle#end()
filetype plugin indent on
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

" move between splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

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

" Use CTRL-N to open the NerdTree
map <C-n> :NERDTreeToggle<CR>
map <C-l> :LanguageToolCheck<CR>

" ========
" Personal
" ========

" Easier anti-quote
imap éé `

map <F10> :w<CR><bar>:!source .x %<CR>

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
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

let g:languagetool_jar='/opt/languagetool/languagetool-commandline.jar'
let g:languagetool_lang='en'

"" Deoplete https://github.com/Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

" Disable VISUAL mode when using mouse
set mouse=
