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
" Settings:{{{1
set path+=$HOME/.ibm.d/**
set path+=$HOME/work/powerkvm/kop/**

" Plugin:{{{2

" Vimwiki: {{{3
if isdirectory($HOME."/.vim/bundle/vimwiki")
    let ibm_wiki = {}
    let ibm_wiki.path = '~/.ibm.d/vimwiki/'
    let ibm_wiki.path_html = '~/.ibm.d/public_html/'
    let ibm_wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sh': 'sh', 'perl': 'perl', 'conf': 'conf', 'fstab': 'fstab', 'deb': 'debsources', 'resolv': 'resolv', 'xml': 'xml'}
    let ibm_list = [ibm_wiki]
    let g:vimwiki_list = g:vimwiki_list + ibm_list
endif

" }}}1
"===============================================================================
" Autocmd:{{{1
augroup Ibm
    autocmd BufNewFile,BufRead,BufEnter *.dat set filetype=conf
    autocmd FileType python
                \ let b:pylintrc = findfile('pylintrc', '/home/gyr/work/powerkvm/kop/.;') |
                \ if b:pylintrc != '' |
                \   let b:syntastic_python_pylint_args='--rcfile='.b:pylintrc |
                \ endif
augroup END

" }}}1
"===============================================================================
" Mapping:{{{1
"nnoremap <unique><Leader>ei :edit $HOME/.ibm.d/**/*

" }}}1
"===============================================================================
" Abbreviations:{{{1

cab ei,, edit $HOME/.ibm.d/**/*<C-R>=gyrlib#EatChar('\s')<CR>
cab ek,, edit $HOME/work/pkvm/kop/**/*<C-R>=gyrlib#EatChar('\s')<CR>
cab et,, edit $HOME/work/pkvm/ibm-kvm-tools/**/*<C-R>=gyrlib#EatChar('\s')<CR>
cab er,, edit $HOME/work/pkvm/ibm-kvm-rpm/**/*<C-R>=gyrlib#EatChar('\s')<CR>
cab ew,, edit $HOME/work/repos/wok/**/*<C-R>=gyrlib#EatChar('\s')<CR>

" }}}1
"===============================================================================

let &cpo = s:keep_cpo
unlet s:keep_cpo

" vim: set ft=vim ff=unix fdm=marker :
