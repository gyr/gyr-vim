""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Author: Gustavo Yokoyama Ribeiro <gustavoyr+vim AT gmail DOT com>
" File:  .vimrc
" Update: 20120309
" (C) Copyright 2012 Gustavo Yokoyama Ribeiro
" Licensed under CreativeCommons Attribution-ShareAlike 3.0 Unsupported
" http://creativecommons.org/licenses/by-sa/3.0/ for more info.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"===============================================================================
" Pre-Settings:{{{1
" first the disabled features due to security concerns
set modelines=0               " no modelines [http://www.guninski.com/vim1.html]
let g:secure_modelines_verbose=0 " securemodelines vimscript
let g:secure_modelines_modelines = 15 " 15 available modelines

let s:base_dir = $HOME."/.vim-tmp"
let s:list_dir = ["/tags", "/backup", "/swap", "/aux-files", "/undo", "/sessions"]
for s:dir in s:list_dir
    call gyrlib#EnsureDirExists(s:base_dir.s:dir)
    "if ! isdirectory(s:base_dir.s:dir)
    "    call mkdir(s:base_dir.s:dir, "p")
    "endif
endfor

let g:netrw_home = s:base_dir

filetype plugin indent off
syntax off
try
    "call pathogen#runtime_append_all_bundles()
    ""call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundle'))
    "call pathogen#helptags()
    "call pathogen#infect()
    runtime bundle/pathogen/autoload/pathogen.vim
    execute pathogen#infect()
    execute pathogen#helptags()
    " After add a plugin in bundle run :Helptags
catch /.*/
    echoerr "E: Failed pathogen functions"
endtry
"filetype on         " Enable filetype detection
"filetype plugin on  " Enable filetype-specific plugins
"filetype indent on  " Enable filetype-specific indenting
syntax on
filetype plugin indent on

"}}}1
"===============================================================================
" Settings:{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""
"                S E T I N G S                  "
"""""""""""""""""""""""""""""""""""""""""""""""""
" to see all options => :options
"-------------------------------------------------------------------------------
" Important:{{{2
set nocompatible    " Modo "No compatible" . Valores padrao para algumas opcoes sao adequados ao Vim, nao Vi.
set cpoptions+=$J
set pastetoggle=<Insert>

"}}}2
"-------------------------------------------------------------------------------
" Moving around, searching and patterns:{{{2
set whichwrap+=<,>,[,]
set path+=.
set path+=$HOME
set path+=$HOME/.gyr.d
set path+=$HOME/.gyr.d/dotfiles
set path+=$HOME/.gyr.d/info
set path+=$HOME/.gyr.d/bkp
set path+=$HOME/.gyr.d/scripts
set incsearch       " Search while typing
set magic           " Use magic patterns  (extended regular expressions) in search patterns
set ignorecase      " Ignore case on search
set smartcase       " Consider noic when search has upper case

"}}}2
"-------------------------------------------------------------------------------
" Tags:{{{2
set tags+=$HOME/.vim-tmp/tags/kop.tags
"set tags+=$HOME/.vim-tmp/tags/
set showfulltag     " Show more information while completing tags

"}}}2
"-------------------------------------------------------------------------------
" Displaying text:{{{2
set scrolloff=5     " Keep 3 lines below/above the cursor
set wrap            " Desliga quebra de linhas. As linhas vao ficar longas, ultrapassando a margem direita.
set linebreak nolist   " When wrap is on break lines at 'breakat', do not add <EOL>. list must be off. The linebreak setting will not work when the list setting is enabled.
if has("multi_byte")
    set showbreak=↪\      " String to put at the start of lines that have been wrapped (wrap must be on). number must be off.
    set fillchars+=diff:⣿,vert:│
    set listchars+=tab:▸▸,trail:·,eol:¬,extends:»,precedes:«,nbsp:ø
else
    set showbreak=>     " String to put at the start of lines that have been wrapped (wrap must be on). number must be off.
    set fillchars+=diff:-,vert:|
    set listchars+=tab:>-,trail:.,eol:$,extends:>,precedes:<,nbsp:%
endif
set sidescroll=5    " Keep 5 columns left/right the cursor
set sidescrolloff=10
set display+=lastline
set cmdheight=2     " 2 line for command
"set lazyredraw      " don't redraw when don't have to
"set list            " Show special characters
set nonumber          " Display line numbers
set numberwidth=1   " Use 1 col + 1 space for numbers

"}}}2
"-------------------------------------------------------------------------------
" Syntax, highlighting and spelling:{{{2
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch        " Highligh search
    set background=dark " Use colors which look better on the background
    set synmaxcol=2000  " Syntax coloring lines that are too long just slows down the world
endif
"set cursorcolumn
set cursorline
if exists('+colorcolumn')
    set colorcolumn=+1
endif
set spelllang=en

"}}}2
"-------------------------------------------------------------------------------
" Multiple windows:{{{2
set laststatus=2    " Sempre exibe a barra de status
"if has('statusline')
"    set statusline=[%n]      " buffer number
"    set statusline+=\ %t       " file name
"    "set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, " file enconding
"    set statusline+=\ [%{&ff}]  " file format
"    set statusline+=%y       " file type
"    set statusline+=%m       " modified flag
"    set statusline+=%r       " readonly flag
"    set statusline+=%h       " help buffer flag
"    set statusline+=%w       " preview window flag
"    set statusline+=%=       " left/right separator
"    set statusline+=%c%V,    " cursor column-virtual column number
"    set statusline+=%l/%L    " cursor line/total lines
"    set statusline+=\ %P     " percent through file
"endif
set equalalways      " do not resize windows to the same size
set hidden           " allow editing multiple unsaved buffers
set splitbelow
set splitright
set switchbuf=useopen,usetab

"}}}2
"-------------------------------------------------------------------------------
" Terminal:{{{2
if match($TERM, "screen") != -1
    set term=xterm
    let g:GNU_Screen_used = 1
else
    let g:GNU_Screen_used = 0
endif
set ttyfast         " Send more characters to terminal, improving windows redraw
"set noesckeys
set title           " Display the file name on status bar
set titlestring=%t%(\ [%R%M]%)

"}}}2
"-------------------------------------------------------------------------------
" Using the mouse:{{{2
"set mousehide

"}}}2
"-------------------------------------------------------------------------------
" Messages and info:{{{2
set showcmd         " Display the command on status bar
set showmode        " Display the input mode on status bar
set ruler           " Display the cursor position on status bar
set report=0        " Warning when lines change
set confirm         " Confirm operation
set noerrorbells    " don't make noise
set novisualbell

"}}}2
"-------------------------------------------------------------------------------
" Selecting text:{{{2
" --copying / pasting
" allow vim commands to copy to system clipboard (*)
" for X11:
"   + is the clipboard register (Ctrl-{c,v})
"   * is the selection register (middle click, Shift-Insert)
set clipboard+=unnamed " "unnamed" to use the * register like unnamed register
set clipboard-=autoselect " "unnamed" to use the * register like unnamed register
" use clipboard register in linux when supported
if has("unix") && v:version >= 703
    set clipboard+=unnamedplus
    "set clipboard^=unnamedplus
