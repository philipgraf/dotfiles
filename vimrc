set nocompatible              " be iMproved, required
set modelines=0               " CVE-2007-2438
set backspace=2
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
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'kchmck/vim-coffee-script'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'digitaltoad/vim-jade'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'fatih/vim-go'
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rust-lang/rust.vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'leafgarland/typescript-vim'
Plugin 'lervag/vimtex'
Plugin 'elixir-lang/vim-elixir'

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
set hidden
set relativenumber
set expandtab
set smartindent
set background=dark
set clipboard=unnamedplus
set cursorline
set foldmethod=syntax

set list
set listchars=eol:¬,tab:▸\ ,trail:~,extends:>,precedes:<
hi NonText ctermfg=243 guifg=#4a4a59
hi SpecialKey ctermfg=243 guifg=#4a4a59

set directory=$HOME/.vim/swapfiles//

if has("autocmd")
        autocmd BufRead,BufNewFile *.coffee setfiletype coffee
        autocmd BufRead,BufNewFile *.jbuilder setfiletype ruby
        autocmd bufwritepost .vimrc source $MYVIMRC
        autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab
        autocmd Filetype erb setlocal ts=2 sw=2 sts=2 expandtab
        autocmd Filetype ruby setlocal ts=2 sw=2 sts=2 expandtab
        autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
        autocmd Filetype go setlocal ts=4 sw=4 sts=4 noexpandtab
        autocmd Filetype c setlocal ts=4 sw=4 sts=4 noexpandtab
        autocmd Filetype cpp setlocal ts=4 sw=4 sts=4 noexpandtab
        autocmd Filetype yaml setlocal ts=2 sw=2 sts=2 expandtab
        autocmd Filetype coffee setlocal ts=2 sw=2 sts=2 expandtab
        autocmd Filetype cucumber setlocal ts=2 sw=2 sts=2 expandtab
        autocmd Filetype python setlocal ts=2 sw=2 sts=2 expandtab
        autocmd Filetype pug setlocal ts=2 sw=2 sts=2 expandtab
        autocmd Filetype scss setlocal ts=2 sw=2 sts=2 expandtab

        au FileType go nmap <leader>r <Plug>(go-run)
        au FileType go nmap <leader>b <Plug>(go-build)
        au FileType go nmap <leader>t <Plug>(go-test)
        au FileType go nmap <leader>c <Plug>(go-coverage)
        au FileType ruby nnoremap <leader>r :!%:p<CR>
        au FileType ruby nnoremap <leader>l :Rubocop<CR>
endif



set runtimepath^=~/.vim/bundle/ctrlp.vim

if executable('ag')
        " Use Ag over Grep
        set grepprg=ag\ --nogroup\ --nocolor

        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let mapleader = ","
let g:ctrlp_show_hidden = 1
let g:syntastic_coffee_coffeelint_args = "--csv --file config.json"
let g:syntastic_jade_checkers = ['jade_lint']
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:go_fmt_command = "goimports"

map <TAB> :NERDTreeToggle<CR>
nmap <C-o> o<Esc>

function! NumberToggle()
        if(&relativenumber == 1)
                set norelativenumber
        else
                set relativenumber
        endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

if has("autocmd")
        autocmd InsertEnter * :set norelativenumber
        autocmd InsertLeave * :set relativenumber
endif
