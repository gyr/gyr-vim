"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Author: Gustavo Yokoyama Ribeiro <gustavoyr+vim AT gmail DOT com>
" File:   motorola.vim
" Update: 20100814 03:12:15
" Usage:  To disable theses settings g:MotorolaLoadSettings shall be non-zero.
" (C) Copyright 2010 Gustavo Yokoyama Ribeiro
" Licensed under CreativeCommons Attribution-ShareAlike 3.0 Unsupported
" http://creativecommons.org/licenses/by-sa/3.0/ for more info.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('g:MotorolaLoadSettings') || &cp
    finish
endif
let g:MotorolaLoadSettings = 1
let s:keep_cpo = &cpo
set cpo&vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             O / S  S E T T I N G S                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===============================================================================
" Unix:{{{1
if has("unix")

    " Path:{{{2
    """""""""""""""""""""""""""""""""""""""""""""""""
    "                 P A T H                       "
    """""""""""""""""""""""""""""""""""""""""""""""""
    "set path+=/vobs/ezx_apps/code/wvim
    "set path+=/vobs/ezx_apps/code/wvim/afw
    "set path+=/vobs/ezx_apps/code/wvim/binary
    "set path+=/vobs/ezx_apps/code/wvim/pladapt
    "set path+=/vobs/ezx_apps/code/wvim/uistyle/chameleon
    set path+=/vobs/core_imps/code/im/im/lj
    set path+=/vobs/core_imps/code/im/im/lj/afw
    set path+=/vobs/core_imps/code/im/im/lj/binary
    set path+=/vobs/core_imps/code/im/im/lj/pladapt
    set path+=/vobs/core_imps/code/im/im/lj/uistyle/chameleon
    set path+=/vobs/core_imps/code/im/imps/baseClasses
    set path+=/vobs/core_imps/code/im/imps/baseClasses/public
    set path+=/vobs/core_imps/code/im/imps/cmdPool
    set path+=/vobs/core_imps/code/im/imps/cmdPool/pool
    set path+=/vobs/core_imps/code/im/imps/cmdPool/public
    set path+=/vobs/core_imps/code/im/imps/cmdPool/requests
    set path+=/vobs/core_imps/code/im/imps/cmdPool/util
    set path+=/vobs/core_imps/code/im/imps/database
    set path+=/vobs/core_imps/code/im/imps/database/fileTransfer
    set path+=/vobs/core_imps/code/im/imps/database/fileTransfer/public
    set path+=/vobs/core_imps/code/im/imps/database/peerLists
    set path+=/vobs/core_imps/code/im/imps/database/peerLists/flyweightDb
    set path+=/vobs/core_imps/code/im/imps/database/peerLists/flyweightDb
    set path+=/vobs/core_imps/code/im/imps/database/peerLists/flyweightDb/db
    set path+=/vobs/core_imps/code/im/imps/database/peerLists/flyweightDb/flyweight
    set path+=/vobs/core_imps/code/im/imps/database/peerLists/flyweightDb/util
    set path+=/vobs/core_imps/code/im/imps/database/peerLists/public
    set path+=/vobs/core_imps/code/im/imps/database/presenceDb
    set path+=/vobs/core_imps/code/im/imps/database/presenceDb/public
    set path+=/vobs/core_imps/code/im/imps/database/public
    set path+=/vobs/core_imps/code/im/imps/listener
    set path+=/vobs/core_imps/code/im/imps/listener/public
    set path+=/vobs/core_imps/code/im/imps/plugin
    set path+=/vobs/core_imps/code/im/imps/plugin/public
    set path+=/vobs/core_imps/code/im/imps/plugin/omaSimple
    set path+=/vobs/core_imps/code/im/imps/plugin/voip
    set path+=/vobs/core_imps/code/im/imps/plugin/voip/public
    set path+=/vobs/core_imps/code/im/imps/plugin/wvim
    set path+=/vobs/core_imps/code/im/imps/plugin/wvim/public
    set path+=/vobs/core_imps/code/im/imps/public
    set path+=/vobs/core_imps/code/im/imps/public/baseClasses
    set path+=/vobs/core_imps/code/im/imps/public/database
    set path+=/vobs/core_imps/code/im/imps/public/serverRequest
    set path+=/vobs/core_imps/code/im/imps/public/session
    set path+=/vobs/core_imps/code/im/imps/public/settings
    set path+=/vobs/core_imps/code/im/imps/serverRequest
    set path+=/vobs/core_imps/code/im/imps/session
    set path+=/vobs/core_imps/code/im/imps/settings
    set path+=/vobs/core_imps/code/im/dl_hdr/src
    set path+=/vobs/core_imps/code/im/dl_util/src
    set path+=/vobs/core_imps/code/im/dl_wvim/src
    set path+=/vobs/core_imps/code/im/ghdr
    set path+=/vobs/core_imps/code/im/util/hdr
    set path+=/vobs/core_imps/code/im/util/src
    set path+=/vobs/core_imps/code/im/wvim/hdr
    set path+=/vobs/core_imps/code/im/wvim/src
    set path+=/vobs/synergy_core_apps/code/ghdr
    set path+=/vobs/synergy_core_apps/code/msgg/hdr
    set path+=/vobs/synergy_core_apps/code/msgg/src
    "set path+=/vobs/synergy_core_apps/code/wvim/hdr
    "set path+=/vobs/synergy_core_apps/code/wvim/src
    set path+=/vobs/synergy_device_layer/code/dl_db_msg/src
    set path+=/vobs/synergy_device_layer/code/ghdr
    "set path+=/vobs/synergy_device_layer/code/dl_wvim/src

    set tags+=/vobs/core_imps/code/im/imps_tags,/vobs/core_imps/code/im/wvim_tags,/vobs/core_imps/code/im/ghdr_tags,/vobs/core_imps/code/im/dl_tags,/vobs/core_imps/code/im/lj_tags,/vobs/core_imps/code/im/util_tags

    " Abbreviation:{{{2
    """"""""""""""""""""""""""""""""""""""""""""""""""""""
    "              A B B R E V I A T I O N S             "
    """"""""""""""""""""""""""""""""""""""""""""""""""""""
    cab im,, /vobs/core_imps/code/im/wvim/src
    cab imhd,, /vobs/core_imps/code/im/wvim/hdr
    cab imdl,, /vobs/core_imps/code/im/dl_wvim/src
    "cab imlj,, /vobs/ezx_apps/code/wvim
    "cab imafw,, /vobs/ezx_apps/code/wvim/afw
    "cab impa,, /vobs/ezx_apps/code/wvim/pladapt
    "cab imui,, /vobs/ezx_apps/code/wvim/uistyle/chameleon
    cab imlj,, /vobs/core_imps/code/im/im/lj
    cab imafw,, /vobs/core_imps/code/im/im/lj/afw
    cab impa,, /vobs/core_imps/code/im/im/lj/pladapt
    cab imui,, /vobs/core_imps/code/im/im/lj/uistyle/chameleon
    cab msgg,, /vobs/synergy_core_apps/code/msgg
    cab msgg,, /vobs/synergy_core_apps/code/msgg
    cab notif,, /vobs/synergy_core_apps/code/msg_notif
    cab msggdb,, /vobs/synergy_device_layer/code/dl_db_msg/src
    cab ezx,, /vobs/ezx_apps/code

    " Function: {{{2
    """"""""""""""""""""""""""""""""""""""""""""""""""""""
    "                F U N C T I O N S                   "
    """"""""""""""""""""""""""""""""""""""""""""""""""""""
    function! CreateCtags(tagType)
        if (a:tagType == "im")
            execute ":!~/.gyr.d/scripts/motorola/createCtags -a"
