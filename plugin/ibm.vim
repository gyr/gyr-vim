"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Author: Gustavo Yokoyama Ribeiro <gyr AT protonmail DOT ch>
" File:   ibm.vim
" Update: 20100814 03:12:06
" Usage:  To enable theses settings g:IBMLoadSettings shall be non-zero.
" (C) Copyright 2010 Gustavo Yokoyama Ribeiro
" Licensed under CreativeCommons Attribution-ShareAlike 3.0 Unsupported
" http://creativecommons.org/licenses/by-sa/3.0/ for more info.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('g:IBMLoadSettings') || &cp
    finish
endif
let g:IBMLoadSettings = 1
let s:keep_cpo = &cpo
set cpo&vim

"===============================================================================
" Autocmd:{{{1
autocmd BufNewFile,BufRead,BufEnter *.dat set filetype=conf

" }}}1
"===============================================================================
" Abbreviations:{{{1

" }}}1
"===============================================================================

let &cpo = s:keep_cpo
unlet s:keep_cpo

" vim: set ft=vim ff=unix fdm=marker :