endif
" Prevent vim from trying to connect and use X server's clipboard,
" which caused a startup delay of about 14 seconds.
set clipboard+=exclude:.*

"}}}2
"-------------------------------------------------------------------------------
" Editing text:{{{2
set undolevels=5000 " Undo level
if exists('+undoreload')
    set undoreload=10000
endif
set backspace=indent,eol,start " <BACKSpace> works on indentantion, line break and the start of insert
"set formatoptions+=tan "list of flags that tell how automatic formatting works
set formatoptions+=tn "list of flags that tell how automatic formatting works
set complete=.,w,b,u,U,t,i,d " do lots of scanning on tab completion
set dictionary=/usr/share/dict/words " more words!
set infercase       " in insert mode and ignorecase on the case of the match is adjusted depending on the typed text
set showmatch       " Show matchs
set matchtime=2     " For .2 seconds
set matchpairs+=<:>
set nojoinspaces    " on join lines, after a '.', '?' and '!' add only one space

"}}}2
"-------------------------------------------------------------------------------
" Tabs and indenting:{{{2
" Para converter tab em espaco usar o comando [:retab]
set tabstop=4       " <Tab> width
set shiftwidth=4    " Autoindent width
set smarttab
set softtabstop=4   " <BACKSpace> in an indentantion delete 4 characters
set shiftround      " indent using multiple of shiftwidth for > and <
set expandtab       " Replace <Tab> to <Space>
set autoindent
"set smartindent   "Disable due to cindent
set cindent
set cinoptions+=l1,t0,i0,(0

"}}}2
"-------------------------------------------------------------------------------
" Folding:{{{2
"set foldcolumn=3      " 2 lines of column for fold showing, always
set foldopen+=insert,jump " add this stuff to open folder as well
set foldmethod=syntax " fold on syntax automatically, always
" http://dhruvasagar.com/2013/03/28/vim-better-foldtext
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

"}}}2
"-------------------------------------------------------------------------------
" Diff mode:{{{2
"set diffopt+=iwhite "ignore white spaces

"}}}2
"-------------------------------------------------------------------------------
" Mapping:{{{2
"set timeout         " do timeout on mappings
"set timeoutlen=500  " key map timeout after 100msec
"set ttimeout        " do timeout on terminal key codes
"set ttimeoutlen=50  " key code timeout after 0 sec

"}}}2
"-------------------------------------------------------------------------------
" Reading and writing files:{{{2
set fileformat=unix " Unix file format
set backup
set backupdir=~/.vim-tmp/backup,~/.tmp,~/tmp,/var/tmp,/tmp
set noautowrite     " don't automatically write on :next, etc

"}}}2
"-------------------------------------------------------------------------------
" Swap file:{{{2
set directory=~/.vim-tmp/swap,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile
set updatecount=50 " write swap file to disk after each 20 characters
set updatetime=9000 " write swap file to disk after 9 inactive seconds

"}}}2
"-------------------------------------------------------------------------------
" Command line editing:{{{2
set history=1000     " size in line of history
set wildcharm=<C-z>  " see its use on mapping
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,*.a,*.so,*.exe,*.pyc,*.pyo,*.bak,*~,*.jpg,*.png,*.gif,*.class " ignore this extensions
if exists("&wildignorecase")
    set wildignorecase
endif
set wildmenu        " Autocomplete features in the status bar
if exists('+undofile') | set undofile | endif
if exists('+undodir') | set undodir=~/.vim-tmp/undo,~/.tmp,~/tmp,/var/tmp,/tmp | endif

"}}}2
"-------------------------------------------------------------------------------
" Running make and jumping to errors:{{{2
"set grepprg=ack\ -H\ --nocolor\ --nogroup\ --column
set grepprg=ag\ --nocolor\ --nogroup\ --column

"}}}2
"-------------------------------------------------------------------------------
" Various:{{{2
set virtualedit+=block
set secure
"set gdefault        " all matches in a line are substituted instead of one
set sessionoptions+=unix,slash
"set viminfo+='10,:20,%
set viminfo+='10,:20
"set debug=msg       " Setting this makes it show that error messages don't disappear after one second on startup.

"}}}2
"-------------------------------------------------------------------------------
" General:{{{2
"set autochdir
if has("unix")
    behave xterm
elseif has("win32")
    behave mswin
endif

set encoding=utf-8
let &termencoding = &encoding
let &fileencoding = &encoding

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
"set t_ti= t_te=

" netrw lists file and folders in tree-like structure
let g:netrw_liststyle = 3
"}}}2
"-------------------------------------------------------------------------------
" Color:{{{2

if $TERM =~ '^xterm'
    set t_Co=256
elseif $TERM =~ '^screen'
    set t_Co=256            " just guessing
elseif $TERM =~ '^rxvt'
    "set t_Co=88
    set t_Co=256
elseif $TERM =~ '^linux-16color'
    set t_Co=16
elseif $TERM =~ '^linux'
    set t_Co=8
else
    set t_Co=16
endif

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

if &t_Co >= 16
    try
        "let g:solarized_termcolors=256
        "let g:solarized_visibility="high"
        "let g:solarized_visibility="low"
        set background=dark
        "colorscheme solarized
        colorscheme gyrcolor
    catch /.*/
        echoerr "E: Failed to set colorscheme"
    endtry
"else
"    try
"        let g:solarized_termcolors=16
"        set background=dark
"        colorscheme solarized
"    catch /.*/
"        echoerr "E: Failed to set colorscheme"
"    endtry
endif

"}}}2
"-------------------------------------------------------------------------------
" Plugin:{{{2
" Disable Motorola Settings
let g:MotorolaLoadSettings = 1

" Matchit:{{{3
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif
" }}}3
" clibs:{{{3
" clibs.vim : Syntax highlighting for C library functions and constants
let c_hi_identifiers = 'all'
let c_hi_libs = ['*']

" syntastic:{{{3
let g:syntastic_mode_map = { 'mode': 'passive', }
let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_error_symbol =  '▶'
let g:syntastic_warning_symbol = '»'

" lightline: {{{3
if isdirectory($HOME."/.vim/bundle/lightline.vim") || isdirectory($HOME."/.vim/bundle/lightline")
    let g:lightline = {
          \ 'colorscheme': 'default',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
          \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
          \ },
          \ 'component': {
          \   'lineinfo': '⭡ %3l:%-2v',
          \ },
          \ 'component_function': {
          \   'modified': 'MyModified',
          \   'readonly': 'MyReadonly',
          \   'fugitive': 'MyFugitive',
          \   'filename': 'MyFilename',
          \   'fileformat': 'MyFileformat',
          \   'filetype': 'MyFiletype',
          \   'fileencoding': 'MyFileencoding',
          \   'mode': 'MyMode',
          \ },
          \ 'component_expand': {
          \   'syntastic': 'SyntasticStatuslineFlag',
          \ },
          \ 'component_type': {
          \   'syntastic': 'error',
          \ },
          \ 'separator': { 'left': '⮀', 'right': '⮂' },
          \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
          \ }

    function! MyModified()
      return &ft =~ 'help\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction

    function! MyReadonly()
      return &ft !~? 'help\|gundo' && &readonly ? '⭤' : ''
    endfunction

    "function! MyFilename()
    "  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
    "        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
    "        \ ('' != MyModified() ? ' ' . MyModified() : '')
    "endfunction
    function! MyFilename()
        let fname = expand('%:t')
        return fname == '__Tagbar__' ? g:lightline.fname :
                    \ fname =~ '__Gundo' ? '' :
                    \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                    \ ('' != fname ? fname : '[No Name]') .
                    \ ('' != MyModified() ? ' ' . MyModified() : '')
    endfunction

    function! MyFugitive()
        try
            if expand('%:t') !~? 'Tagbar\|Gundo' && exists('*fugitive#head')
                let mark = '⭠ '  " edit here for cool mark
                let _ = fugitive#head()
                return strlen(_) ? mark._ : ''
            endif
        catch
        endtry
        return ''
    endfunction

    function! MyFileformat()
      return winwidth('.') > 70 ? &fileformat : ''
    endfunction

    function! MyFiletype()
      return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
    endfunction

    function! MyFileencoding()
      return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
    endfunction

    function! MyMode()
        let fname = expand('%:t')
        return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == '__Gundo__' ? 'Gundo' :
                \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                \ winwidth('.') > 60 ? lightline#mode() : ''
    endfunction

    let g:tagbar_status_func = 'TagbarStatusFunc'

    function! TagbarStatusFunc(current, sort, fname, ...) abort
        let g:lightline.fname = a:fname
        return lightline#statusline(0)
    endfunction

    augroup AutoSyntastic
      autocmd!
      autocmd BufWritePost *.c,*.cpp,*.py,*.pl,*.sh,*.vim call s:syntastic()
    augroup END
    function! s:syntastic()
      SyntasticCheck
      call lightline#update()
    endfunction