"            execute ":![ -e /vobs/core_imps/code/im/imps_tags ] && rm -f /vobs/core_imps/code/im/imps_tags"
"            execute ":![[ -d /vobs/core_imps/code/im/ && -e /work/ctags/bin/ctags ]] && /work/ctags/bin/ctags -f /vobs/core_imps/code/im/imps_tags -R --c++-kinds=+p --fields=+iaS --extra=+q -h \".h\",\".hh\" /vobs/core_imps/code/im/wvim/* /vobs/core_imps/code/im/imps/* /vobs/core_imps/code/im/dl_hdr/* /vobs/core_imps/code/im/dl_util/* /vobs/core_imps/code/im/ghdr/* /vobs/core_imps/code/im/dl_wvim/* /vobs/core_imps/code/im/util/* /vobs/core_imps/code/im/im/lj/afw/* /vobs/core_imps/code/im/im/lj/pladapt/* /vobs/core_imps/code/im/im/lj/uistyle/* /vobs/core_imps/code/im/im/lj/lib/* /vobs/core_imps/code/im/im/lj/public/* /vobs/core_imps/code/im/* || echo 'View not set.'"
"            execute ":![ -e /vobs/core_imps/code/im/imps_tags ] && echo 'IM tags generated.' || echo 'IM tag NOT generated.'"
        endif
    endfunction

