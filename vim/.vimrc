
" Neko Vim configuration https://github.com/catlinman/neko-config/vim/

" Required settings.
set nocompatible
filetype off

" ######  GENERAL VUNDLE INFORMATION  ######
"
" Install Vundle before doing anything else.
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" Once you have installed Vundle you can run the following command.
" vim +PluginInstall +qall
"
" Alternatively you can run the following command inside of vim.
" :PluginInstall
"
" ##########################################

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Begin the Vundle plugin preparation.
call vundle#begin()

" Alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required.
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" Autoswap sessions on detection of leftover swp file.
Plugin 'gioele/vim-autoswap'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Airline requires the powerline fonts to be installed and activated.
" Ignore this if we are running on just the linux kernal terminal.
if $TERM != "linux"
    Plugin 'Lokaltog/powerline-fonts'
endif

" Color scheme
Plugin 'chriskempson/base16-vim'

" Navigation and highlighting (Implements 'TagbarToggle')
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ap/vim-css-color'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'majutsushi/tagbar'

" Colorizer color highlighting (Implements 'ColorHighlight')
Plugin 'chrisbra/Colorizer'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Formatting & Linting (Implements 'ALEToggle')
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'Chiel92/vim-autoformat'
Plugin 'w0rp/ale'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Languages
Plugin 'rust-lang/rust.vim'
Plugin 'tmux-plugins/vim-tmux'

" Python dependent plugins (Implements 'MinimapToggle')
if has("python") || has("python3")
    Plugin 'severin-lemaignan/vim-minimap'
    Plugin 'Valloric/MatchTagAlways'
endif

" All of your Plugins must be added before the following line.
call vundle#end()

" Required setting.
filetype plugin indent on

" To ignore plugin indent changes, instead use: filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Set the Base16 color scheme. Make sure that Base16 Shell is installed.
syntax on
set t_Co=256
let base16colorspace=256

" Load the default color scheme so some plugins don't break.
colorscheme default

if $TERM != 'linux'
    colorscheme base16-neko

endif

" Set the correct background.
set background=dark

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

inoremap jk <ESC>
inoremap kj <ESC>

" Use soft tabs with width of 4 spaces.
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set softtabstop=4
set ts=4 sw=4

" Change backspace behavior.
set backspace=indent,eol,start

" Enable highlighted searching. Press space to disable highlighting.
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Set the timeout length of entering normal mode.
set ttimeoutlen=50
    
" Set encoding options.
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

" Line numbers.
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Set a key for toggling line numbers on and off.
nnoremap <silent> <F2> :set number!<CR>

" Set a key for toggling relative line numbers.
nnoremap <silent> <F3> :set relativenumber!<CR>
hi CursorLineNr cterm=NONE ctermbg=NONE ctermfg=yellow

" Enable cursor line highlighting by default.
set cursorline

" Set a key for toggling easier navigation highlighting.
nnoremap <silent> <F4> :set cursorline!<CR>
nnoremap <silent> <F5> :set cursorcolumn!<CR>

" Coloring for cursor lines.
hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE
hi CursorColumn cterm=NONE ctermbg=234 ctermfg=NONE

" Enable keeping the last status open.
set laststatus=2

filetype indent plugin on

let g:mta_filetypes={
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'php' : 1,
    \}

highlight Pmenu ctermfg=blue ctermbg=black

" Colorizer configuration.
let g:colorizer_auto_filetype='css,html,less,scss,sass,txt,md,vue,j2'
let g:colorizer_skip_comments=1

" gVim configuration.
if has('gui_running')
    map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>y

    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar

    if has('gui_win32')
        set guifont=Inconsolata_for_Powerline:h9:cANSI

    else
        set guifont=Inconsolata\ for\ Powerline\ 9

    endif

endif

" Airline configuration.
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

if $TERM == 'linux'
    let g:airline_left_sep='|'
    let g:airline_left_alt_sep='|'
    let g:airline_right_sep='|'
    let g:airline_right_alt_sep='|'
    let g:airline_theme='luna'

else
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#enabled=1
    let g:airline_theme='wombat'

endif

" Indent guide configuration.
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=1
let g:indent_guides_color_change_percent=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2

" Indent guide colors.
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=black

" Snippet configuration.
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