endif

" Vimwiki: {{{3
if isdirectory($HOME."/.vim/bundle/vimwiki")
    let gyr_wiki = {}
    let gyr_wiki.path = '~/.gyr.d/vimwiki/'
    let gyr_wiki.path_html = '~/.gyr.d/public_html/'
    let gyr_wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sh': 'sh', 'perl': 'perl', 'conf': 'conf', 'fstab': 'fstab', 'deb': 'debsources', 'resolv': 'resolv', 'xml': 'xml'}
    let ibm_wiki = {}
    let ibm_wiki.path = '~/.ibm.d/vimwiki/'
    let ibm_wiki.path_html = '~/.ibm.d/public_html/'
    let ibm_wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sh': 'sh', 'perl': 'perl', 'conf': 'conf', 'fstab': 'fstab', 'deb': 'debsources', 'resolv': 'resolv', 'xml': 'xml'}
    let g:vimwiki_list = [gyr_wiki, ibm_wiki]
    let g:vimwiki_hl_headers = 1
    let g:vimwiki_hl_cb_checked = 1
    "let g:vimwiki_folding = 1
    let g:vimwiki_fold_lists = 1
    let g:vimwiki_html_header_numbering = 1
endif

" [DISABLE]Fuzzyfinder:{{{3
"if isdirectory($HOME."/.vim/bundle/vim-fuzzyfinder")
"    "let g:fuf_modesDisable = [ 'dir', 'mrufile', 'mrucmd', 'bookmarkdir', 'tag', 'taggedfile', 'jumplist', 'changelist', 'quickfix', 'line', 'help', 'givendir', 'givencmd', ]
"    let g:fuf_modesDisable = [ 'dir', 'mrucmd', 'bookmarkfile', 'bookmarkdir', 'tag', 'buffertag', 'taggedfile', 'jumplist', 'changelist', 'quickfix', 'line', 'help', 'givendir', 'givencmd', ]
"    let g:fuf_abbrevMap = {
"                \   "^g:" : [$HOME.'/.gyr.d/**/'],
"                \   "^i:" : [$HOME.'/.ibm.d/**/'],
"                \   "^w:" : [$HOME],
"                \   "^d:" : [$HOME.'/work/debian/'],
"                \   "^k:" : [$HOME.'/work/powerkvm/kop-br-kop/**/'],
"                \   "^t:" : [$HOME.'/work/tmp/'],
"                \ }
"    let g:fuf_coveragefile_globPatterns = ['**/.*', '**/*', '.\w*/**']
"endif

" [DISABLE]Airline: {{{3
"if isdirectory($HOME."/.vim/bundle/vim-airline")
"    if has("gui_running")
"        let g:airline_powerline_fonts = 1
"    else
"        let g:airline_powerline_fonts = 0
"        let g:airline_left_sep = '⮀'
"        let g:airline_left_alt_sep = '⮁'
"        let g:airline_right_sep = '⮂'
"        let g:airline_right_alt_sep = '⮃'
"        let g:airline#extensions#branch#symbol = '⭠'
"        let g:airline#extensions#readonly#symbol = '⭤'
"        let g:airline_linecolumn_prefix = '⭡'
"    endif
"endif

" [DISABLE]Powerline: {{{3
"if isdirectory($HOME."/.vim/bundle/vim-powerline")
"    let g:Powerline_symbols = 'unicode'
"    "let g:Powerline_theme = 'solarized256'
"endif
"try
"    call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
"catch /.*/
"    echoerr "Failed to call Powerline functions"
"endtry
" [DISABLE]snipmate: {{{3
"let g:snips_author = 'Gustavo Yokoyama Ribeiro'

" [DISABLE]SkyBison: {{{3
"let g:skybison_fuzz = 1

