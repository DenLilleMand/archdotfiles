packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-scriptease')
call minpac#add('junegunn/fzf')

packloadall

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
nnoremap <C-p> :<C-u>FZF<CR>

