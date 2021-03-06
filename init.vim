"Author info -----------------------------{{{
"Author: DenLilleMand
"Creation Date: 1st of january,  2015
"Description: A lot of the most popular plugins, mainly golang focused right 
"now.
"License: MIT
"}}}
" normal options -------------- {{{
set nocompatible
set encoding=utf8
set rtp+=$GOROOT/misc/vim
" dont show the builtin mode when using airline
set noshowmode
" swap files is kind of annoying if you want several
" terminals open in the same project
set noswapfile
set autowrite " Automatically write before :next, :make etc
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set nobackup " not sure what is being backed up tbh
set autoread " When opening a buffer from multiple terminals i want them to update when saving one
au FocusGained * :checktime
set ignorecase  " make search ignore case
set exrc " load a .nvimrc in workspaces
set nojoinspaces " leave 1 space in join
set cmdheight=2
set hidden
"}}}
" Making sure lines is 80 columns ------------- {{{
set colorcolumn=80
highlight ColorColumn ctermbg=52

"This will make filestyle to highlight tails of lines that are longer than 80
"characters
set textwidth=80
"}}}
" Better split switching --------- {{{
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"}}}
" SwapText script ---------------- {{{
" https://www.vim.org/scripts/script.php?script_id=4971
"{Visual}<Leader>x       Swap the visual selection with the just deleted text.
"<Leader>x{motion}       Swap the characters covered by {motion} with the just "                        deleted text.
"[count]<Leader>xx       Swap the current [count] line(s) with the just deleted
"			 text.
"[count]<Leader>X        Swap the characters under the cursor until the end of
"  			 the line and [count]-1 more lines with the just
" 			 deleted text.
" }}}
" Turn all of the normal filetype settings on ------- {{{
"filetype on
"filetype indent on
"filetype plugin indent on
"}}}
" Basic Settings -------------------------------- {{{
"If this was set to off, the plugins wouldnt be able to do indenting based on
"file type, which is a pretty  big deal i guess? im not sure if some of the
"plugins wouldve overriden this setting anyway?
"filetype indent on

"Sets it on.
set autoindent

"sets the width of the indentation.
set shiftwidth=4

"Does the right thing (mostly) in programs. When its on it makes it so that
"tabs are calculated from shiftwidth from the beginning of the line, so if
"we're at like 1 it would indent 3.
set smartindent


" Turn on line numbering. Turn it off with 'set nonu'
set nu

"Case insensitive search
set ic

" Higlhight search
"set hls

" Wrap text instead of being on one line
set lbr
"}}}
"Abreviations/Aliases ---------------------------- {{{
" }}}
" Non-Plugin mappings -------------------- {{{
"This maps jk to escape, that makes it hard to write jk, but its better than 'typeing escape each time to leave insert mode, anyway, i feel like ESC is "better suited for saveing+quitting a file, while shift-ESC could be :q!
inoremap jk <ESC>

"inoremap ` <ESC>


noremap <C-1> :bfirst
noremap <C-2> :blast

" Close a buffer, it will give a warning if changes has been made to this
" buffer.
nnoremap <leader>bd :bd<CR>

nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k
"is suppose to change buffers with tab and shift-tab. would still be nice
"changeing buffers with a number though. Ctrl+p does it with names so thats
"hardly nessecery.
"nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
"nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

"delete trailing white space:
nnoremap <leader>dws :%s/\s\+$//e<cr>

"nnoremap <leader>pb :execute "vsplit " . bufname("#")<cr>
let mapleader="\\"

nnoremap <leader>s :/\v

nnoremap  <leader>l :s/  \+/ /g <cr>

" Open up current file in chromium
nnoremap <silent> <leader>ch :exec 'silent !open -a "chromium" % &'

"Map <c-u> to back-visual-select eol-caps all, to avoid shift
inoremap <c-u> <esc>0v$U
nnoremap <c-u> 0v$U

"Turn off search highlight
nnoremap <leader>hl :noh<cr>

nnoremap <leader>jk :stop<cr>

