""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Author: Gustavo Yokoyama Ribeiro <gyr AT protonmail DOT ch>
" File:   cccs.vim
" Update: 20100814 03:19:53
" (C) Copyright 2010 Gustavo Yokoyama Ribeiro
" Licensed under CreativeCommons Attribution-ShareAlike 3.0 Unsupported
" http://creativecommons.org/licenses/by-sa/3.0/ for more info.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &cp
    finish
endif
let s:keep_cpo = &cpo
set cpo&vim
"===============================================================================
" Abbreviation:{{{1
"nmap <silent><Leader>ct :call <SID>SetFileType("cccs")<CR>
cab <buffer> co,, !cleartool co <C-R>=expand("%:p")<CR><Space><BS>
cab <buffer> unco,, !cleartool unco -rm <C-R>=expand("%:p")<CR><Space><BS>
cab <buffer> ci,, !cleartool ci -nc <C-R>=expand("%:p")<CR><Space><BS>
cab <buffer> cls,, !cleartool ls  <C-R>=expand("%:p")<CR><Space><BS>
cab <buffer> ctree,, !cleartool lsvtree -g <C-R>=expand("%:p")<CR><Space><BS>

" }}}1
"===============================================================================
if !exists('s:load_cccs')
    " do something....
endif
let s:load_cccs = 1


let &cpo = s:keep_cpo
unlet s:keep_cpo

" vim: set ft=vim ff=unix fdm=marker :