" [DISABLE]Ctrlp: {{{3
"let g:ctrlp_custom_ignore = {
"    \ 'dir':  '\v[\/](\.git|\.hg|\.svn|\.cache|\.vim-tmp|\.vim-fuf-data|\.macromedia|\.adobe|\.thumbnails|\.mozilla|\.pulse|\.lastpass|\.dbus)$',
"    \ 'file': '\.exe$\|\.so$\|\.dll$|\.jar$|\.class$|\.o$|\.pyc$|\.jpg$|\.jpeg$|\.png$|\.gif$|\.mp3$|\.flv$|\.flac$|\.pdf$|\.ods$|\.deb$|\.rpm$|\.odp$',
"    \ }
""let g:ctrlp_user_command = 'find -L %s -xtype f'
"let g:ctrlp_user_command = {
"    \ 'types': {
"        \ 1: ['.git', 'cd %s && git ls-files'],
"        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
"        \ },
"    \ 'fallback': 'find -L %s -xtype f'
"    \ }
""let g:ctrlp_map = '<leader><CR>'
""let g:ctrlp_extensions = ['tag']
""let ctrlp_filter_greps = "".
""    \ "egrep -iv '\\.(" .
""    \ "jar|class|swp|swo|log|so|o|pyc|jpe?g|png|gif|mo|po" .
""    \ ")$' | " .
""    \ "egrep -v '^(\\./)?(" .
""    \ "deploy/|lib/|classes/|libs/|deploy/vendor/|.git/|.hg/|.svn/|.*migrations/" .
""    \ ")'"
""
""let my_ctrlp_user_command = "" .
""    \ "find -L %s -type f | " .
""    \ ctrlp_filter_greps
""
""let my_ctrlp_git_command = "" .
""    \ "cd %s && git ls-files | " .
""    \ ctrlp_filter_greps
""
""let my_ctrlp_hg_command = "" .
""    \ "hg --cwd %s locate -I . | " .
""    \ ctrlp_filter_greps
""
""let g:ctrlp_user_command = {
""            \ 'types': {
""            \ 1: ['.git/', my_ctrlp_git_command],
""            \ 2: ['.hg/', my_ctrlp_hg_command],
""            \ },
""            \ 'fallback': my_ctrlp_user_command
""            \}

" [DISABLE]Yankstack: {{{3
"let g:yankstack_map_keys = 0
"call yankstack#setup()

" [DISABLE]taglist:{{{3
"let Tlist_Auto_Open = 0
"let Tlist_Compact_Format = 0
"let Tlist_Enable_Fold_Column = 0
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_File_Fold_Auto_Close = 1
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_Inc_Winwidth = 0
"let Tlist_Use_Right_Window = 1
"let Tlist_WinWidth = 28

" [DISABLE]yankring {{{3
"let g:yankring_history_dir = s:base_dir

" [DISABLE]source explorer:{{{3
"" // Set the window height of Source Explorer
"let g:SrcExpl_winHeight = 8
"" // Set 100 ms for refreshing the Source Explorer
"let g:SrcExpl_refreshTime = 100
"" // Let the Source Explorer update the tags file when opening
"let g:SrcExpl_updateTags = 1
"" // Set "Enter" key to jump into the exact definition context
"let g:SrcExpl_jumpKey = "<ENTER>"
"" // Set "Space" key for back from the definition context
"let g:SrcExpl_gobackKey = "<SPACE>"
"" // In order to Avoid conflicts, the Source Explorer should know what plugins
"" // are using buffers. And you need add their bufname into the list below
"" // according to the command ":buffers!"
"let g:SrcExpl_pluginList = [
"        \ "__Tag_List__",
"        \ "_NERD_tree_",
"        \ "Source_Explorer"
"    \ ]
"" // Enable or disable local definition searching, and note that this is not
"" // guaranteed to work, the Source Explorer does not check the syntax for now,
"" // it only searches for a match with the keyword according to command 'gd'
"let g:SrcExpl_searchLocalDef = 1
"
"" // Use program 'ctags' with argument '-R *' to create or update a tags file  "
"let g:SrcExpl_updateTagsCmd = "ctags -R *"

" [DISABLE]Ack: {{{3
"let g:ackprg="ack-grep -H --nocolor --nogroup --column"

"}}}2
"-------------------------------------------------------------------------------

"}}}1
"===============================================================================
" Autocmd:{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""
"               A U T O C M D                   "
"""""""""""""""""""""""""""""""""""""""""""""""""

augroup Gyr
    autocmd!

    " Insert mode
    autocmd InsertEnter * setlocal list nolinebreak
    autocmd InsertLeave * setlocal nopaste nolist linebreak

    autocmd InsertEnter *
                \ if &number == 1 |
                \   setlocal norelativenumber |
                \ endif
    autocmd InsertLeave *
                \ if &number == 1 |
                \   setlocal relativenumber |
                \ endif

    " Cursorline
    autocmd WinLeave * setlocal nocursorline
    autocmd WinEnter * setlocal cursorline

    "Change to directory of the current file
    "autocmd BufEnter * if &ft != 'help' | lcd %:p:h | endif

    "autocmd BufEnter * let &scrolloff=999-&scrolloff

    "Return to last edit position
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Leave insert mode after 15 seconds of no input
"augroup CursorTimer
"    autocmd!
"    autocmd CursorHoldI * stopinsert
"    autocmd InsertEnter * let updaterestore=&updatetime | set updatetime=15000
"    autocmd InsertLeave * let &updatetime=updaterestore
"augroup END

augroup File_Type
    autocmd!
    " Prevent accidental editing .orig files
    autocmd BufRead *.orig set readonly

    autocmd BufEnter bash-fc-* setlocal filetype=sh

    autocmd FileType cpp,cc,h,hh,pl setlocal matchpairs+==:;

    autocmd FileType lua call gyrlib#ProgTextMode()

    autocmd Filetype php noremap <buffer><Leader>cs :php5 -l %<CR>
augroup END

" Endereço do arquivo de syntax
" http://aurelio.net/doc/vim/txt.vim    coloque em ~/.vim/syntax
"autocmd BufNewFile,BufRead *.txt source ~/.vim/after/syntax/txt.vim
"augroup Spell_Checker
"    "autocmd!
"    autocmd BufEnter,BufNew *.txt setlocal spell
"    " Git commits.
"    autocmd FileType gitcommit setlocal spell
"    " Subversion commits.
"    autocmd FileType svn       setlocal spell
"    " Mercurial commits.
"    autocmd FileType asciidoc  setlocal spell
"augroup END

if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \   if &omnifunc == "" |
                \       setlocal omnifunc=syntaxcomplete#Complete |
                \   endif
endif

" To be used when :gui is issued
"autocmd GuiEnter * colorscheme solarized

"augroup ShowNumber
"    autocmd!
"    autocmd WinEnter * setlocal number
"    autocmd WinLeave * setlocal nonumber
"augroup END

" Secure GPG key handling
augroup Gpg
    autocmd!
    " Disable stuff and switch to binary mode to read the encrypted file.
    autocmd BufNewFile,BufReadPre,FileReadPre *.gpg set secure viminfo= noswapfile nobackup nowritebackup history=0 binary
    autocmd BufReadPost,FileReadPost *.gpg :%!gpg -d 2>/dev/null
    " Switch to normal mode for editing
    autocmd BufReadPost,FileReadPost *.gpg set nobinary
    " Convert all text to encrypted text before writing
    autocmd BufWritePre,FileWritePre *.gpg set binary
    autocmd BufWritePre,FileWritePre *.gpg :%!gpg -e -r 'Gustavo Yokoyama Ribeiro <gustavoyr+vim AT gmail DOT com>' 2>/dev/null
    " Undo all steath stuffs, back to normal text
    autocmd BufWritePost,FileWritePost *.gpg undo
