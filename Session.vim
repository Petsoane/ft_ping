let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <C-R>	 <Plug>snipMateShow
inoremap <silent> <Plug>CocRefresh =coc#_complete()
imap <M-P> <Plug>yankstack_substitute_newer_paste
imap <M-p> <Plug>yankstack_substitute_older_paste
imap <C-G>S <Plug>ISurround
imap <C-G>s <Plug>Isurround
imap <C-S> <Plug>Isurround
inoremap <silent> <Plug>snipMateShow =snipMate#ShowAvailableSnips()
inoremap <silent> <Plug>snipMateBack =snipMate#BackwardsSnippet()
inoremap <silent> <Plug>snipMateTrigger =snipMate#TriggerSnippet(1)
inoremap <silent> <Plug>snipMateNextOrTrigger =snipMate#TriggerSnippet()
inoremap <silent> <SNR>46_AutoPairsReturn =AutoPairsReturn()
inoremap <silent> <Plug>(ale_complete) :ALEComplete
inoremap <expr> <S-Tab> pumvisible() ? "\" : "\"
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>
cnoremap <C-K> 
cnoremap <C-E> <End>
cnoremap <C-A> <Home>
inoremap <C-J> =snipMate#TriggerSnippet()
map  <Plug>(ctrlp)
map  h
xmap 	 <Plug>snipMateVisual
smap 	 <Plug>snipMateNextOrTrigger
snoremap <NL> i<Right>=snipMate#TriggerSnippet()
nmap <NL> j
xmap <NL> j
omap <NL> j
map  k
map  l
nmap  <Plug>yankstack_substitute_newer_paste
nmap  <Plug>yankstack_substitute_older_paste
xnoremap <silent>  :call multiple_cursors#new("v", 0)
nnoremap <silent>  :call multiple_cursors#new("n", 1)
nnoremap  :call GotoFile("new")
nnoremap f :call GotoFile("new")
map   /
vnoremap <silent> # :call VisualSelection('', '')?=@/
vnoremap $e `>a``<i`
vnoremap $q `>a'`<i'
vnoremap $$ `>a"`<i"
vnoremap $3 `>a}`<i{
vnoremap $2 `>a]`<i[
vnoremap $1 `>a)`<i(
vnoremap <silent> * :call VisualSelection('', '')/=@/
vmap + <Plug>(expand_region_expand)
nmap + <Plug>(expand_region_expand)
nnoremap ,s :ToggleWorkspace
map ,p :cp
map ,n :cn
map ,co ggVGy:tabnew:set syntax=qfpgg
map ,cc :botright cope
vnoremap <silent> ,r :call VisualSelection('replace', '')
map ,g :Ack 
map ,e :e! ~/.vim_runtime/my_configs.vim
nnoremap <silent> ,d :GitGutterToggle
nmap <silent> ,a <Plug>(ale_next_wrap)
nnoremap <silent> ,z :Goyo
map ,nf :NERDTreeFind
map ,nb :NERDTreeFromBookmark 
map ,nn :NERDTreeToggle
map ,b :CtrlPBuffer
map ,j :CtrlP
map ,f :CtrlPMRU
map ,o :BufExplorer
map ,pp :setlocal paste!
map ,x :e ~/buffer.md
map ,q :e ~/buffer
noremap ,m mmHmt:%s///ge'tzt'm
map ,s? z=
map ,sa zg
map ,sp [s
map ,sn ]s
map ,ss :setlocal spell!
map ,cd :cd %:p:h:pwd
map ,te :tabedit =expand("%:p:h")/
nmap ,tl :exe "tabn ".g:lasttab
map ,t, :tabnext 
map ,tm :tabmove 
map ,tc :tabclose
map ,to :tabonly
map ,tn :tabnew
map ,h :bprevious
map ,l :bnext
map ,ba :bufdo bd
map ,bd :Bclose:tabclosegT
map <silent> , :noh
nmap ,w :w!
nmap 0 ^
xmap 0 ^
omap 0 ^
imap ½ $
cmap ½ $
imap Ð <Plug>yankstack_substitute_newer_paste
imap ð <Plug>yankstack_substitute_older_paste
xmap S <Plug>VSurround
vmap Si S(i_f)
nmap _ <Plug>(expand_region_shrink)
xmap _ <Plug>(expand_region_shrink)
nmap cS <Plug>CSurround
nmap cs <Plug>Csurround
nmap cr <Plug>(abolish-coerce-word)
nmap ds <Plug>Dsurround
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
xnoremap <silent> g<M-s> :call multiple_cursors#select_all("v", 0)
xnoremap <silent> gó :call multiple_cursors#select_all("v", 0)
nnoremap <silent> g<M-s> :call multiple_cursors#select_all("n", 0)
nnoremap <silent> gó :call multiple_cursors#select_all("n", 0)
xnoremap <silent> g<C-S> :call multiple_cursors#new("v", 0)
xnoremap <silent> g :call multiple_cursors#new("v", 0)
nnoremap <silent> g<C-S> :call multiple_cursors#new("n", 0)
nnoremap <silent> g :call multiple_cursors#new("n", 0)
nmap gcu <Plug>Commentary<Plug>Commentary
nmap gcc <Plug>CommentaryLine
omap gc <Plug>Commentary
nmap gc <Plug>Commentary
xmap gc <Plug>Commentary
nnoremap gf :call GotoFile("")
nmap gw :InteractiveWindow
vnoremap <silent> gv :call VisualSelection('gv', '')
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nnoremap <SNR>155_: :=v:count ? v:count : ''
smap <S-Tab> <Plug>snipMateBack
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
nnoremap <silent> <Plug>(startify-open-buffers) :call startify#open_buffers()
onoremap <silent> <Plug>(coc-classobj-a) :call coc#rpc#request('selectSymbolRange', [v:false, '', ['Interface', 'Struct', 'Class']])
onoremap <silent> <Plug>(coc-classobj-i) :call coc#rpc#request('selectSymbolRange', [v:true, '', ['Interface', 'Struct', 'Class']])
vnoremap <silent> <Plug>(coc-classobj-a) :call coc#rpc#request('selectSymbolRange', [v:false, visualmode(), ['Interface', 'Struct', 'Class']])
vnoremap <silent> <Plug>(coc-classobj-i) :call coc#rpc#request('selectSymbolRange', [v:true, visualmode(), ['Interface', 'Struct', 'Class']])
onoremap <silent> <Plug>(coc-funcobj-a) :call coc#rpc#request('selectSymbolRange', [v:false, '', ['Method', 'Function']])
onoremap <silent> <Plug>(coc-funcobj-i) :call coc#rpc#request('selectSymbolRange', [v:true, '', ['Method', 'Function']])
vnoremap <silent> <Plug>(coc-funcobj-a) :call coc#rpc#request('selectSymbolRange', [v:false, visualmode(), ['Method', 'Function']])
vnoremap <silent> <Plug>(coc-funcobj-i) :call coc#rpc#request('selectSymbolRange', [v:true, visualmode(), ['Method', 'Function']])
nnoremap <silent> <Plug>(coc-cursors-position) :call coc#rpc#request('cursorsSelect', [bufnr('%'), 'position', 'n'])
nnoremap <silent> <Plug>(coc-cursors-word) :call coc#rpc#request('cursorsSelect', [bufnr('%'), 'word', 'n'])
vnoremap <silent> <Plug>(coc-cursors-range) :call coc#rpc#request('cursorsSelect', [bufnr('%'), 'range', visualmode()])
nnoremap <silent> <Plug>(coc-refactor) :call       CocActionAsync('refactor')
nnoremap <silent> <Plug>(coc-command-repeat) :call       CocAction('repeatCommand')
nnoremap <silent> <Plug>(coc-float-jump) :call       coc#util#float_jump()
nnoremap <silent> <Plug>(coc-float-hide) :call       coc#util#float_hide()
nnoremap <silent> <Plug>(coc-fix-current) :call       CocActionAsync('doQuickfix')
nnoremap <silent> <Plug>(coc-openlink) :call       CocActionAsync('openLink')
nnoremap <silent> <Plug>(coc-references-used) :call       CocActionAsync('jumpUsed')
nnoremap <silent> <Plug>(coc-references) :call       CocActionAsync('jumpReferences')
nnoremap <silent> <Plug>(coc-type-definition) :call       CocActionAsync('jumpTypeDefinition')
nnoremap <silent> <Plug>(coc-implementation) :call       CocActionAsync('jumpImplementation')
nnoremap <silent> <Plug>(coc-declaration) :call       CocActionAsync('jumpDeclaration')
nnoremap <silent> <Plug>(coc-definition) :call       CocActionAsync('jumpDefinition')
nnoremap <silent> <Plug>(coc-diagnostic-prev-error) :call       CocActionAsync('diagnosticPrevious', 'error')
nnoremap <silent> <Plug>(coc-diagnostic-next-error) :call       CocActionAsync('diagnosticNext',     'error')
nnoremap <silent> <Plug>(coc-diagnostic-prev) :call       CocActionAsync('diagnosticPrevious')
nnoremap <silent> <Plug>(coc-diagnostic-next) :call       CocActionAsync('diagnosticNext')
nnoremap <silent> <Plug>(coc-diagnostic-info) :call       CocActionAsync('diagnosticInfo')
nnoremap <silent> <Plug>(coc-format) :call       CocActionAsync('format')
nnoremap <silent> <Plug>(coc-rename) :call       CocActionAsync('rename')
nnoremap <Plug>(coc-codeaction-line) :call       CocActionAsync('codeAction',         'n')
nnoremap <Plug>(coc-codeaction) :call       CocActionAsync('codeAction',         '')
vnoremap <silent> <Plug>(coc-codeaction-selected) :call       CocActionAsync('codeAction',         visualmode())
vnoremap <silent> <Plug>(coc-format-selected) :call       CocActionAsync('formatSelected',     visualmode())
nnoremap <Plug>(coc-codelens-action) :call       CocActionAsync('codeLensAction')
nnoremap <Plug>(coc-range-select) :call       CocActionAsync('rangeSelect',     '', v:true)
vnoremap <silent> <Plug>(coc-range-select-backward) :call       CocActionAsync('rangeSelect',     visualmode(), v:false)
vnoremap <silent> <Plug>(coc-range-select) :call       CocActionAsync('rangeSelect',     visualmode(), v:true)
xmap <M-P> <Plug>yankstack_substitute_newer_paste
nmap <M-P> <Plug>yankstack_substitute_newer_paste
xmap <M-p> <Plug>yankstack_substitute_older_paste
nmap <M-p> <Plug>yankstack_substitute_older_paste
nnoremap <silent> <Plug>SurroundRepeat .
snoremap <silent> <Plug>snipMateBack a=snipMate#BackwardsSnippet()
snoremap <silent> <Plug>snipMateNextOrTrigger a=snipMate#TriggerSnippet()
xnoremap <silent> <M-s> :call multiple_cursors#select_all("v", 0)
nnoremap <silent> <M-s> :call multiple_cursors#select_all("n", 1)
xnoremap <silent> <C-S> :call multiple_cursors#new("v", 0)
nnoremap <silent> <C-S> :call multiple_cursors#new("n", 1)
nnoremap <silent> <Plug>GitGutterPreviewHunk :call gitgutter#utility#warn('please change your map <Plug>GitGutterPreviewHunk to <Plug>(GitGutterPreviewHunk)')
nnoremap <silent> <Plug>(GitGutterPreviewHunk) :GitGutterPreviewHunk
nnoremap <silent> <Plug>GitGutterUndoHunk :call gitgutter#utility#warn('please change your map <Plug>GitGutterUndoHunk to <Plug>(GitGutterUndoHunk)')
nnoremap <silent> <Plug>(GitGutterUndoHunk) :GitGutterUndoHunk
nnoremap <silent> <Plug>GitGutterStageHunk :call gitgutter#utility#warn('please change your map <Plug>GitGutterStageHunk to <Plug>(GitGutterStageHunk)')
nnoremap <silent> <Plug>(GitGutterStageHunk) :GitGutterStageHunk
xnoremap <silent> <Plug>GitGutterStageHunk :call gitgutter#utility#warn('please change your map <Plug>GitGutterStageHunk to <Plug>(GitGutterStageHunk)')
xnoremap <silent> <Plug>(GitGutterStageHunk) :GitGutterStageHunk
nnoremap <silent> <expr> <Plug>GitGutterPrevHunk &diff ? '[c' : ":\call gitgutter#utility#warn('please change your map \<Plug>GitGutterPrevHunk to \<Plug>(GitGutterPrevHunk)')\"
nnoremap <silent> <expr> <Plug>(GitGutterPrevHunk) &diff ? '[c' : ":\execute v:count1 . 'GitGutterPrevHunk'\"
nnoremap <silent> <expr> <Plug>GitGutterNextHunk &diff ? ']c' : ":\call gitgutter#utility#warn('please change your map \<Plug>GitGutterNextHunk to \<Plug>(GitGutterNextHunk)')\"
nnoremap <silent> <expr> <Plug>(GitGutterNextHunk) &diff ? ']c' : ":\execute v:count1 . 'GitGutterNextHunk'\"
xnoremap <silent> <Plug>(GitGutterTextObjectOuterVisual) :call gitgutter#hunk#text_object(0)
xnoremap <silent> <Plug>(GitGutterTextObjectInnerVisual) :call gitgutter#hunk#text_object(1)
onoremap <silent> <Plug>(GitGutterTextObjectOuterPending) :call gitgutter#hunk#text_object(0)
onoremap <silent> <Plug>(GitGutterTextObjectInnerPending) :call gitgutter#hunk#text_object(1)
xnoremap <silent> <Plug>(expand_region_shrink) :call expand_region#next('v', '-')
xnoremap <silent> <Plug>(expand_region_expand) :call expand_region#next('v', '+')
nnoremap <silent> <Plug>(expand_region_expand) :call expand_region#next('n', '+')
nmap <silent> <Plug>CommentaryUndo :echoerr "Change your <Plug>CommentaryUndo map to <Plug>Commentary<Plug>Commentary"
nnoremap <C-W><C-F> :call GotoFile("new")
nnoremap <C-W>f :call GotoFile("new")
map <C-F> <Plug>(ctrlp)
nnoremap <silent> <Plug>(ctrlp) :CtrlP
nnoremap <silent> <Plug>(ale_go_to_type_definition_in_vsplit) :ALEGoToTypeDefinitionInVSplit
nnoremap <silent> <Plug>(ale_go_to_type_definition_in_split) :ALEGoToTypeDefinitionInSplit
nnoremap <silent> <Plug>(ale_go_to_type_definition_in_tab) :ALEGoToTypeDefinitionInTab
nnoremap <silent> <Plug>(ale_go_to_definition_in_vsplit) :ALEGoToDefinitionInVSplit
nnoremap <silent> <Plug>(ale_go_to_definition_in_split) :ALEGoToDefinitionInSplit
nnoremap <silent> <Plug>(ale_go_to_definition_in_tab) :ALEGoToDefinitionInTab
nnoremap <silent> <Plug>(ale_repeat_selection) :ALERepeatSelection
nnoremap <silent> <Plug>(ale_rename) :ALERename
nnoremap <silent> <Plug>(ale_documentation) :ALEDocumentation
nnoremap <silent> <Plug>(ale_hover) :ALEHover
nnoremap <silent> <Plug>(ale_find_references) :ALEFindReferences
nnoremap <silent> <Plug>(ale_go_to_type_definition) :ALEGoToTypeDefinition
nnoremap <silent> <Plug>(ale_go_to_definition) :ALEGoToDefinition
nnoremap <silent> <Plug>(ale_fix) :ALEFix
nnoremap <silent> <Plug>(ale_detail) :ALEDetail
nnoremap <silent> <Plug>(ale_lint) :ALELint
nnoremap <silent> <Plug>(ale_reset_buffer) :ALEResetBuffer
nnoremap <silent> <Plug>(ale_disable_buffer) :ALEDisableBuffer
nnoremap <silent> <Plug>(ale_enable_buffer) :ALEEnableBuffer
nnoremap <silent> <Plug>(ale_toggle_buffer) :ALEToggleBuffer
nnoremap <silent> <Plug>(ale_reset) :ALEReset
nnoremap <silent> <Plug>(ale_disable) :ALEDisable
nnoremap <silent> <Plug>(ale_enable) :ALEEnable
nnoremap <silent> <Plug>(ale_toggle) :ALEToggle
nnoremap <silent> <Plug>(ale_last) :ALELast
nnoremap <silent> <Plug>(ale_first) :ALEFirst
nnoremap <silent> <Plug>(ale_next_wrap_warning) :ALENext -wrap -warning
nnoremap <silent> <Plug>(ale_next_warning) :ALENext -warning
nnoremap <silent> <Plug>(ale_next_wrap_error) :ALENext -wrap -error
nnoremap <silent> <Plug>(ale_next_error) :ALENext -error
nnoremap <silent> <Plug>(ale_next_wrap) :ALENextWrap
nnoremap <silent> <Plug>(ale_next) :ALENext
nnoremap <silent> <Plug>(ale_previous_wrap_warning) :ALEPrevious -wrap -warning
nnoremap <silent> <Plug>(ale_previous_warning) :ALEPrevious -warning
nnoremap <silent> <Plug>(ale_previous_wrap_error) :ALEPrevious -wrap -error
nnoremap <silent> <Plug>(ale_previous_error) :ALEPrevious -error
nnoremap <silent> <Plug>(ale_previous_wrap) :ALEPreviousWrap
nnoremap <silent> <Plug>(ale_previous) :ALEPrevious
snoremap <C-J> i<Right>=snipMate#TriggerSnippet()
nmap <C-N> <Plug>yankstack_substitute_newer_paste
nmap <C-P> <Plug>yankstack_substitute_older_paste
vmap <M-k> :m'<-2`>my`<mzgv`yo`z
vmap <M-j> :m'>+`<my`>mzgv`yo`z
nmap <M-k> mz:m-2`z
nmap <M-j> mz:m+`z
map <C-L> l
map <C-H> h
map <C-K> k
nmap <C-J> j
xmap <C-J> j
omap <C-J> j
map <C-Space> ?
cnoremap  <Home>
cnoremap  <End>
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap <NL> =snipMate#TriggerSnippet()
cnoremap  
cnoremap  <Down>
cnoremap  <Up>
imap 	 <Plug>snipMateShow
imap  <Plug>Isurround
inoremap $e ""i
inoremap $q ''i
inoremap $4 {o}O
inoremap $3 {}i
inoremap $2 []i
inoremap $1 ()i
cnoremap $q eDeleteTillSlash()
cnoremap $c e eCurrentFileDir("e")
cnoremap $j e ./
cnoremap $d e ~/Desktop/
cnoremap $h e ~/
map! <silent> ,p <Plug>PeepOpen
map ½ $
xmap Ð <Plug>yankstack_substitute_newer_paste
nmap Ð <Plug>yankstack_substitute_newer_paste
xmap ð <Plug>yankstack_substitute_older_paste
nmap ð <Plug>yankstack_substitute_older_paste
xnoremap <silent> ó :call multiple_cursors#select_all("v", 0)
nnoremap <silent> ó :call multiple_cursors#select_all("n", 1)
vmap ë :m'<-2`>my`<mzgv`yo`z
vmap ê :m'>+`<my`>mzgv`yo`z
nmap ë mz:m-2`z
nmap ê mz:m+`z
iabbr xdate =strftime("%d/%m/%y %H:%M:%S")
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set autoread
set autowriteall
set background=dark
set backspace=eol,start,indent
set backupdir=~/.cache/vim/backup//
set directory=~/.cache/vim/swap//
set fileencodings=ucs-bom,utf-8,default,latin1
set fileformats=unix,dos,mac
set grepprg=/bin/grep\ -nH
set helplang=en
set hidden
set history=500
set hlsearch
set ignorecase
set incsearch
set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~,=,:
set langmenu=en
set laststatus=2
set lazyredraw
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
set matchtime=2
set ruler
set runtimepath=~/.vim_runtime/sources_non_forked/ack.vim,~/.vim_runtime/sources_non_forked/ale,~/.vim_runtime/sources_non_forked/auto-pairs,~/.vim_runtime/sources_non_forked/bufexplorer,~/.vim_runtime/sources_non_forked/ctrlp.vim,~/.vim_runtime/sources_non_forked/gist-vim,~/.vim_runtime/sources_non_forked/goyo.vim,~/.vim_runtime/sources_non_forked/gruvbox,~/.vim_runtime/sources_non_forked/lightline-ale,~/.vim_runtime/sources_non_forked/lightline.vim,~/.vim_runtime/sources_non_forked/mayansmoke,~/.vim_runtime/sources_non_forked/nerdtree,~/.vim_runtime/sources_non_forked/nginx.vim,~/.vim_runtime/sources_non_forked/open_file_under_cursor.vim,~/.vim_runtime/sources_non_forked/rust.vim,~/.vim_runtime/sources_non_forked/tabular,~/.vim_runtime/sources_non_forked/tlib,~/.vim_runtime/sources_non_forked/typescript-vim,~/.vim_runtime/sources_non_forked/vim-abolish,~/.vim_runtime/sources_non_forked/vim-addon-mw-utils,~/.vim_runtime/sources_non_forked/vim-bundle-mako,~/.vim_runtime/sources_non_forked/vim-coffee-script,~/.vim_runtime/sources_non_forked/vim-colors-solarized,~/.vim_runtime/sources_non_forked/vim-commentary,~/.vim_runtime/sources_non_forked/vim-expand-region,~/.vim_runtime/sources_non_forked/vim-flake8,~/.vim_runtime/sources_non_forked/vim-fugitive,~/.vim_runtime/sources_non_forked/vim-gist,~/.vim_runtime/sources_non_forked/vim-gitgutter,~/.vim_runtime/sources_non_forked/vim-indent-object,~/.vim_runtime/sources_non_forked/vim-javascript,~/.vim_runtime/sources_non_forked/vim-lastplace,~/.vim_runtime/sources_non_forked/vim-less,~/.vim_runtime/sources_non_forked/vim-markdown,~/.vim_runtime/sources_non_forked/vim-multiple-cursors,~/.vim_runtime/sources_non_forked/vim-pug,~/.vim_runtime/sources_non_forked/vim-pyte,~/.vim_runtime/sources_non_forked/vim-python-pep8-indent,~/.vim_runtime/sources_non_forked/vim-repeat,~/.vim_runtime/sources_non_forked/vim-ruby,~/.vim_runtime/sources_non_forked/vim-snipmate,~/.vim_runtime/sources_non_forked/vim-snippets,~/.vim_runtime/sources_non_forked/vim-surround,~/.vim_runtime/sources_non_forked/vim-yankstack,~/.vim_runtime/sources_non_forked/vim-zenroom2,~/.vim_runtime/sources_forked/peaksea,~/.vim_runtime/sources_forked/set_tabline,~/.vim_runtime/sources_forked/vim-irblack-forked,~/.vim_runtime/sources_forked/vim-peepopen,~/.vim,~/.vim/plugged/coc.nvim,~/.vim/plugged/vim-startify,~/.vim/plugged/vim-rainbow,~/.vim/plugged/vim-workspace,~/.vim/plugged/winteract.vim,~/.vim/plugged/conoline.vim,~/.vim/plugged/tokyonight-vim,/usr/share/vim/vimfiles,/usr/share/vim/vim82,/usr/share/vim/vimfiles/after,~/.vim/after,~/.vim_runtime,~/.vim_runtime/sources_non_forked/vim-snipmate/after,~/.vim_runtime/sources_non_forked/vim-markdown/after,~/.vim_runtime/sources_non_forked/vim-less/after,~/.vim_runtime/sources_non_forked/vim-javascript/after,~/.vim_runtime/sources_non_forked/vim-coffee-script/after,~/.vim_runtime/sources_non_forked/tabular/after,~/.vim_runtime/sources_non_forked/rust.vim/after
set scrolloff=7
set shiftwidth=4
set shortmess=filnxtToOSI
set showmatch
set showtabline=2
set smartcase
set smartindent
set smarttab
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
set suffixes=.bak,~,.o,.info,.swp,.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc
set noswapfile
set swapsync=
set switchbuf=useopen,usetab,newtab
set tabline=%!lightline#tabline()
set tabstop=4
set textwidth=500
set timeoutlen=500
set undodir=.undodir
set undofile
set updatetime=1000
set whichwrap=b,s,<,>,h,l
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildmenu
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Desktop/ft_ping
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd .
edit README.md
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
nmap <buffer> ,hp <Plug>(GitGutterPreviewHunk)
nmap <buffer> ,hu <Plug>(GitGutterUndoHunk)
nmap <buffer> ,hs <Plug>(GitGutterStageHunk)
xmap <buffer> ,hs <Plug>(GitGutterStageHunk)
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> î :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
nmap <buffer> [c <Plug>(GitGutterPrevHunk)
vmap <buffer> [] <Plug>Markdown_MoveToPreviousSiblingHeader
nmap <buffer> [] <Plug>Markdown_MoveToPreviousSiblingHeader
vmap <buffer> [[ <Plug>Markdown_MoveToPreviousHeader
nmap <buffer> [[ <Plug>Markdown_MoveToPreviousHeader
vmap <buffer> ]c <Plug>Markdown_MoveToCurHeader
nmap <buffer> ]c <Plug>Markdown_MoveToCurHeader
vmap <buffer> ]u <Plug>Markdown_MoveToParentHeader
nmap <buffer> ]u <Plug>Markdown_MoveToParentHeader
vmap <buffer> ][ <Plug>Markdown_MoveToNextSiblingHeader
nmap <buffer> ][ <Plug>Markdown_MoveToNextSiblingHeader
vmap <buffer> ]] <Plug>Markdown_MoveToNextHeader
nmap <buffer> ]] <Plug>Markdown_MoveToNextHeader
xmap <buffer> ac <Plug>(GitGutterTextObjectOuterVisual)
omap <buffer> ac <Plug>(GitGutterTextObjectOuterPending)
vmap <buffer> ge <Plug>Markdown_EditUrlUnderCursor
nmap <buffer> ge <Plug>Markdown_EditUrlUnderCursor
vmap <buffer> gx <Plug>Markdown_OpenUrlUnderCursor
nmap <buffer> gx <Plug>Markdown_OpenUrlUnderCursor
xmap <buffer> ic <Plug>(GitGutterTextObjectInnerVisual)
omap <buffer> ic <Plug>(GitGutterTextObjectInnerPending)
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=b:>,b:*,b:+,b:-
setlocal commentstring=<!--%s-->
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal cursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'markdown'
setlocal filetype=markdown
endif
setlocal fixendofline
set foldcolumn=1
setlocal foldcolumn=1
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tqlnr
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\|^[-*+]\\s\\+\\|^\\[^\\ze[^\\]]\\+\\]:
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetMarkdownIndent()
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,$
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal list
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
set numberwidth=1
setlocal numberwidth=1
setlocal omnifunc=htmlcomplete#CompleteTags
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
set signcolumn=number
setlocal signcolumn=number
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
setlocal statusline=%{lightline#link()}%#LightlineLeft_active_0#%(\ %{lightline#mode()}\ %)%{(&paste)?\"\ \":\"\"}%(\ %{&paste?\"PASTE\":\"\"}\ %)%#LightlineLeft_active_0_1#\ %#LightlineLeft_active_1#%(\ %{exists(\"*FugitiveHead\")?FugitiveHead():\"\"}\ %)%{((exists(\"*FugitiveHead\")\ &&\ \"\"!=FugitiveHead()))&&(((&filetype!=\"help\"&&\ &readonly))||1||((&filetype!=\"help\"&&(&modified||!&modifiable))))?\"\ \":\"\"}%(\ %{&filetype==\"help\"?\"\":&readonly?\"🔒\":\"\"}\ %)%{((&filetype!=\"help\"&&\ &readonly))&&(1||((&filetype!=\"help\"&&(&modified||!&modifiable))))?\"\ \":\"\"}%(\ %t\ %)%{((&filetype!=\"help\"&&(&modified||!&modifiable)))?\"\ \":\"\"}%(\ %{&filetype==\"help\"?\"\":&modified?\"+\":&modifiable?\"\":\"-\"}\ %)%#LightlineLeft_active_1_2#\ %#LightlineMiddle_active#%=%#LightlineRight_active_1_2#\ %#LightlineRight_active_1#%(\ %3p%%\ %)%#LightlineRight_active_0_1#\ %#LightlineRight_active_0#%(\ %3l:%-2v\ %)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'markdown'
setlocal syntax=markdown
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=500
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 27 - ((12 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
27
normal! 05|
tabnext 1
badd +0 README.md
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOSI
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
