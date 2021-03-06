""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Author: Gustavo Yokoyama Ribeiro <gyr AT protonmail DOT ch>
" File:   gyr_color.vim
" Update: 20101101 16:41:33
" (C) Copyright 2010 Gustavo Yokoyama Ribeiro
" Licensed under CreativeCommons Attribution-ShareAlike 3.0 Unsupported
" http://creativecommons.org/licenses/by-sa/3.0/ for more info.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" First remove all existing highlighting.
if exists("syntax_on")
  syntax reset
endif
hi clear

" allow italic fonts inside tmux
set t_ZH=[3m
set t_ZR=[23m

let colors_name = "gyrcolor"
let g:gyr_colorscheme = 'green'

if has("gui_running")
    let s:colordict = {
                \'black'      : '#231f20',
                \'darkred'    : '#ff0000',
                \'darkgreen'  : '#63c94a',
                \'darkyellow' : '#f78d1f',
                \'darkblue'   : '#3158af',
                \'darkmagenta': '#d6058d',
                \'darkcyan'   : '#26b7b0',
                \'gray'       : '#dedede',
                \'darkgray'   : '#a7a6a6',
                \'red'        : '#ee551c',
                \'green'      : '#b3e763',
                \'yellow'     : '#fbe17e',
                \'blue'       : '#35bee8',
                \'magenta'    : '#f899d1',
                \'cyan'       : '#66cdda',
                \'white'      : '#ffffff',
                \}
else
    let s:colordict = {
                \'black'      : 0,
                \'darkred'    : 1,
                \'darkgreen'  : 2,
                \'darkyellow' : 3,
                \'darkblue'   : 4,
                \'darkmagenta': 5,
                \'darkcyan'   : 6,
                \'gray'       : 7,
                \'darkgray'   : 8,
                \'red'        : 9,
                \'green'      : 10,
                \'yellow'     : 11,
                \'blue'       : 12,
                \'magenta'    : 13,
                \'cyan'       : 14,
                \'white'      : 15,
                \}
endif

if g:gyr_colorscheme == 'blue'
    let s:local_colorscheme = {
                \'linenr'      : s:colordict['gray'],
                \'statusline'  : s:colordict['blue'],
                \'statuslinenc': s:colordict['darkblue'],
                \'vertsplit'   : s:colordict['darkblue'],
                \'constant'    : s:colordict['cyan'],
                \'identifier'  : s:colordict['blue'],
                \'statement'   : s:colordict['darkblue'],
                \'type'        : s:colordict['darkcyan'],
                \}
elseif g:gyr_colorscheme == 'cyan'
    let s:local_colorscheme = {
                \'linenr'      : s:colordict['darkcyan'],
                \'statusline'  : s:colordict['cyan'],
                \'statuslinenc': s:colordict['darkcyan'],
                \'vertsplit'   : s:colordict['darkcyan'],
                \'constant'    : s:colordict['cyan'],
                \'identifier'  : s:colordict['green'],
                \'statement'   : s:colordict['darkcyan'],
                \'type'        : s:colordict['darkgreen'],
                \}
elseif g:gyr_colorscheme == 'red'
    let s:local_colorscheme = {
                \'linenr'      : s:colordict['gray'],
                \'statusline'  : s:colordict['red'],
                \'statuslinenc': s:colordict['darkred'],
                \'vertsplit'   : s:colordict['darkred'],
                \'constant'    : s:colordict['gray'],
                \'identifier'  : s:colordict['red'],
                \'statement'   : s:colordict['darkred'],
                \'type'        : s:colordict['magenta'],
                \}
    if &background == "light"
        let s:local_colorscheme['constant'] = s:colordict['darkgray']
    endif
elseif g:gyr_colorscheme == 'green'
    let s:local_colorscheme = {
                \'linenr'      : s:colordict['gray'],
                \'statusline'  : s:colordict['green'],
                \'statuslinenc': s:colordict['darkgreen'],
                \'vertsplit'   : s:colordict['darkgreen'],
                \'constant'    : s:colordict['darkcyan'],
                \'identifier'  : s:colordict['green'],
                \'statement'   : s:colordict['darkgreen'],
                \'type'        : s:colordict['darkcyan'],
                \}
endif

if &background == "dark"
    let s:foregroundcolor = s:colordict['white']
    let s:backgroundcolor = s:colordict['black']
    let s:commentcolor = s:colordict['darkgray']
else
    let s:foregroundcolor = s:colordict['black']
    let s:backgroundcolor = s:colordict['white']
    let s:commentcolor = s:colordict['darkgray']
endif

if ! has("gui_running")
    exec "hi SignColumn   cterm=none              ctermfg=".s:colordict['white']."   ctermbg=".s:colordict['black']
    exec "hi SpecialKey   cterm=underline         ctermfg=".s:colordict['darkred']
    exec "hi NonText      cterm=underline         ctermfg=".s:colordict['darkgreen']
    exec "hi Search       cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['yellow']
    exec "hi LineNr       cterm=underline,reverse ctermfg=".s:local_colorscheme['linenr']
    exec "hi StatusLine   cterm=reverse           ctermfg=".s:local_colorscheme['statusline']."   ctermbg=".s:colordict['black']
    exec "hi User1        cterm=reverse           ctermfg=".s:local_colorscheme['statuslinenc']." ctermbg=".s:colordict['white']
    exec "hi StatusLineNC cterm=reverse           ctermfg=".s:local_colorscheme['statuslinenc']." ctermbg=".s:colordict['white']
    exec "hi VertSplit    cterm=reverse           ctermfg=".s:local_colorscheme['vertsplit']."    ctermbg=".s:colordict['black']
    exec "hi Visual       cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['gray']
    exec "hi WarningMsg   cterm=none              ctermfg=".s:colordict['yellow']."  ctermbg=".s:colordict['darkgray']
    exec "hi Folded       cterm=none              ctermfg=".s:colordict['black']
    exec "hi FoldColumn   cterm=none              ctermfg=".s:colordict['black']
    exec "hi DiffAdd      cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['green']
    exec "hi DiffChange   cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['yellow']
    exec "hi DiffDelete   cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['red']
    exec "hi DiffText     cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['magenta']
    exec "hi SpellBad     cterm=none              ctermfg=".s:colordict['darkyellow']."   ctermbg=".s:colordict['darkred']
    exec "hi Pmenu        cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['gray']
    exec "hi PmenuSel     cterm=none              ctermfg=".s:colordict['white']."   ctermbg=".s:colordict['darkred']
    exec "hi TabLine      cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['darkgray']
    exec "hi TabLineFill  cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['darkgray']
    exec "hi TabLineSel   cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['gray']
    exec "hi MatchParen   cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['darkred']
    exec "hi Comment      cterm=italic            ctermfg=".s:commentcolor
    exec "hi Constant     cterm=italic            ctermfg=".s:local_colorscheme['constant']
    exec "hi Special      cterm=none              ctermfg=".s:colordict['blue']
    exec "hi Identifier   cterm=none              ctermfg=".s:local_colorscheme['identifier']
    exec "hi Statement    cterm=none              ctermfg=".s:local_colorscheme['statement']
    exec "hi PreProc      cterm=none              ctermfg=".s:colordict['darkmagenta']
    exec "hi Type         cterm=none              ctermfg=".s:local_colorscheme['type']
    exec "hi Error        cterm=none              ctermfg=".s:colordict['white']."   ctermbg=".s:colordict['darkred']
    exec "hi Normal       cterm=none              ctermfg=".s:foregroundcolor."      ctermbg=".s:backgroundcolor
    exec "hi Cursor       cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['green']
else
    exec "hi SignColumn   gui=none              guifg=".s:colordict['white']."   guibg=".s:colordict['black']
    exec "hi SpecialKey   gui=underline         guifg=".s:colordict['darkred']
    exec "hi NonText      gui=underline         guifg=".s:colordict['darkgreen']
    exec "hi Search       gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['yellow']
    exec "hi LineNr       gui=underline,reverse guifg=".s:local_colorscheme['linenr']
    exec "hi StatusLine   gui=reverse           guifg=".s:local_colorscheme['statusline']."   guibg=".s:colordict['black']
    exec "hi User1        gui=reverse           guifg=".s:local_colorscheme['statuslinenc']." guibg=".s:colordict['white']
    exec "hi StatusLineNC gui=reverse           guifg=".s:local_colorscheme['statuslinenc']." guibg=".s:colordict['white']
    exec "hi VertSplit    gui=reverse           guifg=".s:local_colorscheme['vertsplit']."    guibg=".s:colordict['black']
    exec "hi Visual       gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['gray']
    exec "hi WarningMsg   gui=none              guifg=".s:colordict['yellow']."  guibg=".s:colordict['darkgray']
    exec "hi Folded       gui=none              guifg=".s:colordict['black']
    exec "hi FoldColumn   gui=none              guifg=".s:colordict['black']
    exec "hi DiffAdd      gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['green']
    exec "hi DiffChange   gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['yellow']
    exec "hi DiffDelete   gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['red']
    exec "hi DiffText     gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['magenta']
    exec "hi SpellBad     gui=none              guifg=".s:colordict['darkyellow']."   guibg=".s:colordict['darkred']
    exec "hi Pmenu        gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['gray']
    exec "hi PmenuSel     gui=none              guifg=".s:colordict['white']."   guibg=".s:colordict['darkred']
    exec "hi TabLine      gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['darkgray']
    exec "hi TabLineFill  gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['darkgray']
    exec "hi TabLineSel   gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['gray']
    exec "hi MatchParen   gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['darkred']
    exec "hi Comment      gui=italic            guifg=".s:commentcolor
    exec "hi Constant     gui=italic            guifg=".s:local_colorscheme['constant']
    exec "hi Special      gui=none              guifg=".s:colordict['blue']
    exec "hi Identifier   gui=none              guifg=".s:local_colorscheme['identifier']
    exec "hi Statement    gui=none              guifg=".s:local_colorscheme['statement']
    exec "hi PreProc      gui=none              guifg=".s:colordict['darkmagenta']
    exec "hi Type         gui=none              guifg=".s:local_colorscheme['type']
    exec "hi Error        gui=none              guifg=".s:colordict['white']."   guibg=".s:colordict['darkred']
    exec "hi Normal       gui=none              guifg=".s:foregroundcolor."      guibg=".s:backgroundcolor
    exec "hi Cursor       gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['green']
endif

" vim: set ft=vim ff=unix fdm=marker :
