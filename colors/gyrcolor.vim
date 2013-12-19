""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Author: Gustavo Yokoyama Ribeiro <gustavoyr+vim AT gmail DOT com>
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
" This color scheme uses a dark background.
set background=dark

let colors_name = "gyrcolor"
let g:gyr_colorscheme = 'blue'

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

if has("gui_running")
    let s:colordict = {
                \'black'      : '#000000',
                \'darkred'    : '#CD0000',
                \'darkgreen'  : '#00CD00',
                \'darkyellow' : '#CDCD00',
                \'darkblue'   : '#0000FF',
                \'darkmagenta': '#CD00CD',
                \'darkcyan'   : '#00CDCD',
                \'gray'       : '#BEBEBE',
                \'darkgray'   : '#A9A9A9',
                \'red'        : '#FF0000',
                \'green'      : '#00FF00',
                \'yellow'     : '#FFFF00',
                \'blue'       : '#6485ED',
                \'magenta'    : '#FF00FF',
                \'cyan'       : '#00FFFF',
                \'white'      : '#FFFFFF',
                \}
    "let s:linecol = '#080808'
    let s:linecol = '#400000'
else
    if &t_Co == 16
        "let s:colordict = {
        "            \'black'      : 0,
        "            \'darkred'    : 1,
        "            \'darkgreen'  : 2,
        "            \'darkyellow' : 3,
        "            \'darkblue'   : 4,
        "            \'darkmagenta': 5,
        "            \'darkcyan'   : 6,
        "            \'gray'       : 7,
        "            \'darkgray'   : 8,
        "            \'red'        : 9,
        "            \'green'      : 10,
        "            \'yellow'     : 11,
        "            \'blue'       : 12,
        "            \'magenta'    : 13,
        "            \'cyan'       : 14,
        "            \'white'      : 15,
        "            \}
        let s:linecol = 0
    elseif &t_Co > 16
        "let s:colordict = {
        "            \'black'      : 16,
        "            \'darkred'    : 88,
        "            \'darkgreen'  : 28,
        "            \'darkyellow' : 100,
        "            \'darkblue'   : 20,
        "            \'darkmagenta': 90,
        "            \'darkcyan'   : 30,
        "            \'gray'       : 250,
        "            \'darkgray'   : 246,
        "            \'red'        : 196,
        "            \'green'      : 46,
        "            \'yellow'     : 226,
        "            \'blue'       : 27,
        "            \'magenta'    : 201,
        "            \'cyan'       : 51,
        "            \'white'      : 231,
        "            \}
        let s:linecol = 0
        "let s:linecol = 235
        let s:backgroundcolor = 233
    endif
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
    "let s:linecol = 17
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
                \'constant'    : s:colordict['cyan'],
                \'identifier'  : s:colordict['green'],
                \'statement'   : s:colordict['red'],
                \'type'        : s:colordict['darkgreen'],
                \}
    "let s:local_colorscheme = {
    "            \'linenr'      : s:colordict['red'],
    "            \'statusline'  : s:colordict['red'],
    "            \'statuslinenc': s:colordict['darkred'],
    "            \'vertsplit'   : s:colordict['darkred'],
    "            \'constant'    : s:colordict['red'],
    "            \'identifier'  : s:colordict['gray'],
    "            \'statement'   : s:colordict['darkred'],
    "            \'type'        : s:colordict['darkyellow'],
    "            \}
    "let s:linecol = 52
elseif g:gyr_colorscheme == 'green'
    let s:local_colorscheme = {
                \'linenr'      : s:colordict['gray'],
                \'statusline'  : s:colordict['green'],
                \'statuslinenc': s:colordict['darkgreen'],
                \'vertsplit'   : s:colordict['darkgreen'],
                \'constant'    : s:colordict['cyan'],
                \'identifier'  : s:colordict['green'],
                \'statement'   : s:colordict['darkgreen'],
                \'type'        : s:colordict['darkcyan'],
                \}
endif