augroup END

" Enc
augroup Enc
    autocmd!
    " Disable stuff and switch to binary mode to read the encrypted file.
    autocmd BufNewFile,BufReadPre,FileReadPre *.enc set secure viminfo= noswapfile nobackup nowritebackup history=0 binary
    autocmd BufReadPost,FileReadPost *.enc :%!openssl aes-256-cbc -d -a -salt 2>/dev/null
    " Switch to normal mode for editing
    autocmd BufReadPost,FileReadPost *.enc set nobinary
    " Convert all text to encrypted text before writing
    autocmd BufWritePre,FileWritePre *.enc set binary
    autocmd BufWritePre,FileWritePre *.enc :%!openssl aes-256-cbc -e -a -salt 2>/dev/null
    " Undo all steath stuffs, back to normal text
    autocmd BufWritePost,FileWritePost *.enc undo
augroup END

"}}}1
"===============================================================================
" Mapping:{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""
"                 M A P P I N G                 "
"""""""""""""""""""""""""""""""""""""""""""""""""
" To insert a special character before it type (CTRL-v)
" In command mode <C-R> + register will return the register content in commnand line
" Do NOT user <F11> and <F12>, they have already been used by screen
" <Leader> = \ filename full path: expand("%:p") filename @%

"-------------------------------------------------------------------------------
" Miscelaneous:{{{2
"nnoremap <silent><unique><leader>v :e ~/.vimrc<CR>
nnoremap <silent><unique><leader>v :e ~/.vim/vimrc<CR>

" nnoremap <silent><unique><Leader><Insert> :setlocal paste!<Bar>echo 'Paste mode changed'<CR>

" Toggle show special chars
"nnoremap <silent><unique><Leader>li :set list! list?<CR>

" change directory to that of current file
"nnoremap <Leader>cd :cd%:p:h<cr>
" change local directory to that of current file
"nnoremap <Leader>lcd :lcd%:p:h<cr>

" 5*3=15, put the cursor in the first position and press <Leader>=
"map <unique><Leader>= <Esc>"myEEa=<C-R>=<C-R>m<CR><Esc>
" 5*3=15, when finish the expression press SHIFT+F1
"imap <unique><S-F1> <Space><Esc>"myBEa=<C-R>=<C-R>m<CR><Del>

"vnoremap <buffer> <silent> ;s <Esc>`>aSUFFIX<Esc>`<iPREFIX<Esc>
" vnoremap        Visual-mode keymap; no further expansion of the right-hand side
" <buffer>        Buffer-local. Won't apply in other buffers.
" <silent>        Mapping won't be echoed on the Vim command line
" ;s              Mapping is bound to sequence ;s
" <Esc>           Cancels selection
" `>              Go to end of former visual selection
" aSUFFIX<Esc>    Append SUFFIX
" `<              Go to beginning of former visual selection
" iPREFIX<Esc>    Insert PREFIX

"nnoremap <silent><unique><Leader>c :set cursorcolumn! cursorline!<CR>

nnoremap <unique><Leader>? ggVGg?

" The following beast is something i didn't write... it will return the
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
"nnoremap <silent><unique><Leader>cc :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" set text wrapping toggles
"nnoremap <silent><unique><Leader>w :set wrap!<CR>:set wrap?<CR>
"nnoremap <silent><unique><Leader><Bar> :set wrap linebreak nolist formatoptions-=t nonumber<CR>
"nnoremap <silent><unique><Leader><Bslash> :set nowrap nolinebreak list formatoptions+=t number<CR>
nnoremap <silent><unique><Leader><Del> :call gyrlib#ToggleTextMode()<CR>

" set line number mode
"nnoremap <silent><unique><Leader>n :call gyrlib#ToggleNumberMode()<CR>

" highlight any text after virtual column 80
"nnoremap <silent><unique><Leader>h :match ErrorMsg '\%>80v.\+'<CR>
" disable highlight any text after virtual column 80
"nnoremap <silent><unique><Leader>h :match ErrorMsg '\%>80v.\-'<CR>

