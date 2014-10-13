syntax on
set number
set expandtab
set smartindent
set background=dark

au BufRead,BufNewFile *.coffee set filetype=coffee

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd Filetype go setlocal ts=4 sw=4 noexpandtab
autocmd Filetype c setlocal ts=4 sw=4 noexpandtab
autocmd Filetype cpp setlocal ts=4 sw=4 noexpandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype coffee setlocal ts=2 sw=2 expandtab
