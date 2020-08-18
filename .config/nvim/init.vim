"         (       *     (
"         )\ )  (  `    )\ )   (
" (   (  (()/(  )\))(  (()/(   )\
" )\  )\  /(_))((_)()\  /(_))(((_)
"((_)((_)(_))  (_()((_)(_))  )\___
"\ \ / / |_ _| |  \/  || _ \((/ __|
" \ V /   | |  | |\/| ||   / | (__
"  \_/   |___| |_|  |_||_|_\  \___|
"
" "zo" to open folds, "zc" to close, "zn" to disable.

" {{{ Plugins and its Settings

" {{{ PLUG SETUP

" If not yet installed install vim plugin manager plug
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" }}}

" <PLUGINS>

" {{{ gruvbox
"     =======

Plug 'sainnhe/gruvbox-material'

" OPTIONS:

if has('termguicolors')
  set termguicolors
endif

" For dark version.
set background=dark

" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_transparent_background = 1
let g:airline_theme = 'gruvbox_material'
" }}}

" {{{ ale
"     ===
Plug 'dense-analysis/ale'

" }}}

" {{{ vim-airline
"     ===========

Plug 'vim-airline/vim-airline'

"OPTIONS:

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tab_count = 1

" Gotta be quick about changing buffers"
let g:airline#extensions#tabline#buffer_idx_mode = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ":t"

" enable/disable ale integration
let g:airline#extensions#ale#enabled = 1

" ale error_symbol
let airline#extensions#ale#error_symbol = 'E:'

" ale warning
let airline#extensions#ale#warning_symbol = 'W:'

"ale show_line_numbers
let airline#extensions#ale#show_line_numbers = 1

" ale open_lnum_symbol
let airline#extensions#ale#open_lnum_symbol = '(L'

"ale close_lnum_symbol
let airline#extensions#ale#close_lnum_symbol = ')'

" Giting it done
let g:airline#extensions#branch#empty_message = 'nihil'

" }}}

" {{{ ack.vim
"     =======

Plug 'mileszs/ack.vim'

" }}}

" {{{ vim-tmux
"     ========

Plug 'tmux-plugins/vim-tmux'

" }}}

" {{{ vim-tmux-navigator
"     ==================

Plug 'christoomey/vim-tmux-navigator'

" }}}

" {{{ His Home-Row-ness the Pope of Tim
"     =================================

" vim-surround: s is a text-object for delimiters; ss linewise
" ys to add surround
Plug 'tpope/vim-surround'

" vim-commentary: gc is an operator to toggle comments; gcc linewise
Plug 'tpope/vim-commentary'

" vim-repeat: make vim-commentary and vim-surround work with .
Plug 'tpope/vim-repeat'

" vim-markdown: some stuff for fenced language highlighting
Plug 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'yaml', 'haml', 'bash=sh']

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'

" }}}

" {{{ NERDTree
"     ========

Plug 'scrooloose/nerdtree'

" OPTIONS:

" Get rid of objects in C projects
let NERDTreeIgnore=['\~$', '.o$', 'bower_components', 'node_modules', '__pycache__']
let NERDTreeWinSize=20

" }}}

" {{{ netrw: Configuration
"     ====================

let g:netrw_banner=0        " disable banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
" hide gitignore'd files
let g:netrw_list_hide=netrw_gitignore#Hide()
" hide dotfiles by default (this is the string toggled by netrw-gh)
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" }}}

" </PLUGINS>

" {{{ PLUG TEARDOWN

call plug#end()
filetype plugin indent on

" }}}

" }}}

" {{{ Basic Settings

" Modelines
set modelines=2

" For clever completion with the :find command
set path+=**

" Always use bash syntax for sh filetype
let g:is_bash=1

" Search
set ignorecase smartcase
set grepprg=grep\ -IrsnH

" Window display
set showcmd ruler laststatus=2

" Splits
set splitright splitbelow

" Buffers
set history=500
set hidden

" Spelling
set spelllang=en_us

" Typing behavior
set backspace=2
set showmatch
set wildmode=full
set wildmenu
set complete-=i

" Formatting
set tabstop=2 shiftwidth=2 softtabstop=2

" Status line
set statusline=%!MyStatusLine()

" Session saving
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,localoptions

" Word splitting
set iskeyword+=-

" Space at top/bottom before scrolling page
set scrolloff=3

" Wraps long lines to the next line (does not create a new line)
set wrap

set whichwrap=b,s,<,>

" Enables mouse interaction -- usefull for resizing panes with a mouse
set mouse=a

" Displays line number and relative line numbers
set number relativenumber

set expandtab smarttab

set autoindent

set autoread

" ALWAYS use the clipboard for ALL operations
set clipboard=unnamedplus

set encoding=utf-8

set formatoptions=tcqrn1

set lazyredraw

set noerrorbells visualbell t_vb=

set noshiftround

set nostartofline

set textwidth=0

colorscheme gruvbox-material

" }}}

" {{{ Autocommands

" Make the modification indicator [+] white on red background
au ColorScheme * hi User1 gui=bold term=bold cterm=bold guifg=white guibg=red ctermfg=white ctermbg=red

" Tweak the color of the fold display column
au ColorScheme * hi FoldColumn cterm=bold ctermbg=233 ctermfg=146

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and vifm configs with new material:
autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" }}}

" {{{ Syntax Hilighting

" This has to happen AFTER autocommands are defined, because I run au! when,
" defining them, and syntax hilighting is done with autocommands.

" Syntax hilighting
syntax enable

" }}}

" Backups & .vimrc Editing {{{
let backup_path = expand('~/.local/data/nvim/backup')

if !isdirectory(backup_path)
	call system('mkdir -p ' . backup_path)
endi


let &backupdir= backup_path

set backup
set writebackup

" overwrite the original backup file
set backupcopy=yes

" Meaningful backup file name, ex: filename@2020-04-30
au BufWritePre * let &bex = '@' . strftime("%F")

let swap_path = expand('~/.local/data/nvim/swap')
if !isdirectory(swap_path)
	call system('mkdir -p ' . swap_path)
endif

let &directory= swap_path

set swapfile

" guard for distributions lacking the 'persistent_undo' feature.
if has('persistent_undo')

	let undo_path = expand('~/.local/data/nvim/undo')

	" create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(undo_path)
        call system('mkdir -p ' . undo_path)
    endif

	" point Vim to the defined undo directory.
    let &undodir = undo_path

	" finally, enable undo persistence.
    set undofile
endif
" }}}

" Key Mappings {{{

let mapleader=" "
let maplocalleader=" "

" Easy header/source swap
nnoremap [f :call SourceHeaderSwap()<CR>

" Sane pasting
command! Paste call SmartPaste()

" Editing vimrc
nnoremap ,v :source $MYVIMRC<CR>
nnoremap ,e :edit $MYVIMRC<CR>

" camelCase => camel_case
vnoremap ,case :s/\v\C(([a-z]+)([A-Z]))/\2_\l\3/g<CR>

" Session mappings
nnoremap ,s :mksession! Session.vim<CR>

" Directory of current file (not pwd)
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" Redo last Ex command with bang
nnoremap ,! q:k0ea!<ESC>

" Insert timestamp
nnoremap <leader>d "=strftime("%-l:%M%p")<CR>P

" Spell-check set to <leader>o, 'o' for 'orthography':
nnoremap <leader>o :setlocal spell! spelllang=en_us<CR>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" Clear search highlights.
map <Leader>cs :let @/=''<CR>

" Open a new empty buffer (replaces :tabnew)
nmap <leader>N :enew<cr>

" Buffer navigation
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" Shortcutting split navigation, saving a keypress:
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Check file in shellcheck:
noremap <leader>s :!clear && shellcheck %<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and vifm configs with new material:
autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Zoom in on a pane
noremap <C-z> <C-w>m

" Autoclose parenthesis and such
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" }}}

" Custom Functions {{{

" MySessionSave() {{{
function! MySessionSave()
    tabdo NERDTreeClose
    mksession! .session.vim
    qall!
endfunction
" }}}

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" MyStatusLine() {{{

function! MyStatusLine()
    let statusline = ""
    let statusline .= "%#Title#"
    " Filename (F -> full, f -> relative)
    let statusline .= "%t "
    let statusline .= "%#StatusLine#"
    let statusline .= "%{StatuslineGit()}"
    " Buffer flags
    let statusline .= "%( %h%1*%m%*%r%w%) "
    let statusline .= "%#StatusLineNC#"
    " File format and type
    let statusline .= "(%{&ff}%(\/%y%))"
    " Left/right separator
    let statusline .= "%="
    " Line & column
    let statusline .= "(%l,%c%V) "
    " Character under cursor (decimal)
    let statusline .= "%03.3b "
    " Character under cursor (hexadecimal)
    let statusline .= "0x%02.2B "
    " File progress
    let statusline .= "| %P/%L"
    return statusline
endfunction

" }}}

" Source/Header Swap {{{
function! SourceHeaderSwap()
    if expand('%:h') == 'content/ui'
        execute ":edit mods/base/ui/".expand('%:t:r').".py"
    elseif expand('%:h') == 'mods/base/ui'
        execute ":edit content/ui/".expand('%:t:r').".html"
    elseif expand('%:e') == 'h'
        if filereadable(expand('%:r').".cpp")
            execute ":edit ".expand('%:r').".cpp"
        else
            execute ":edit ".expand('%:r').".c"
        endif
    else
        edit %<.h
    endif
endfunction
" }}}

" {{{ Sane Pasting

function! SmartPaste()
    setl paste
    normal "+p
    setl nopaste
endfunction

" }}} Sane pasting

" }}} Custom Functions
