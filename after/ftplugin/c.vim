""""""""""""""""""""""""""""""""""
"
" Author: Gustavo Yokoyama Ribeiro
" File:   c.vim
" Update: 20100814 03:20:08
" (C) Copyright 2010 Gustavo Yokoyama Ribeiro
" Licensed under CreativeCommons Attribution-ShareAlike 3.0 Unsupported
" http://creativecommons.org/licenses/by-sa/3.0/ for more info.
"
""""""""""""""""""""""""""""""""""

if &cp
    finish
endif
let s:keep_cpo = &cpo
set cpo&vim
"===============================================================================
" Settings:{{{1

"setlocal omnifunc& omnifunc=ccomplete#Complete
setlocal matchpairs+==:;

setlocal path+=/usr/include

call gyrlib#ProgTextMode()

" This makes doxygen comments work the same as regular comments
setlocal comments-=://
setlocal comments+=:///,://

" Indents are 4 spaces
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

" And they really are spaces, *not* tabs
setlocal expandtab

" include c tags
setlocal tags+=,~/.vim-tmp/tags/ctags
" regenerate tags
"call system("ctags -R -f ~/.vim/tags/ctags /usr/include")

" Highlight strings inside C comments
let c_comment_strings=1

" }}}1
"===============================================================================
" Mapping:{{{1
noremap <buffer><Leader>a :call <SID>SwitchFile()<CR>
noremap <buffer><Leader>[[ :call <SID>FindFunctionDefinition(-1)<CR>
noremap <buffer><Leader>]] :call <SID>FindFunctionDefinition(1)<CR>
" check syntax
noremap <buffer><Leader>s :!gcc -fsyntax-only %<CR>

"}}}1
"===============================================================================
if !exists('s:load_c')
    let s:load_c = 1
endif

if s:load_c
    "===============================================================================
    " Functions:{{{1
    function! s:SwitchFile()
        let l:extensao=expand("%:e")
        let l:arquivo=expand("%:r")

        if l:extensao == 'h'
            execute("find ".l:arquivo.".cpp")
        elseif l:extensao == 'cpp'
            execute("find ".l:arquivo.".h")
        endif
    endfunction

    function! s:FindFunctionDefinition(dir)
        let l:lastpattern = @/
        if a:dir==-1
            ?^\(\a.*(\_[^\)]*) *\)\{,1\}{
        elseif a:dir==1
            /^\(\a.*(\_[^\)]*) *\)\{,1\}{
        endif
        let @/ = l:lastpattern
    endfunction

    "}}}1
    "===============================================================================
endif

let &cpo = s:keep_cpo
unlet s:keep_cpo

" vim: set ft=vim ff=unix fdm=marker :
