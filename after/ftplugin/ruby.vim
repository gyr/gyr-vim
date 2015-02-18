""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Author: Gustavo Yokoyama Ribeiro <gyr AT protonmail DOT ch>
" File:   ruby.vim
" Update: 20110502 23:57:04
" (C) Copyright 2010 Gustavo Yokoyama Ribeiro
" Licensed under CreativeCommons Attribution-ShareAlike 3.0 Unsupported
" http://creativecommons.org/licenses/by-sa/3.0/ for more info.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &cp
    finish
endif
let s:keep_cpo = &cpo
set cpo&vim

"===============================================================================
" Settings:{{{1

call gyrlib#ProgTextMode()
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" }}}1
"===============================================================================
" Autocommand:{{{1
"au BufWritePre <buffer> call <SID>UpdateDate()

"}}}1
"===============================================================================
" Abbreviation:{{{1
"iab <buffer> ru,, #!/usr/bin/ruby<C-R>=gyrlib#EatChar('\s')<CR>
"iab <buffer> sb,, #!/usr/bin/env ruby<C-R>=gyrlib#EatChar('\s')<CR>
iab <buffer> fh,, <C-R>=gyrlib#AddFh('#', 'short')<CR><C-R>=gyrlib#EatChar('\s')<CR>

"}}}1
"===============================================================================
" Mapping:{{{1
noremap <buffer><Leader>mx :call gyrlib#MakeExecutable()<CR>

"}}}1
"===============================================================================
if !exists('s:load_ruby')
    let s:load_ruby = 1
endif

if s:load_ruby
    "===============================================================================
    " Functions:{{{1
    "function! s:UpdateDate()
    "    if getline(5) =~ "\" Update: "
    "        silent exec "5s/\" Update: .*/\" Update: " . strftime("%Y%m%d %H:%M:%S") . "/"
    "        normal! ``
    "    endif
    "endfunction

    "}}}1
    "===============================================================================
endif

let &cpo = s:keep_cpo
unlet s:keep_cpo

" vim: set ft=vim ff=unix fdm=marker :
