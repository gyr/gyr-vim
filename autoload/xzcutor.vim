""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Author: Gustavo Yokoyama Ribeiro <gyr AT protonmail DOT ch>
" File:   xzcutor.vim
" Update: 20101002 09:42:30
" (C) Copyright 2010 Gustavo Yokoyama Ribeiro
" Licensed under CreativeCommons Attribution-ShareAlike 3.0 Unsupported
" http://creativecommons.org/licenses/by-sa/3.0/ for more info.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('g:loaded_xzcutor') || &cp
    finish
endif
let g:loaded_xzcutor = 1
let s:keep_cpo = &cpo
set cpo&vim

"===============================================================================
" FUNCTIONS:{{{1
"-------------------------------------------------------------------------------
" GLOBAL:{{{2

"function RunMe()
"    if filereadable('Makefile')
"        "excl.mark = suppress jumping on warr/err
"        make!
"        " open quickfix window IF there was any error
"        cwindow
"    else
"        " run current file as a script
"        !./%
"    endif
"endfunction

" xzcutor#VimExecutor:{{{3
function xzcutor#VimExecutor(text_command, ...)
    " a:1 = exec_commnad_start
    " a:2 = exec_command_end
    let l:text_command = a:0 ? a:1.a:text_command.a:2 : a:text_command
    "redir @x>
    redir @">
    echo system(l:text_command)
    redir END
"    if ! &previewwindow
"        let l:temp_file = "~/.vim-tmp/xzcutor_logfile.log"
"        let l:local_dir = $PWD
"        exec "pedit ".l:temp_file
"        silent! wincmd P
"        execute "cd ".l:local_dir
"        execute "r!".l:text_command
"        silent! wincmd p
"    endif

endfunction
"}}}3

" xzcutor#ScreenExecutor:{{{3
function xzcutor#ScreenExecutor(text_command, ...)
    if $STY == ""
        echo "screen is not running."
    else
        call s:ScreenInitVars()
        if s:screen_session != ""
            let l:screen_command = "screen -S ".s:screen_session." -p ".s:screen_window." -X stuff '"
        else
            let l:screen_command = "screen -p ".s:screen_window." -X stuff '"
        endif
        " a:1 = exec_commnad_start
        " a:2 = exec_command_end
        let l:text_command = a:0 ? a:1.a:text_command.a:2 : a:text_command
        echo system(l:screen_command.substitute(l:text_command, "'", "'\\\\''", 'g')."'")
    endif
endfunction
" }}}3

" xzcutor#ScreenSessionCompletion:{{{3
function xzcutor#ScreenSessionCompletion(A,L,P)
    return system("screen -ls | awk '/Attached/ {print $1}'")
endfunction
" }}}3

" xzcutor#ScreenSetVars:{{{3
function xzcutor#ScreenSetVars()
    call s:ScreenInitVars()
    let s:screen_session = input("Session: ", "", "custom,xzcutor#ScreenSessionCompletion")
    let s:screen_window = input("Window: ", s:screen_window)
endfunction
"}}}3

"}}}2
"-------------------------------------------------------------------------------
" LOCAL:{{{2

" ScreenInitVars:{{{3
function! s:ScreenInitVars()
    if !exists("s:screen_session")
        let s:screen_session = ""
    endif
    if !exists("s:screen_window")
        let s:screen_window = "1"
    endif
endfunction
"}}}3

"}}}2
"-------------------------------------------------------------------------------
" }}}1
"===============================================================================

let &cpo = s:keep_cpo
unlet s:keep_cpo

" vim: set ft=vim ff=unix fdm=marker :
