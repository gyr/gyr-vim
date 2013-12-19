""""""""""""""""""""""""""""""""""
"
" Author: Gustavo Yokoyama Ribeiro
" File:   java.vim
" Update: 20100814 03:20:16
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

call gyrlib#ProgTextMode()
setlocal matchpairs+==:;
let java_allow_cpp_keywords = 1

" }}}1
"===============================================================================
" Mapping:{{{1
" check syntax
noremap <buffer><Leader>s :!javac %<CR>

"}}}1
"===============================================================================
if !exists('s:load_java')
    let s:load_java = 1
endif

if s:load_java
    "===============================================================================
    " Functions:{{{1

    "}}}1
    "===============================================================================
endif

let &cpo = s:keep_cpo
unlet s:keep_cpo

" vim: set ft=vim ff=unix fdm=marker :
