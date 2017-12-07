set ruler
set number
set nowrap
set showmode
set cindent
set nobackup
set tabstop=2
set noswapfile
set cursorline
set nofoldenable
set shiftwidth=2
set encoding=utf-8
set incsearch
set laststatus=2
set hlsearch
set ic
set hls
set is

execute pathogen#infect()
syntax enable
syntax on
filetype plugin indent on

let g:alduin_Shout_Dragon_Aspect = 1
"let g:alduin_Shout_Become_Ethereal = 1
"let g:alduin_Contract_Vampirism = 1
"let g:alduin_Shout_Fire_Breath = 1
let g:molokai_original = 1
let g:rehash256 = 1
let g:deepspace_italics=1
let g:airline_theme='deep_space'

if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:one_allow_italics = 1 " I love italic for comments
let g:airline_theme='one'
set background=dark
colorscheme monokai

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimshell', { 'rev': '3787e5' }
Plug 'godlygeek/tabular'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "command-line fuzzy finder
"Plug 'junegunn/fzf.vim' 

" Tree Dir
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeShowIgnoredStatus = 1
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Auto complete
Plug 'Raimondi/delimitMate' "provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Chiel92/vim-autoformat'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'groenewege/vim-less'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/neossh.vim'
Plug 'MattesGroeger/vim-bookmarks'

nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

let g:vimfiler_as_default_explorer = 1

" Syntax highlight Check
Plug 'sheerun/vim-polyglot'
"Plug 'w0rp/ale'                   "Asynchronous Lint Engine
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go', { 'on_ft' : 'go', 'loadconf_before' : 1}
Plug 'vim-ruby/vim-ruby'
Plug 'udalov/kotlin-vim'

" Enable completion where available.
"let g:ale_completion_enabled = 1
" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
"packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.

" let g:ale_fixers = {
" \	'javascript': ['eslint'],
" \	'css': ['stylelint'],
" \}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
" let g:ale_fix_on_save = 1
" let g:neomake_kotlin_enabled_makers = ['kotlinc']
" Set this. Airline will handle the rest.
" let g:airline#extensions#ale#enabled = 1
" let g:ale_linters = {
" \	'javascript': ['eslint'],
" \	'css': ['stylelint'],
" \}
" let g:ale_fix_on_save = 1
" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '●'
" let g:ale_sign_warning = '▶'

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'StanAngeloff/php.vim'
Plug '2072/PHP-Indenting-for-VIm', { 'on_ft' : 'php'}
" Plug 'shawncplus/phpcomplete.vim'
Plug 'rafi/vim-phpspec', { 'on_ft' : 'php'}
Plug 'lvht/phpfold.vim', { 'on_ft' : 'php', 'build' : ['composer', 'install']}

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_complete_for_unknown_classes = 1
let g:phpcomplete_search_tags_for_variables = 1
let g:phpcomplete_min_num_of_chars_for_namespace_completion = 1
let g:phpcomplete_parse_docblock_comments = 1
let g:phpcomplete_enhance_jump_to_definition = 1

Plug 'elzr/vim-json',{ 'on_ft' : ['javascript','json']}
"let g:vim_json_syntax_conceal = 0

" File Code Search
Plug 'mileszs/ack.vim'      "search tool
Plug 'ctrlpvim/ctrlp.vim'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"cnoreabbrev Ack Ack!
"nnoremap <Leader>a :Ack!<Space>

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/](node_modules|DS_Store|dist|build|coverage)|(\.(git|hg|svn)$)',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }

" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='papercolor'

" Code annotaion
Plug 'scrooloose/nerdcommenter' "annotation

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
			\ 'javascript': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
			\ 'less': { 'left': '/*', 'right': '*/' }
		\ }

let g:NERDAltDelims_javascript = 1
let g:NERDDefaultNesting = 0

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'

let g:gitgutter_max_signs = 500  " default value
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'slashmili/alchemist.vim', {'on_ft' : 'elixir'}
Plug 'Vimjas/vim-python-pep8-indent',{ 'on_ft' : 'python'}
Plug 'leafgarland/typescript-vim'
Plug 'mhartington/nvim-typescript'
Plug 'sukima/xmledit',{ 'on_ft' : ['html' , 'xhtml' , 'xml' , 'jinja']}
Plug 'Valloric/MatchTagAlways',{ 'on_ft' : ['html' , 'xhtml' , 'xml' , 'jinja']}
Plug 'vim-jp/vim-java',{ 'on_ft' : 'java'}
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'

let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
 		\ 'javascript.jsx' : {
    		\ 'extends' : 'jsx',
    	\ },
 		\ }

autocmd FileType typescript setlocal omnifunc=tsuquyomi#complete

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

" JavaScript
Plug 'pangloss/vim-javascript', { 'on_ft' : ['javascript']}
Plug 'othree/javascript-libraries-syntax.vim', { 'on_ft' : ['javascript','coffee','ls','typescript']}
Plug 'mmalecki/vim-node.js',                   { 'on_ft' : ['javascript']}
Plug 'othree/yajs.vim',                        { 'on_ft' : ['javascript']}
Plug 'othree/es.next.syntax.vim',              { 'on_ft' : ['javascript']}

let s:auto_fix = 0
let g:neomake_javascript_enabled_makers = ['eslint']
" Use the fix option of eslint
let g:neomake_javascript_eslint_args = ['-f', 'compact', '--fix']

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
set foldmethod=syntax
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1

" React
Plug 'mxw/vim-jsx'

let g:jsx_ext_required = 0

" Neosnippet Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"Configure
"highlight Lf_hl_match gui=bold guifg=Blue cterm=bold ctermfg=21
"highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=201

call plug#end()