" }}}1
"===============================================================================
" Windows:{{{1
elseif has("win32")

    " Settings:{{{2
    let $Home="d:/wgr014"

    " Path:{{{2
    """""""""""""""""""""""""""""""""""""""""""""""""
    "                 P A T H                       "
    """""""""""""""""""""""""""""""""""""""""""""""""
    "set path+=z:/synergy_core_apps/code/ghdr
    "set path+=z:/synergy_core_apps/code/msgg/hdr
    "set path+=z:/synergy_core_apps/code/msgg/src
    "set path+=/vobs/synergy_core_apps/code/wvim/hdr
    "set path+=/vobs/synergy_core_apps/code/wvim/src
    "set path+=z:/synergy_device_layer/code/ghdr
    "set path+=z:/synergy_device_layer/code/dl_db_msg/src
    "set path+=z:/vobs/synergy_device_layer/code/dl_wvim/src
    "set path+=z:/ezx_apps/code/wvim
    "set path+=z:/ezx_apps/code/wvim/afw
    "set path+=z:/ezx_apps/code/wvim/binary
    "set path+=z:/ezx_apps/code/wvim/pladapt
    "set path+=z:/ezx_apps/code/wvim/uistyle/chameleon
    set path+=z:/core_imps/code/im/lj
    set path+=z:/core_imps/code/im/lj/afw
    set path+=z:/core_imps/code/im/lj/binary
    set path+=z:/core_imps/code/im/lj/pladapt
    set path+=z:/core_imps/code/im/lj/uistyle/chameleon
    set path+=z:/core_imps/code/imps/baseClasses
    set path+=z:/core_imps/code/imps/cmdPool
    set path+=z:/core_imps/code/imps/cmdPool/pool
    set path+=z:/core_imps/code/imps/cmdPool/public
    set path+=z:/core_imps/code/imps/cmdPool/requests
    set path+=z:/core_imps/code/imps/cmdPool/util
    set path+=z:/core_imps/code/imps/database
    set path+=z:/core_imps/code/imps/database/flyweightDb
    set path+=z:/core_imps/code/imps/database/flyweightDb/db
    set path+=z:/core_imps/code/imps/database/flyweightDb/flyweight
    set path+=z:/core_imps/code/imps/database/flyweightDb/util
    set path+=z:/core_imps/code/imps/database/public
    set path+=z:/core_imps/code/imps/listener
    set path+=z:/core_imps/code/imps/listener/public
    set path+=z:/core_imps/code/imps/plugin
    set path+=z:/core_imps/code/imps/plugin/public
    set path+=z:/core_imps/code/imps/plugin/wvim
    set path+=z:/core_imps/code/imps/plugin/wvim/public
    set path+=z:/core_imps/code/imps/public
    set path+=z:/core_imps/code/imps/public/baseClasses
    set path+=z:/core_imps/code/imps/public/database
    set path+=z:/core_imps/code/imps/public/serverRequest
    set path+=z:/core_imps/code/imps/public/settings
    set path+=z:/core_imps/code/imps/settings
    set path+=z:/core_imps/code/dl_hdr/src
    set path+=z:/core_imps/code/dl_util/src
    set path+=z:/core_imps/code/dl_wvim/src
    set path+=z:/core_imps/code/ghdr
    set path+=z:/core_imps/code/util/hdr
    set path+=z:/core_imps/code/util/src
    set path+=z:/core_imps/code/wvim/src
    set path+=z:/core_imps/code/wvim/hdr

    set tags+=./tags,tags,z:/core_imps/code/imps_tags

    " Abbreviation:{{{2
    """"""""""""""""""""""""""""""""""""""""""""""""""""""
    "              A B B R E V I A T I O N S             "
    """"""""""""""""""""""""""""""""""""""""""""""""""""""
    cab im,, z:/core_imps/code/wvim
    cab imdl,, z:/core_imps/code/dl_wvim/src
    "cab imlj,, z:/ezx_apps/code/wvim
    "cab imafw,, z:/ezx_apps/code/wvim/afw
    "cab imui,, z:/ezx_apps/code/wvim/uistyle/chameleon
    "cab impa,, z:/ezx_apps/code/wvim/pladapt
    cab imlj,, z:/core_imps/code/im/lj
    cab imafw,, z:/core_imps/code/im/lj/afw
    cab imui,, z:/core_imps/code/im/lj/uistyle/chameleon
    cab impa,, z:/core_imps/code/im/lj/pladapt
    cab msg,, z:/synergy_core_apps/code/msgg
    cab notif,, z:/synergy_core_apps/code/msg_notif
    cab msgdb,, z:/synergy_device_layer/code/dl_db_msg/src

    " Function: {{{2
    """"""""""""""""""""""""""""""""""""""""""""""""""""""
    "                F U N C T I O N S                   "
    """"""""""""""""""""""""""""""""""""""""""""""""""""""
    function! CreateCtags(tagType)
        if (a:tagType == "im")
            silent! execute ":!del z:\\core_imps\\code\\imps_tags"
            silent! execute ":!ctags -f z:\\core_imps\\code\\imps_tags -R --c++-kinds=+p --fields=+iaS --extra=+q -h \".h\",\".hh\" z:\\core_imps\\code\\wvim\\* z:\\core_imps\\code\\imps\\* z:\\core_imps\\code\\dl_hdr\\* z:\\core_imps\\code\\dl_util\\* z:\\core_imps\\code\\ghdr\\* z:\\core_imps\\code\\dl_wvim\\* z:\\core_imps\\code\\util\\* z:\\core_imps\\code\\im\\lj\\afw\\* z:\\core_imps\\code\\im\\lj\\pladapt\\* z:\\core_imps\\code\\im\\lj\\uistyle\\* z:\\core_imps\\code\\im\\lj\\lib\\* z:\\core_imps\\code\\im\\lj\\public\\*"
            execute ":echo 'IM tags generated.'"
        endif
    endfunction

endif

" }}}1
"===============================================================================
" Common: {{{1
" Key Map:{{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   M A P P I N G                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""
cmap <LEADER><LEADER>imtag call CreateCtags("im")<CR>

" }}}1
"===============================================================================

let &cpo = s:keep_cpo
unlet s:keep_cpo

" vim: set ft=vim ff=unix fdm=marker :
