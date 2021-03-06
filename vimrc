if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/powerline'
Plugin 'sjl/gundo.vim'
Plugin 'altercation/solarized'
Plugin 'jnwhiteh/vim-golang'
Plugin 'tfnico/vim-gradle'
Plugin 'ShowTrailingWhitespace'
Plugin 'elzr/vim-json'

call vundle#end()

set bs=indent,eol,start	" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set confirm             " confirm before quiting unsaved changes
set mouse=c             " Enable mouse pointer
set number              " Set the number to left
set shiftwidth=4        " indentation for using 4 spaces instead of tabs
set softtabstop=4
set textwidth=80
set expandtab
set wildmenu
set autoread
set smartcase
set wildmode=list:longest
set wildignore=*.o,*~,*.pyc
syntax on
set hlsearch
highlight Normal ctermfg=grey ctermbg=black

" Define Leaderkey and remap key
let mapleader = ","

"Bind nohl
"Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

"Quick Saving
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C> :update<CR>
inoremap <C-Z> <C-O> :update<CR>

"bind Ctrl movement around windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Easier to move between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>n <esc>:tabnext<CR>

" map sort function to key
vnoremap <Leader>s :sort<CR>

"Easier move block of code
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

nnoremap <F7> :GundoToggle<CR>
nnoremap <F6> :NERDTreeToggle<CR>

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup fedora
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif


filetype plugin indent on


" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" python remove trailing whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
" python highlighting extras
let python_highlight_all = 1