" I know that tpope made a very nice plugin
" but i really like the idea that it is this
" easy to do that functionality my self
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>] viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
nnoremap <leader>} viw<esc>a}<esc>hbi{<esc>lel

"where ever we are, this mapping will allways
"point to our .vimrc file and open it in a split window.
" the $MYVIMRC is a variable that allways points to our .vimrc file.
nnoremap <leader>ev :vsplit $MYVIMRC <cr>
"nnoremap <leader>st :execute 'vsplit | term' <cr>

"whenever we make a mapping, we have to quit vim, and enter again,
"to make that easier we're going to map our :source and give it the .vimrc
"variable as parameter, so each time we do it, we compile our .vimrc.
nnoremap <leader>sv :source /home/denlillemand/.config/nvim/init.vim<cr>
" }}}
"Nerdtree settings and mappings ------------------- {{{
"NERDTtree= Tabs configuration.
"NERDTreeTabs on console vim startup
"mapping ctrl n to boot NERDtree
noremap <C-n> :NERDTreeToggle<CR>
"noremap <C-n> :Explore<CR>

" Fix a bug where the node looks weird
let g:NERDTreeNodeDelimiter = "\u00a0"


let g:nerdtree_tabs_open_on_console_startup=1


"Open NERDTree on gvim/macvim startup.
let g:nerdtree_tabs_open_on_gui_startup=1


"Close current tab if there is only one window in it and it's NERDTree
let g:nerdtree_tabs_autoclose=1

"Do not open NERDTree if vim starts in diff mode
let g:nerdtree_tabs_no_startup_for_diff=1

"On Startup, focus NERDTree if opening a directory, focus file if opening a
"file. When set to 2, always focus file window after startup.
let g:nerdtree_tabs_smart_startup_focus=1

"Synchronize view of all NERDTree windows (scroll and cursor position)
let g:nerdtree_tabs_synchronize_view=1

"Synchronize focus when switching windows (focus NERDTree after tab switch if and only if it was focused before tab switch)
let g:nerdtree_tabs_synchronize_focus=1

"Open NERDTree on new tab creation (if NERDTree was globally opened by :NERDTreeTabsToggle)
let g:nerdtree_tabs_open_on_new_tab=1

"Unfocus NERDTree when leaving a tab for descriptive tab names
let g:nerdtree_tabs_meaningful_tab_names=1

"When switching into a tab, make sure that focus is on the file window, not in the NERDTree window. (Note that this can get
"annoying if you use NERDTree's feature 'open in new tab silently', as you will lose focus on the NERDTree.)
let g:nerdtree_tabs_focus_on_files=0

"When given a directory name as a command line parameter when launching Vim, :cd into it.
let g:nerdtree_tabs_startup_cd=1

"Automatically find and select currently opened file in NERDTree.
let g:nerdtree_tabs_autofind=0

"This is suppose to make sure that each time we change the CWD with nerdtree,
"it makes it so that ctrlP only looks for files in that subDirectory with
"fuzzy search. what we should be interested in, would be to figuire out how to
"exclude surden files. like a gitIgnore, forexample if we have a huge library
"in our subdir, like most project folders has, like Node, or something like
"that, usually fuzzy search will find everything, especially with regex. which
"is obviously a problem
let g:NERDTreeChDirMode       = 2
" }}}
"Airline settings and mappings ----------------------- {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'
"}}}
" Vim-latex ------------------- {{{
"In some cases it will detect a file with the 'tex' suffix as plaintex, to
"prevent this we set the following setting:
let g:vimtex_enable = 1
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor='latex'
"}}}
" sql --------------- {{{
au BufRead /tmp/psql.edit.* set syntax=sql
"}}}

syntax off
hi default CocUnderline    cterm=underline gui=underline
hi default CocErrorSign    ctermfg=Red     guifg=#000000
hi default CocWarningSign  ctermfg=Brown   guifg=#000000
hi default CocInfoSign     ctermfg=Yellow  guifg=#000000
hi default CocHintSign     ctermfg=Blue    guifg=#000000
hi default CocSelectedText ctermfg=Red     guifg=#000000
hi default CocCodeLens     ctermfg=Gray    guifg=#000000
" #999999
hi default link CocErrorFloat       CocErrorSign
hi default link CocWarningFloat     CocWarningSign
hi default link CocInfoFloat        CocInfoSign
hi default link CocHintFloat        CocHintSign
hi default link CocErrorHighlight   CocUnderline
hi default link CocWarningHighlight CocUnderline
hi default link CocInfoHighlight    CocUnderline
hi default link CocHintHighlight    CocUnderline
hi default link CocListMode ModeMsg
hi default link CocListPath Comment
hi default link CocFloating Pmenu

" let syntax_list = ['python', 'go']
" autocmd BufWrite,BufRead * if index(syntax_list, &ft) > -1 | set syntax=off | else | set syntax=on |
autocmd BufRead,VimEnter * syntax off

set shiftwidth=4

" let syntax_list = ['python', 'go']
" autocmd BufWrite,BufRead * if index(syntax_list, &ft) > -1 | set syntax=off | else | set syntax=on |
autocmd BufRead,VimEnter * syntax off
" Zoom / Restore window. ------------ {{{
"function! s:ZoomToggle() abort
    "if exists('t:zoomed') && t:zoomed
        "execute t:zoom_winrestcmd
        "let t:zoomed = 0
    "else
        "let t:zoom_winrestcmd = winrestcmd()
        "resize
        "vertical resize
        "let t:zoomed = 1
    "endif
"endfunction
"command! ZoomToggle call s:ZoomToggle()
"nnoremap <silent> <C-A> :ZoomToggle<CR>
"}}}
" Cursor line --------------{{{
set cursorline
"}}}
"neo-vim specific ------------- {{{
if has('nvim')
"vim-auto-save---------------------{{{
"let g:auto_save = 1  " enable AutoSave on Vim startup
"let g:auto_save_events = ["InsertLeave", "TextChanged"]
"}}}
"Cursor ---------------------{{{
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175
"}}}
"C specific things ------------- {{{
"let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

"let g:deoplete#source#clang#clang_header = '/usr/lib/clang/4.0.1/lib/linux/libclang_rt.dyndd-x86_64.so'
"}}}
map <leader>l :split<cr><leader>d
" Omnifunc plugin -------------{{{
" Ctrl-Space for completions. Heck Yeah!
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
        \ "" :
        \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
        \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
        \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <C-J> ("\<C-N>")
inoremap <expr> <C-K> ("\<C-P>")
"}}}
"YAML----------------------_{{{
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"}}}
"Vim-plug -------------------- {{{
call plug#begin('$HOME/.config/nvim/plugged')

    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-fugitive'

    Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}

    "Plug '907th/vim-auto-save'


    "neovim dev plugs
    "Plug 'tweekmonster/deoplete-clang2'
    "Plug 'dbakker/vim-lint'
    "Plug 'neomake/neomake'
    "Plug 'tweekmonster/helpful.vim'
    "Plug 'tbastos/vim-lua'
    "Plug 'tweekmonster/nvimdev.nvim'

    "go
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'fatih/vim-go', { 'for':'go', 'do': ':GoUpdateBinaries' }
    Plug 'mdempsky/gocode', { 'for':'go', 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
    "Plug 'deoplete-plugins/deoplete-go', { 'for':'go', 'do': 'make' }
    "Plug 'sebastianmarkow/deoplete-rust'

    "low contrast colorscheme
    "To work permanently do a symlink between it's
    Plug 'junegunn/seoul256.vim'

    "Only focus on one function
    Plug 'junegunn/limelight.vim', { 'for':['go','python'] }


    "vimscript
    Plug 'Shougo/neco-vim'

    "general
    Plug 'rhysd/vim-grammarous'
    Plug 'powerman/vim-plugin-ansiesc'
    Plug 'airblade/vim-gitgutter'
    Plug 'Shougo/neoinclude.vim'
    "Plug 'deoplete-plugins/libclang-python3'
    Plug 'posva/vim-vue', { 'for':'vue' }
    Plug 'pangloss/vim-javascript', { 'for':'javascript' }
    Plug 'w0rp/ale', { 'for': ['go','python'] }
    Plug 'tpope/vim-markdown', { 'for': 'md' }
    Plug 'amix/open_file_under_cursor.vim'
    Plug 'vim-scripts/nginx.vim', { 'for':'conf' }
    Plug 'maxbrunsfeld/vim-yankstack'


    Plug 'rkitover/vimpager'
    Plug 'mileszs/ack.vim'
    Plug 'majutsushi/tagbar'

    "organisational
    Plug 'jceb/vim-orgmode'

    "fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    "python
    Plug 'fisadev/vim-isort', { 'for':'python' }

    " latex plugin for university
    Plug 'lervag/vimtex', { 'for':'tex' }

    " snippets
    Plug 'SirVer/ultisnips', { 'for':['python','go'] }
    Plug 'honza/vim-snippets', { 'for':['python','go'] }

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'

    Plug 'google/vim-searchindex'
    Plug 'farmergreg/vim-lastplace'

    Plug 'junegunn/goyo.vim'

    " unused
    "Plug 'ctrlpvim/ctrlp.vim'
    "Plug 'easymotion/vim-easymotion'
    "Plug 'kshenoy/vim-signature'
    "Plug 'tell-k/vim-autopep8'
    "Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    "Plug 'flowtype/vim-flow', { 'do': 'npm install -g flow-bin'}
    "Plug 'terryma/vim-multiple-cursors'
    "Plug 'amirh/html-autoclosetag'

call plug#end()
" }}}
"Theme settings -------------------- {{{
"colo seoul256
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let guicursor=1
set termguicolors
"set background=dark
"}}}
"some neovim mappings for yanking and pasting ------------ {{{
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
"}}}
"Other plugin configurations-----------------{{{
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_next_key='<leader>m'
"let g:multi_cursor_prev_key='<leader>p'
"let g:multi_cursor_skip_key='<leader>x'
"let g:multi_cursor_quit_key='<leader>e'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"if executable('ag')
  "let g:ackprg = 'ag --vimgrep'
"endif

"}}}
"vim-go ---------------- {{{
" wrap long lines in quickfix
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END"


" create a go doc comment based on the word under the cursor
function! s:create_go_doc_comment()
  norm "zyiw
  execute ":put! z"
  execute ":norm I// \<Esc>$"
endfunction
"nnoremap <leader>ui :<C-u>call <SID>create_go_doc_comment()<CR>


"configuration:
let g:go_def_mode = "guru"
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_structs = 1
let g:go_echo_command_info = 1
let g:go_gocode_autobuild = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "snakecase"

if !executable('ctags')
  finish
elseif globpath(&rtp, 'plugin/tagbar.vim') == ""
  finish
endif

if !exists("g:go_gotags_bin")
  let g:go_gotags_bin = "gotags"
endif



function! SetTagbar()
  let bin_path = go#path#CheckBinPath(g:go_gotags_bin)
  if empty(bin_path)
    return
  endif

  if !exists("g:tagbar_type_go")
    let g:tagbar_type_go = {
          \ 'ctagstype' : 'go',
          \ 'kinds'     : [
          \ 'p:package',
          \ 'i:imports',
          \ 'c:constants',
          \ 'v:variables',
          \ 't:types',
          \ 'n:interfaces',
          \ 'w:fields',
          \ 'e:embedded',
          \ 'm:methods',
          \ 'r:constructor',
          \ 'f:functions'
          \ ],
          \ 'sro' : '.',
          \ 'kind2scope' : {
          \ 't' : 'ctype',
          \ 'n' : 'ntype'
          \ },
          \ 'scope2kind' : {
          \ 'ctype' : 't',
          \ 'ntype' : 'n'
          \ },
          \ 'ctagsbin'  : bin_path,
          \ 'ctagsargs' : '-sort -silent'
          \ }
  endif
endfunction

" Error and warning signs.
let g:ale_sign_error = '⚠'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

let g:ale_lint_on_enter = 1
"let g:ale_open_list = 1
nnoremap <leader>an :ALENext<CR>
nnoremap <leader>ap :ALEPrevious<CR>

" Python ----------------- {{{
let g:ale_fix_on_save = 0

"let g:ale_python_pylint_options = '--load-plugins pylint_django'
let g:ale_linters_explicit = 1
let g:ale_linters = {'python':['flake8']}
let g:ale_fixers = {
\   '*': [ 'remove_trailing_lines', 'trim_whitespace'],
\   'python': ['isort']
\}
"\   'python': ['isort', 'yapf']
"}}}

"Help mappings:
"Go mappings(maybe i should move them into filetype specific, but then again
"i sometimes open nvim in a go repository with no files open and want to run
"nnoremap <silent> <leader>d :GoDef<cr>
"nnoremap <leader>gb :GoBuild<cr>
"nnoremap <leader>r :GoRun<cr>
"nnoremap <leader>i :GoInstall<cr>
"nnoremap <leader>l :GoLint<cr>
"nnoremap <leader>gr :GoReferrers<cr>
"nnoremap <leader>gc :GoCallees<cr>
"nnoremap <leader>gi :GoImplements<cr>
"nnoremap <leader>gde :GoDecls<cr>
"nnoremap <leader>gdd :GoDeclsDir<cr>
"nnoremap <leader>o :GoDefPop<cr>
"nnoremap <leader>a :GoAlternate<cr>
"nnoremap <leader>tf :GoTestFunc<cr>
"nnoremap <leader>gd :GoDoc<cr>
"}}}
"GoCode configuration --------------- {{{
"GoCode is configured through json somewhere at ~/.config/gocode
"Basically gocode when installed puts it self in your cmdline right,
"so you just have to call the following settings on it:
"gocode set propose-builtins true
"gocode set lib-path vendor
"gocode set autobuild true
"}}}
" Relative numbers ---------------- {{{
function! NumberToggle()
    if &rnu == 1
       set nornu
    elseif &nu == 1
       set rnu
    else
       set nu
    endif
endfunc

"If i want vim to toggle it depending on insert/normal mode
"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber

nnoremap <C-r> :call NumberToggle()<cr>
"}}}
" Search settings ------------{{{
"ag
let g:ag_highlight = 1
let g:ackhighlight = 1
"let g:airline#extensions#tabline#enabled = 1

"Ack configuration
cnoreabbrev Ack Ack!

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

function! CmdLine(str)

    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction






" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

"ctrlP
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'
map <c-b> :CtrlPBuffer<cr>
"}}}
" EasyMotion -----------{{{
" <Leader>f{char} to move to {char}
"map  <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
"nmap s <Plug>(easymotion-overwin-f2)

" Move to line
"map <Leader>L <Plug>(easymotion-bd-jk)
"nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)
"}}}
"Tabs ------------- {{{
map <leader>tn :+tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabnext<cr>
map <leader>tb :tabprevious<cr>
"}}}
let g:python3_host_prog = '/usr/bin/python3.7'
let g:python_host_prog = '/usr/bin/python2.7'

"let g:vim_isort_python_version = 'python3'
"function! AddCWDToPythonPath()
	"execute "python3 import os, sys; sys.path.append(os.getcwd())"
	"execute "python import os, sys; sys.path.append(os.getcwd())"
"endfunction
" Neovim Terminal ---------- {{{
"highlight TermCursor ctermfg=red guifg=red
"function! s:OpenTerminals() abort
    "call vsplit terminal
"endfunction
"command! ZoomToggle call s:ZoomToggle()



tnoremap <Esc> <C-\><C-n>
"let g:terminal_color_0  = '#2e3436'
"let g:terminal_color_1  = '#cc0000'
"let g:terminal_color_2  = '#4e9a06'
"let g:terminal_color_3  = '#c4a000'
"let g:terminal_color_4  = '#3465a4'
"let g:terminal_color_5  = '#75507b'
"let g:terminal_color_6  = '#0b939b'
"let g:terminal_color_7  = '#d3d7cf'
"let g:terminal_color_8  = '#555753'
"let g:terminal_color_9  = '#ef2929'
"let g:terminal_color_10 = '#8ae234'
"let g:terminal_color_11 = '#fce94f'
"let g:terminal_color_12 = '#729fcf'
"let g:terminal_color_13 = '#ad7fa8'
"let g:terminal_color_14 = '#00f5e9'
"let g:terminal_color_15 = '#eeeeec'
set shell=/bin/zsh
"command! -nargs=* T split | terminal <args>
"command! -nargs=* VT vsplit | terminal <args>
nnoremap <leader>ts :vsplit term://zsh<cr>

"}}}
" UltiSnips -----------------{{{

"I thouth the following was required, but it
"doesn't seem to work
"let g:UltiSnipsSnippetsDir=$HOME.'.config/nvim/mysnips'

" This is the default value i am just overwriting
" with the default. I made my own snippets work with kind
" of a hack because i just made a folder myself called
" UltiSnips which it then looks inside. Trying to add e.g.
" MySnips did not help even though i added it inside of the
" rtp
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-w>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"let g:UltiSnipsListSnippets="<c-l>"

"}}}
" junegunn/fzf with RipGrep and tags ----------- {{{

" My own mapping:
" Trigger a fuzzy/regex searcher
nnoremap <leader>rg :Rg<cr>
nnoremap <leader>rf :Rg --files<cr>

" Trigger searching through tags
" so finding functions, classes, definitions etc.
" is much faster
nnoremap <leader>t :Tags<cr>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
"}}}
" lastplace ------------{{{
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
let g:lastplace_ignore_buftype = "quickfix,nofile,help"
let g:lastplace_open_folds = 0

"}}}
endif
"}}}
"Terminal -------------------------- {{{
"tnoremap <c-w><c-h> <c-\><c-n><c-w>h
"tnoremap <c-w><c-j> <c-\><c-n><c-w>j
"tnoremap <c-w><c-k> <c-\><c-n><c-w>k
"tnoremap <c-w><c-l> <c-\><c-n><c-w>l

"tnoremap <c-w><c-w> <c-\><c-n>
"tnoremap <c-Space> <c-\><c-n>
"nmap <c-t><c-t> :vsplit+terminal<CR>
"}}}
packadd vimball
" Filetype specific settings --------------------- {{{

"let whitelist = ['go', 'python']
"autocmd BufRead * if index(whitelist, &ft) > 0 | Limelight | else |  Limelight! |

autocmd BufRead,BufNewFile /etc/nginx/sites-*/* setfiletype conf

augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=0 expandtab
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=0 expandtab
"}}}
"Gopher stuff ------- {{{
"deoplete(for auto-completion in nvim ------------ {{{
"set completeopt+=noselect
"let g:deoplete#enable_at_startup=1
"let g:deoplete#auto_completion_start_length = 1
"let g:deoplete#enable_smart_case = 1
"let g:deoplete#enable_auto_close_preview = 1
"}}}
"let g:jedi#completions_enabled = 1
"let g:jedi#popup_on_dot = 1
"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
"let g:deoplete#sources = {}
"let g:deoplete#sources.go = ['buffer', 'go']
"}}}
"Limelight ----------------- {{{
"let whitelist = ['go', 'python']
"autocmd BufRead * if index(whitelist, &ft) > -1 | Limelight | else |  Limelight! |
"}}}

nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>y <Plug>(coc-type-definition)
nmap <silent> <leader>i <Plug>(coc-implementation)
nmap <silent> <leader>r <Plug>(coc-references)

" Disable escape
inoremap <Esc> <Nop>
" Bind exit insert mode to jj
inoremap jj <Esc>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

autocmd FileType gitcommit setlocal spell
nnoremap <leader>k :cal SpellSuggest()<CR>
function! SpellSuggest()
  let s = substitute(system("echo ".expand("<cword>")." | aspell -a -W2 | grep '^&'"), "^.*:\\s\\(.*\\)\\n", "\\1,", "")
  if s != ""
    let slength = strlen(s)
    let end = 0
    let i = 0
    while end != slength
      let i = i + 1
      let w = matchstr(s, "^\\%(.\\{-}\\zs[^ ,]\\+\\ze,\\)\\{".i."}")
      echon "(".i.")".w." "
      let end = matchend(s, w.",")
    endwhile
    echo ""
    let c = input("Replace with: ")
    if c =~ "^[1-9]\\d*$" && c > 0 && c <= i
      execute "normal! ciw".matchstr(s, "^\\%(.\\{-}\\zs[^ ,]\\+\\ze,\\)\\{".c."}")
    endif
  else
    echo "No suggestions"
  endif
endfunction

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

