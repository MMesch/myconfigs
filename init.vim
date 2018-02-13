"this is to prevent strange signs appearing in nvim
set guicursor=

"some basic options
set shiftwidth=4
set expandtab
set nowrap
set colorcolumn=80

"let &colorcolumn=join(range(80, 999), ",")

" autopep 8 when hitting gq
au FileType python setlocal formatprg=autopep8\ --aggressive\ -

"fold options:
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

syntax on
filetype plugin indent on

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
Plug 'parsonsmatt/intero-neovim'
Plug 'haskell-vim'
" {{{
    let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
    let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
    let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
    let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
    let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
    let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
    let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
" }}}
Plug 'neomake/neomake'
" {{{
    let g:neomake_python_enabled_makers = ['flake8']

    hi NeomakeError cterm=underline
    hi NeomakeWarning cterm=underline
    hi NeomakeErrorSign ctermfg=Black
    hi NeomakeWarningSign ctermfg=Black
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
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
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
