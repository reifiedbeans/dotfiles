colorscheme zellner
set number
set hlsearch

set tabstop=4
set shiftwidth=4

augroup RestoreCursorShapeOnExit
	autocmd!
	autocmd VimLeave * set guicursor=a:hor20
augroup END
