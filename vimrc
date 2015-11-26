set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" git support
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'kchmck/vim-coffee-script'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'digitaltoad/vim-jade'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
set number
set relativenumber
set expandtab
set smartindent
set background=dark
set clipboard=unnamedplus
set cursorline

au BufRead,BufNewFile *.coffee set filetype=coffee

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype go setlocal ts=4 sw=4 noexpandtab
autocmd Filetype c setlocal ts=4 sw=4 noexpandtab
autocmd Filetype cpp setlocal ts=4 sw=4 noexpandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype coffee setlocal ts=2 sw=2 expandtab
autocmd Filetype cucumber setlocal ts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=2 sw=2 expandtab


set runtimepath^=~/.vim/bundle/ctrlp.vim

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_show_hidden = 1
let g:syntastic_coffee_coffeelint_args = "--csv --file config.json"
let g:syntastic_jade_checkers = ['jade_lint']

map <TAB> :NERDTreeToggle<CR>
nmap <C-o> o<Esc>
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
hi NonText ctermfg=243 guifg=gray

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