" Underline a line
nnoremap <unique><Leader>= yyp^v$r=
nnoremap <unique><Leader>- yyp^v$r-
vnoremap <unique><Leader>" o<ESC>i"<ESC>gvol<ESC>a"<ESC>l
vnoremap <unique><Leader>[ o<ESC>i[<ESC>gvol<ESC>a]<ESC>l
vnoremap <unique><Leader>{ o<ESC>i{<ESC>gvol<ESC>a}<ESC>l
vnoremap <unique><Leader>( o<ESC>i(<ESC>gvol<ESC>a)<ESC>l
vnoremap <unique><Leader>< o<ESC>i<<ESC>gvol<ESC>a><ESC>l
vnoremap <unique><Leader>' o<ESC>i'<ESC>gvol<ESC>a'<ESC>l
vnoremap <unique><Leader>` o<ESC>i`<ESC>gvol<ESC>a`<ESC>l

" very magic avoid the need to escape parenthesis, curly braces, pluses, etc
"nnoremap / /\v
"nnoremap ? ?\v
"
" Hide/Show Comments:
"nnoremap <unique><Leader>sc :hi! link Comment Ignore<CR>
"nnoremap <unique><Leader>hc :hi! link Comment Comment<CR>

" Better spell menu
"nnoremap <unique><Leader>s ea<C-X><C-S>

"nnoremap <unique><CR> o<ESC>
"nnoremap <unique><S-CR> O<ESC>
"
" https://github.com/paradigm/dotfiles/blob/master/.vimrc
" Create new text objects for pairs of identical characters
for char in ['$',',','.','/','-','=',':']
    exec 'xnoremap i' . char . ' :<C-U>silent!normal!T' . char . 'vt' . char . '<CR>'
    exec 'onoremap i' . char . ' :normal vi' . char . '<CR>'
    exec 'xnoremap a' . char . ' :<C-U>silent!normal!F' . char . 'vf' . char . '<CR>'
    exec 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor
" Create a text object for folding regions
"xnoremap if :<C-U>silent!normal![zjV]zk<CR>
"onoremap if :normal Vif<CR>
"xnoremap af :<C-U>silent!normal![zV]z<CR>
"onoremap af :normal Vaf<CR>

noremap <unique><Leader>sl :source $HOME/.vim-tmp/sessions/*

" insert shebang
inoremap <expr> #! "#!" . substitute(system("which env"), "\n", "", "") . " " . &filetype

"}}}2
"------------------------------------------------------------------------
" Insert Mode:{{{2
" paste previous insert text
"inoremap <unique><C-Y> <C-A>
" paste text above
"inoremap <unique><C-K> <C-Y>
" paste text below
"inoremap <unique><C-J> <C-E>


"}}}2
"-------------------------------------------------------------------------------
" Copy/Paste:{{{2
"nnoremap <unique>Y y$
noremap <unique>Y y$
noremap <Leader>y "+y
noremap <Leader>p :set paste<CR>:put  +<CR>:set nopaste<CR>
noremap <Leader>P :set paste<CR>:put! +<CR>:set nopaste<CR>
"map <Leader>p "+p
"map <Leader>P "+P
" Paste and reformat/reindent
"nnoremap <unique><Leader>P P'[v']=
"nnoremap <unique><Leader>p p'[v']=
" Make shift-insert work like in Xterm
inoremap <S-Insert> <MiddleMouse>
"noremap! <S-Insert> <MiddleMouse>
" select last pasted text, via http://stackoverflow.com/a/4775281/955926
nnoremap <expr> gy "`[".getregtype(v:register)[0]."`]"

"}}}2
"-------------------------------------------------------------------------------
" Buffer:{{{2
" mapping mini-buffer
"nnoremap <silent><S-Tab> :bp<CR>:cd %:p:h<CR>
"nnoremap <silent><Tab> :bn<CR>:cd %:p:h<CR>
"nnoremap <Leader><Tab> <Leader>mbt
" Go to the alternate buffer
"nnoremap <silent><unique><Leader><Tab> :b#<CR>
"nnoremap <silent><unique><Tab> :bnext<CR>
"nnoremap <silent><unique><S-Tab> :bprevious<CR>
"nnoremap <silent><unique>[b :bprevious<CR>
"nnoremap <silent><unique>]b :bnext<CR>
"nnoremap <silent><unique>[B :bfirst<CR>
"nnoremap <silent><unique>]B :blast<CR>
"nnoremap <silent><unique><Leader>b :ls<bar>let nr = input("Which one: ")<Bar>exec "b".nr<CR>
" OR see wildcharm on setting above
nnoremap <unique><Leader>b :buffer <C-z>*
"nnoremap <silent><unique><Leader>c :clist<bar>let nr = input("Which one: ")<Bar>exec "cc".nr<CR>
"nnoremap <silent><unique><Leader>b :ls<CR>:sb<Space>
" Create a scratch buffer
nnoremap <silent><unique><Leader>z :vnew<Bar>set buftype=nofile<Bar>echo "Scratch buffer"<CR>

"}}}2
"-------------------------------------------------------------------------------
" File:{{{2
nnoremap <unique><Leader>eg :edit $HOME/.gyr.d/**/*
nnoremap <unique><Leader>ev :edit $HOME/.vim/**/*
nnoremap <unique><Leader>ei :edit $HOME/.ibm.d/**/*
nnoremap <unique><Leader>ek :edit $HOME/work/powerkvm/kop-br-kop/**/*
nnoremap <unique><Leader>e/ :edit **/*
nnoremap <unique><Leader>e. :edit %:p:h/**/*
nnoremap <unique><Leader>eh :edit ~/*
"}}}2
"-------------------------------------------------------------------------------
" Tab:{{{2
"nnoremap <silent><unique>[t :tabprevious<CR>
"nnoremap <silent><unique>]t :tabnext<CR>
"nnoremap <silent><unique>[T :tabfirst<CR>
"nnoremap <silent><unique>]T :tablast<CR>

"}}}2
"-------------------------------------------------------------------------------
" Fixes:{{{2
" Disable enter 'Ex mode'
noremap Q <Nop>
" Don't use Ex mode, use Q for formatting
"noremap Q gq
noremap q: <Nop>

noremap <F1> <Esc>
noremap! <F1> <Esc>

"}}}2
"-------------------------------------------------------------------------------
" Centralize Move And Search:{{{2
" make search results appear in the middle of the screen
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap * *zvzz
" Don't move on *
"nnoremap * *<C-O>
nnoremap # #zvzz<C-O>
nnoremap <C-]> <C-]>zvzz
nnoremap <C-T> <C-T>zvzz
noremap <silent><unique><Leader>zz  :let &scrolloff=999-&scrolloff<CR>

" next/previous word under cursor in same column
nnoremap g* yiw:let c=col('.')<CR>:let @/="^.*\\%".c.'c\zs'.@"<CR>n
nnoremap g# yiw:let c=col('.')<CR>:let @/="^.*\\%".c.'c\zs'.@"<CR>N

" move up/down between wrapped lines
" -- Changes up/down arrow keys to behave screen-wise, rather than file-wise.
"    Behaviour is unchanged in operator-pending mode.
"    Behaviour is unchanged for the j and k bindings.
noremap k gk
noremap j gj
"noremap 0 g0
"noremap $ g$
"noremap ^ g^

noremap gk k
noremap gj j
"noremap g0 0
"noremap g$ $
"noremap g^ ^

" Jumplist
" Older position in jumplist (<TAB> for newer position)
nnoremap <unique><S-Tab> <C-O>
"nnoremap <unique>[j <C-o>
"nnoremap <unique>]j <C-i>

" unset search highlight
"nnoremap <silent><Leader>/ :let @/=""<CR>  :echo 'Highlights Cleared'<CR>
"nnoremap <silent><unique><Leader>/ :nohls<Bar>echo 'Highlights Cleared'<CR>
nnoremap <unique><Esc><Esc> <Esc>:nohlsearch<Bar>echo 'Highlights Cleared'<CR>

nnoremap <unique><Leader>* [I:let nr = input("Which one: ")<Bar>exec "normal! ".nr."[\t"<CR>

" Search the selected text
vnoremap <unique>* y/<C-R>"<CR>
vnoremap <unique># y?<C-R>"<CR>

if &diff
    nnoremap ]c ]czz
    nnoremap [c [czz
endif

nnoremap <unique><S-Space> <C-U>

noremap <unique><Up> <C-Y>
noremap <unique><Down> <C-E>

" Small unimpaired map set
"noremap <unique>[a :previous<CR>
"noremap <unique>]a :next<CR>
"noremap <unique>[A :first<CR>
"noremap <unique>]A :last<CR>
"noremap <unique>[b :bprevious<CR>
"noremap <unique>]b :bnext<CR>
"noremap <unique>[B :bfirst<CR>
"noremap <unique>]B :blast<CR>
"noremap <unique>[l :lprevious<CR>
"noremap <unique>]l :lnext<CR>
"noremap <unique>[L :lfirst<CR>
"noremap <unique>]L :llast<CR>
"noremap <unique>[q :cprevious<CR>
"noremap <unique>]q :cnext<CR>
"noremap <unique>[Q :cfirst<CR>
"noremap <unique>]Q :clast<CR>

"}}}2
"-------------------------------------------------------------------------------
" Visual Mode:{{{2

if &diff
    " easily handle diffing
    vnoremap < :diffget<CR>
    vnoremap > :diffput<CR>
else
    " visual shifting (builtin-repeat)
    vnoremap < <gv
    vnoremap > >gv
endif
" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

"}}}2
"-------------------------------------------------------------------------------
" Completion:{{{2
" bind Ctrl+Space for omnicompletion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "<C-R>=gyrlib#SmartComplete()<CR>" :
            \ "<C-X><C-O>".
                \ "<C-R>=pumvisible() ?" .
                \ "\"\\<lt>C-P>\\<lt>C-N>\" :" .
                \ "\"\\<lt>C-X>\\<lt>C-N>\"<CR>"
" Completion popup selection like other IDEs
inoremap <expr> <Esc>      pumvisible() ? "\<C-E>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-Y>" : "\<C-G>u\<CR>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-P>\<C-N>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-P>\<C-N>" : "\<PageUp>"
" move up/down between wrapped lines
" Stop remapping from interfering with Omni-complete popup
inoremap <expr><Up> pumvisible() ? "\<C-P>" : "\<C-O>gk"
inoremap <expr><Down> pumvisible() ? "\<C-N>" : "\<C-O>gj"

"}}}2
"-------------------------------------------------------------------------------
" Fold:{{{2
" n to use the <space> to represent characters without folding
" normal! za' toggles folds
" 'silent!' allows to avoid error message when current line doesn't delong to fold.
" (foldlevel('.')?'':'l') adds forward moving only if current line doesn't delong to fold.
"nnoremap <silent><unique><Space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l').'zz'<CR>
nnoremap <silent><unique><expr> <Space> foldlevel('.') == 0 ? "\<C-D>" : ":exe 'silent! normal! za'.(foldlevel('.')?'':'l').'zz'\<CR>"
vnoremap <silent><unique><Space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l').'zz'<CR>
"nnoremap <space> za

" Refocus folder
"nnoremap <unique><Leader>z zMzvzz

" <space> in visual mode creates a fold over the marked range
"vnoremap <unique><space> zf

" Make fold for {}
"nnoremap <Leader>f viBzf
"nnoremap <C-F> zfa{
" Make fold for all {}
"nnoremap <silent><unique><Leader>Fm :set foldmethod=marker foldmarker={,}<CR>
" Delete all folds
"noremap <silent><unique>zE :set foldmethod=manual<CR>zE
" Toggle fold recursively: zA
" Open all folds: zR
" Close all folds: zM

"}}}2
"-------------------------------------------------------------------------------
" Window:{{{2
" Resplit windows
nnoremap <C-W>y <C-W><C-W>:close<Bar>split #<CR>
nnoremap <C-W>Y <C-W><C-W>:close<Bar>vsplit #<CR>

"}}}2
"-------------------------------------------------------------------------------
" Plugins:{{{2

" Tagbar:{{{3
try
    nnoremap <silent><unique><Leader>t :TagbarOpenAutoClose<CR>
catch /.*/
    echoerr "Failed to load Tagbar functions"
endtry

" Gitv:{{{3
try
    nnoremap <silent><unique><Leader>g :Gitv<CR>
catch /.*/
    echoerr "Failed to load Gitv functions"
endtry

" Syntastic:{{{3
try
    nnoremap <silent><unique><Leader><CR> :SyntasticCheck<CR>
    "nnoremap <silent><unique><Leader>sr :SyntasticReset<CR>
    nnoremap <silent><unique><Leader><BS> :SyntasticReset<CR>
catch /.*/
    echoerr "Failed to load Gitv functions"
endtry

" [DISABLE]Fuzzyfinder:{{{3
"try
"    noremap <silent><unique><Leader><Bslash> :FufFile<CR>
"    noremap <silent><unique><Leader><Space> :FufCoverageFile<CR>
"    noremap <silent><unique><Leader><CR> :FufMruFile<CR>
"    noremap <silent><unique><Leader><Tab> :FufBuffer<CR>
"    "noremap <silent><unique><Leader>] :FufBufferTagAllWithCursorWord!<CR>
"    " Load auxiliar file
"    "noremap <silent><unique><Leader>a :call fuf#givenfile#launch('', 0, '>AuxFile>', split(glob('~/.vim-tmp/aux-files/*'), "\n"))<CR>
"    " Load saved session
"    "noremap <silent><unique><Leader>o :call fuf#callbackfile#launch('~/.vim-tmp/sessions/', 0, '>Session>', '', gyrlib#ListenerLoadSession)<CR>
"    " Diff current file with selected one
"    noremap <silent><unique><Leader>d :call fuf#callbackfile#launch('', 0, '>DiffFile>', '', gyrlib#ListenerLoadDiffFile)<CR>
"catch /.*/
"    echoerr "Failed to load FuzzyFinder functions"
"endtry

" [DISABLE]Gundo:{{{3
"try
"    nnoremap <silent><unique><Leader><BS> :GundoToggle<CR>
"catch /.*/
"    echoerr "Failed to load Gundo functions"
"endtry

" [DISABLE]SkyBison:{{{3
"try
"    nnoremap <silent><unique><Leader>b :<C-U>call SkyBison("b ")<CR>
"    nnoremap <silent><unique><Leader>c :<C-U>call SkyBison("clist ")<CR>
"    nnoremap <silent><unique><Leader>h :<C-U>call SkyBison("he ")<CR>
"    nnoremap <silent><unique><Leader><Space> :<C-U>call SkyBison("e ")<CR>
"    nnoremap <silent><unique><Leader>eg :<C-U>call SkyBison("e ~/.gyr.d/")<CR>
"    nnoremap <silent><unique><Leader>ei :<C-U>call SkyBison("e ~/.ibm.d/")<CR>
"    nnoremap <silent><unique><Leader>ea :<C-U>call SkyBison("e ~/work/perfworkload/autobench/")<CR>
"    cnoremap <silent><unique><S-TAB> <C-R>=SkyBison("")<CR><CR>
"catch /.*/
"    echoerr "Failed to load SkyBison functions"
"endtry

" [DISABLE]Yankstack: {{{3
"try
"    nmap <leader>p <Plug>yankstack_substitute_older_paste
"    nmap <leader>P <Plug>yankstack_substitute_newer_paste
"catch /.*/
"    echoerr "Failed to load Yankstack functions"
"endtry
" [DISABLE]CtrlP:{{{3
"try
"    noremap <silent><unique><Leader>b :CtrlPBuffer<CR>
"    noremap <silent><unique><Leader>] :CtrlPTag<CR>
"catch /.*/
"    echoerr "Failed to load CtrlP functions"
"endtry

" [DISABLE]taglist:{{{3
"try
"    nnoremap <silent><unique><Leader>t :TlistToggle<CR>
"catch /.*/
"    echoerr "Failed to load TagList functions"
"endtry

" [DISABLE]NERDTree:{{{3
"nnoremap <silent><unique><F4> :NERDTreeToggle<CR>

" [DISABLE]Source Explorer:{{{3
"nnoremap <silent><unique><F7> :SrcExplToggle<CR>

" [DISABLE]Conque:{{{3
"try
"    nnoremap <silent><unique>[29~ :ConqueTermSplit bash<CR>
"catch /.*/
"    echoerr "Failed to load Conque functions"
"endtry

"}}}2
"-------------------------------------------------------------------------------

"}}}1
"===============================================================================
" Abbreviation:{{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             A B B R E V I A T I O N S              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" abbreviation for the current file name
" Equivalents to <C-R>%
"ab file,, <C-R>=expand("%:t")<CR><C-R>=gyrlib#EatChar('\s')<CR>
"ab file,, <C-R>=expand("%F")<CR><C-R>=gyrlib#EatChar('\s')<CR>
ab file,, <C-R>%<C-R>=gyrlib#EatChar('\s')<CR>
ab dirfile,, <C-R>=expand("%:p")<CR><C-R>=gyrlib#EatChar('\s')<CR>
ab dir,, <C-R>=expand("%:p:h")<CR><C-R>=gyrlib#EatChar('\s')<CR>

" Paste in commnad line the word under cursor
"cab p,, <C-R><C-W>
" If forgot to sudo vim a file, do that with :w!!
"cab w,, %!sudo tee > /dev/null %<CR>
"cab w,, %!sudo tee > /dev/null %<CR>
cab w,, w !sudo tee % > /dev/null <CR>
cab todo,, e ~/.vim-tmp/gyr.todo<CR>
" Copy the entire buffer to the system clipboard
cab y,, %y+<CR>

" open files in the current buffer directory
"cab e,, e <C-R>=expand("%:p:h")."/"<CR><C-R>=gyrlib#EatChar('\s')<CR>

iab gyr,, Gustavo Yokoyama Ribeiro<C-R>=gyrlib#EatChar('\s')<CR>
iab gyrmail,, Gustavo Yokoyama Ribeiro <gustavoyr+vim AT gmail DOT com><C-R>=gyrlib#EatChar('\s')<CR>
iab ts,, <C-R>=strftime("%Y%m%d %H:%M:%S")<cr><C-R>=gyrlib#EatChar('\s')<CR>
iab dt,, <C-R>=strftime("%Y%m%d")<cr><C-R>=gyrlib#EatChar('\s')<CR>

"}}}1
"===============================================================================
" Command:{{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               C O M M A N D S                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

"}}}1
"===============================================================================
" GUI:{{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               M I S C E L A N E O U S              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    set guioptions+=c
    set guioptions-=r
    set guioptions-=L
    set guioptions-=T
    set mouse=
    "set guifont=ProggyCleanTTSZ\ 12
    "set guifont=Terminus\ 8
    set guifont=Inconsolata\ for\ Powerline\ Medium\ 10
    "set guifont=Inconsolata\ 10
    "set guifont=Inconsolata-dz-Powerline \10
    "colorscheme gyrcolor
    let g:solarized_visibility="high"
    "let g:solarized_visibility="low"
    set background=dark
    colorscheme solarized
    let g:lightline.colorscheme = 'solarized'
    call togglebg#map("<F5>")
endif
if has("win32")
    set guifont=ProggyCleanSZ:h8:cDEFAULT
endif

"}}}1
"===============================================================================

"===============================================================================
" Tips & Tricks:{{{1

"-------------------------------------------------------------------------------
" Normal mode:{{{2
"
" cit   => change inside tag
" g;    => go to older changed position (backward)
" g,    => go to newer changed position (forward)
" CTRL-O => go to older jump list position
" CTRL-I => go to newer jump list position
" gi    => start inserting in the last insert position
" gv    => repeat last selection
" ga    => code of character under cursor
" g?    => Rot13 encode (embaralha o texto)
" gn    => go to next match and select it
" [i    => show first occurence of pattern, for instance, show first variable attribution
" [I    => list of matching pattern
" ]]    => begin function
" ][    => end function
" !!<command> => replace the currnet line with the command output
" C-W C-] ==> Open the definition in a horizontal split
" gq}   => format sentence
" @<register> => execute the content of register, works with +, ., #, :, / like
"                C-R
" vi"p  => replace the text inside '"' with the content of default buffer
"
" No search o caractere & indica a string pela qual buscamos. Ex:
" teste
" :%s/teste/& concluído/
" teste concluído
"
" }}}2
"-------------------------------------------------------------------------------
" Insertion mode:{{{2
"
" C-X s         => spell correction completion
" C-R "         => insert last delete/yank text
" C-R C-O "     => insert literal control characters last delete/yank text
" C-V 10<enter> => insert character code 10
" C-K NU        => insert character represented by the two letters
" C-R =         =>
" C-T           => add indent level
" C-D           => remove indent level
" C-y           => insert the character which is above the cursor.
" C-e           => insert the character which is below the cursor.
" C-O<cmd>      => execute one command, return to Insert mode
" C-\ C-O<cmd>  => like CTRL-O but don't move the cursor
" }}}2
"-------------------------------------------------------------------------------
" Visual mode:{{{2
"
" o     => switch cursor to the other corner, continue selection from there.
" }}}2
"-------------------------------------------------------------------------------
" Command mode:{{{2
"
" :digraphs => display table character codes
" :r!<command> => added command output on the next line
" :new +r!<command> => display commant output in a new window (remember to escape spaces "\ ")
" :<CTRL-D> => list command or files in directory
" :g/search_term/# => display each line containing 'search_term' with line numbers
" :vim /shoe/ **/*.java => vim `grep -Rl shoe | grep .java`
"         will find all java files under the current directory,
"         filter for ones containing the regex /shoe/, and queue them all up to be
"         edited. :cw will open the list, letting you jump between all those files.
" :h :w_c
" }}}2
"-------------------------------------------------------------------------------
" Explore mode:{{{2
"
" -  go back directory tree
" %  create a new file
" d  create a new directory
" R  rename the file/directory under the cursor
" D  Delete the file/directory under the cursor
" }}}2
"-------------------------------------------------------------------------------

"<C-a> and <C-x> in normal mode to increment/decrement numbers.
"
"<C-v> to start visual-block mode.
"
"<C-y> and <C-e> in insert mode to insert the character above and below.
"
"<C-w> in insert mode to delete the last typed word.
"
"<C-a> in insert mode to insert the last inserted text.
"
"<C-r>x and <C-r>= to insert the content of register x or the result of an expression. Useful in insert mode and on the command line. Also <C-r><C-w> to insert the current word in the command line.
"
"<C-o> and <C-i> to navigate the jumplist.
"
"<C-]> and <C-t> to go to definition and back.
"
"<C-f> and <C-b> to go page down and page up.

" Creating mappings that accept a count:
" http://vimcasts.org/episodes/creating-mappings-that-accept-a-count/
" Ex: nnoremap Q n.
" nnoremap Q @='n.'<CR>
" nnoremap Q :normal n.<CR>

" }}}1
"===============================================================================

" vim: set filetype=vim fileformat=unix foldmethod=marker:
