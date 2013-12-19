""""""""""""""""""""""""""""""""""
"
" Author: Gustavo Yokoyama Ribeiro
" File:   javascript.vim
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

call gyrlib#ProgTextMode()

" Indents are 4 spaces
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

" Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99

" And they really are spaces, *not* tabs
setlocal expandtab

" }}}1
"===============================================================================
" Mapping:{{{1

"}}}1
"===============================================================================
if !exists('s:load_c')
    let s:load_c = 1
endif

if s:load_c
    "===============================================================================
    " Functions:{{{1

    "}}}1
    "===============================================================================
endif

let &cpo = s:keep_cpo
unlet s:keep_cpo

" vim: set ft=vim ff=unix fdm=marker :