if ! has("gui_running")
    exec "hi SpecialKey   cterm=underline         ctermfg=".s:colordict['darkred']
    exec "hi NonText      cterm=underline         ctermfg=".s:colordict['darkred']
    exec "hi Search       cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['yellow']
    exec "hi LineNr       cterm=underline,reverse ctermfg=".s:local_colorscheme['linenr']
    exec "hi StatusLine   cterm=reverse           ctermfg=".s:local_colorscheme['statusline']."   ctermbg=".s:colordict['black']
    exec "hi StatusLineNC cterm=reverse           ctermfg=".s:local_colorscheme['statuslinenc']." ctermbg=".s:colordict['black']
    exec "hi VertSplit    cterm=reverse           ctermfg=".s:local_colorscheme['vertsplit']."    ctermbg=".s:colordict['black']
    exec "hi Visual       cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['gray']
    exec "hi WarningMsg   cterm=none              ctermfg=".s:colordict['yellow']
    exec "hi Folded       cterm=none              ctermfg=".s:colordict['black']
    exec "hi FoldColumn   cterm=none              ctermfg=".s:colordict['black']
    exec "hi DiffAdd      cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['cyan']
    exec "hi DiffChange   cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['blue']
    exec "hi DiffDelete   cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['red']
    exec "hi DiffText     cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['yellow']
    exec "hi SpellBad     cterm=none              ctermfg=".s:colordict['darkyellow']."   ctermbg=".s:colordict['darkred']
    exec "hi Pmenu        cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['gray']
    exec "hi PmenuSel     cterm=none              ctermfg=".s:colordict['white']."   ctermbg=".s:colordict['darkred']
    exec "hi TabLine      cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['darkgray']
    exec "hi TabLineFill  cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['darkgray']
    exec "hi TabLineSel   cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['gray']
    exec "hi CursorColumn cterm=none                                                 ctermbg=".s:linecol
    exec "hi CursorLine   cterm=none                                                 ctermbg=".s:linecol
    exec "hi ColorColumn  cterm=none                                                 ctermbg=".s:linecol
    exec "hi MatchParen   cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['darkred']
    exec "hi Comment      cterm=none              ctermfg=".s:colordict['darkgray']
    exec "hi Constant     cterm=none              ctermfg=".s:local_colorscheme['constant']
    exec "hi Special      cterm=none              ctermfg=".s:colordict['blue']
    exec "hi Identifier   cterm=none              ctermfg=".s:local_colorscheme['identifier']
    exec "hi Statement    cterm=none              ctermfg=".s:local_colorscheme['statement']
    exec "hi PreProc      cterm=none              ctermfg=".s:colordict['darkblue']
    exec "hi Type         cterm=none              ctermfg=".s:local_colorscheme['type']
    exec "hi Error        cterm=none              ctermfg=".s:colordict['white']."   ctermbg=".s:colordict['darkred']
    exec "hi Normal       cterm=none              ctermfg=".s:colordict['white']."   ctermbg=".s:backgroundcolor
    exec "hi Cursor       cterm=none              ctermfg=".s:colordict['black']."   ctermbg=".s:colordict['green']
else
    exec "hi SpecialKey   gui=underline,        guifg=".s:colordict['darkred']
    exec "hi NonText      gui=underline         guifg=".s:colordict['darkred']
    exec "hi Search       gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['yellow']
    exec "hi LineNr       gui=underline,reverse guifg=".s:local_colorscheme['linenr']
    exec "hi StatusLine   gui=reverse           guifg=".s:local_colorscheme['statusline']."   guibg=".s:colordict['black']
    exec "hi StatusLineNC gui=reverse           guifg=".s:local_colorscheme['statuslinenc']." guibg=".s:colordict['black']
    exec "hi VertSplit    gui=reverse           guifg=".s:local_colorscheme['vertsplit']."    guibg=".s:colordict['black']
    exec "hi Visual       gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['gray']
    exec "hi WarningMsg   gui=none              guifg=".s:colordict['yellow']
    exec "hi Folded       gui=none              guifg=".s:colordict['black']
    exec "hi FoldColumn   gui=none              guifg=".s:colordict['black']
    exec "hi DiffAdd      gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['green']
    exec "hi DiffChange   gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['blue']
    exec "hi DiffDelete   gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['red']
    exec "hi DiffText     gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['yellow']
    exec "hi SpellBad     gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['darkred']
    exec "hi Pmenu        gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['gray']
    exec "hi PmenuSel     gui=none              guifg=".s:colordict['white']."   guibg=".s:colordict['darkred']
    exec "hi TabLine      gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['darkgray']
    exec "hi TabLineFill  gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['darkgray']
    exec "hi TabLineSel   gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['gray']
    exec "hi CursorColumn gui=none                                               guibg=".s:linecol
    exec "hi CursorLine   gui=none                                               guibg=".s:linecol
    exec "hi ColorColumn  gui=none                                               guibg=".s:linecol
    exec "hi MatchParen   gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['darkred']
    exec "hi Comment      gui=none              guifg=".s:colordict['darkgray']
    exec "hi Constant     gui=none              guifg=".s:local_colorscheme['constant']
    exec "hi Special      gui=none              guifg=".s:colordict['blue']
    exec "hi Identifier   gui=none              guifg=".s:local_colorscheme['identifier']
    exec "hi Statement    gui=none              guifg=".s:local_colorscheme['statement']
    exec "hi PreProc      gui=none              guifg=".s:colordict['darkblue']
    exec "hi Type         gui=none              guifg=".s:local_colorscheme['type']
    exec "hi Error        gui=none              guifg=".s:colordict['white']."   guibg=".s:colordict['darkred']
    exec "hi Normal       gui=none              guifg=".s:colordict['white']."   guibg=".s:colordict['black']
    exec "hi Normal       gui=none              guifg=white guibg=black"
    exec "hi Cursor       gui=none              guifg=".s:colordict['black']."   guibg=".s:colordict['green']
endif

" vim: set ft=vim ff=unix fdm=marker :
