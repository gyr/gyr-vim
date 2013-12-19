" Vim color file
" Maintainer: Gustavo Yokoyama Ribeiro
" Last Change: 20070212
" (C) Copyright 2010 Gustavo Yokoyama Ribeiro
" Licensed under CreativeCommons Attribution-ShareAlike 3.0 Unsupported
" http://creativecommons.org/licenses/by-sa/3.0/ for more info.


" First remove all existing highlighting.
if exists("syntax_on")
    syntax reset
endif
hi clear
" This color scheme uses a dark background.
set background=dark

let colors_name = "gyr"

hi Normal       ctermfg=6 ctermbg=0                         guifg=PaleTurquoise1 guibg=Black
hi LineNr       cterm=underline ctermfg=14                  gui=underline guifg=Cyan
hi NonText      cterm=underline ctermfg=14                  gui=underline guifg=Cyan
hi Search       ctermbg=3                                   guibg=Yellow
hi Visual       ctermfg=0 ctermbg=14                        guifg=Black guibg=Cyan
hi WarningMsg   ctermfg=7 ctermbg=9                         guifg=White guibg=Orangered

hi Cursor       ctermfg=0 ctermbg=1                         guifg=Black guibg=Tomato
hi CursorColumn cterm=none ctermbg=8                        guibg=DarkSlateGray
hi CursorLine   cterm=none ctermbg=8                        guibg=DarkSlateGray

hi ModeMsg      ctermfg=0 ctermbg=14                        guibg=Cyan guifg=Black
"hi StatusLine   cterm=reverse                               guifg=Cyan guibg=Black
hi StatusLine   ctermfg=14 ctermbg=0                        guifg=Cyan guibg=Black
hi StatusLineNC ctermfg=6 ctermbg=0                         guifg=PaleTurquoise1 guibg=Black
hi VertSplit    ctermfg=14 ctermbg=0                        guifg=Cyan guibg=Black

hi TabLine      cterm=bold,underline ctermfg=0 ctermbg=14   gui=bold,underline  guifg=Black guibg=Cyan
hi TabLineFill  cterm=bold ctermfg=0 ctermbg=6              gui=bold guifg=Black guibg=Cyan
hi TabLineSel   cterm=underline ctermfg=6 ctermbg=0         gui=underline guifg=Cyan guibg=Black

hi Pmenu        ctermfg=0 ctermbg=14                        guifg=Black guibg=Cyan
hi PmenuSel     cterm=underline ctermfg=7 ctermbg=9         gui=underline guifg=White guibg=Orangered

hi DiffAdd      ctermfg=0 ctermbg=2                         guifg=Black guibg=Aquamarine
hi DiffChange   ctermfg=0 ctermbg=12                        guifg=Black guibg=DeepSkyBlue
hi DiffDelete   ctermfg=0 ctermbg=9                         guifg=Black guibg=Orangered
hi DiffText     ctermfg=0 ctermbg=11                        guifg=Black guibg=Orange

hi Comment      ctermfg=12                                  guifg=DeepSkyBlue
hi Constant     ctermfg=4                                   guifg=LightSkyBlue
hi Function     ctermfg=1                                   guifg=Tomato
hi Identifier   ctermfg=11                                  guifg=Orange
hi MatchParen   ctermfg=9 ctermbg=14                        guifg=Orangered guibg=Cyan
hi PreProc      ctermfg=5                                   guifg=Thistle
hi Special      ctermfg=13                                  guifg=Plum
hi SpecialKey   cterm=underline ctermfg=14                  gui=underline guifg=Cyan
hi Statement    cterm=bold ctermfg=10                       gui=bold guifg=Turquoise
hi String       ctermfg=2                                   guifg=Aquamarine
hi Type         ctermfg=14                                  guifg=Cyan
hi Variable     ctermfg=3                                   guifg=Yellow

hi ShowMarksHLl ctermfg=0 ctermbg=14                        gui=bold guifg=Black guibg=Cyan
hi ShowMarksHLu ctermfg=0 ctermbg=14                        gui=bold guifg=Black guibg=Cyan
hi ShowMarksHLo ctermfg=0 ctermbg=14                        gui=bold guifg=Black guibg=Cyan
hi ShowMarksHLm ctermfg=0 ctermbg=14                        gui=bold guifg=Black guibg=Cyan


hi link Directory Comment
hi link Question Type

hi link Include     PreProc
hi link Define      PreProc
hi link Macro       PreProc
hi link PreCondit   PreProc

hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type

hi link Character   Constant
hi link Number      Constant
hi link Boolean     Constant
hi link Float       Constant

hi link Conditional Statement
hi link Repeat      Statement
hi link Label       Statement
hi link Operator    Statement
hi link Keyword     Statement
hi link Exception   Statement

hi link SpecialChar Special
hi link Tag         Special
hi link Delimiter   Special
hi link SpecialComment  Special
hi link Debug       Special
