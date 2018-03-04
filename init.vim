"this is to prevent strange signs appearing in nvim
set guicursor=

"some basic options
set nowrap
set colorcolumn=80
set fo=aw2tq

"let &colorcolumn=join(range(80, 999), ",")


"fold options:
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

syntax on
filetype plugin indent on

" autopep 8 when hitting gq
" au FileType python setlocal formatprg=autopep8\ --aggressive\ -
au FileType python setlocal fo=jctroql
au FileType python setlocal expandtab shiftwidth=4 tabstop=4 smartindent
au FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with

"enable mouse in all modes:
set mouse=a 

"enable x window clipboard
set clipboard=unnamedplus

function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

"define dummy sign to always show Sign Column
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

"define plugins with options
call plug#begin('~/.vim/plugged')
Plug 'tell-k/vim-autopep8'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
Plug 'majutsushi/tagbar'
"{{{
    let g:tagbar_width = 30
"}}}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/indentpython'
Plug 'tmhedberg/SimpylFold'
"{{{
"}}}
Plug 'janko-m/vim-test'
"{{{
"}}}
Plug 'sbdchd/neoformat'
" {{{
    let g:neoformat_enabled_python = ['yapf']
" }}}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" {{{
    let g:deoplete#enable_at_startup = 1
" }}}
Plug 'zchee/deoplete-jedi'
" {{{
" }}}
Plug 'https://github.com/Shougo/echodoc.vim.git'
" {{{
    set cmdheight=2    " DOES NOT WORK
    set noshowmode    " DOES WORK
    let g:echodoc_enable_at_startup = 1
" }}}
Plug 'neomake/neomake'
" {{{
    let g:neomake_python_enabled_makers = ['flake8']

    hi NeomakeError cterm=underline
    hi NeomakeWarning cterm=underline
    hi NeomakeErrorSign ctermfg=Red
    hi NeomakeWarningSign ctermfg=Red
    autocmd! BufWritePost * Neomake
" }}}
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-smooth-scroll'
"{{{
  noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
  noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
  noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
  noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"}}}
call plug#end()

""""" COLORSCHEME
hi Normal guibg=none ctermbg=none
hi NonText guibg=none ctermbg=none

"folds:
hi Folded ctermfg=Grey
hi Folded ctermbg=200

"lines:
hi StatusLine cterm=none gui=none ctermbg=none ctermfg=Black
hi SignColumn ctermbg=none
hi ColorColumn ctermbg=Black

"diffs:
hi DiffChange ctermfg=Green ctermbg=Blue
hi DiffAdd ctermfg=Green ctermbg=Blue
hi DiffDelete ctermfg=Red ctermbg=Black
hi DiffText ctermfg=Blue ctermbg=Black

"selection:
hi Visual cterm=bold ctermbg=Black

"spells:
hi clear SpellBad
hi SpellBad cterm=underline
