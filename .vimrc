"my conf
syntax on
syntax enable
filetype plugin on
colorscheme solarized



"CUSTOM MAP
noremap   <F3> :set invnumber<CR>
inoremap  <F3> <C-O>:set invnumber<CR>                " switch number line
noremap   <F4> :set invrelativenumber<CR>
inoremap  <F4> <C-O>:set invrelativenumber<CR>        " switch relative number line
map       <F5> :set invfu<CR>                         " switch fullscreen
nnoremap  <C-Tab> <C-w>w                              " switch windows
nnoremap  <C-S-Tab> <C-w>W
nnoremap  <C-Up> :tabnext<CR>                         " switch tabs
nnoremap  <C-Down> :tabprevious<CR>
nmap      <C-p> :NERDTreeToggle<CR>


"CUSTOM CONFIG
set background=dark
set nocompatible
set mouse=a
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set number
set numberwidth=5
set cpoptions+=n
set clipboard=unnamed
set splitbelow
set splitright
set spellfile=$HOME/.vim-spell-en.utf-8.add         " switch tabs
set guifont=Hack:h13                                " gui gvim settings
set guioptions=                                     " gui gvim settings


autocmd BufRead,BufNewFile *.md set filetype=Markdown
autocmd Filetype tex setl updatetime=1

let g:livepreview_previewer = 'open -a Preview'
let vim_markdown_preview_github=1
let g:vimwiki_list = [{'path': '~/Google Drive/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

"VIM PLUG
call plug#begin('~/.vim/plugged')

"my standard plugins
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/tpope/vim-haml.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'altercation/vim-colors-solarized'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'terryma/vim-multiple-cursors'

"vim for writers
Plug 'https://github.com/junegunn/goyo.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'reedes/vim-pencil'
Plug 'https://github.com/junegunn/limelight.vim'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'jonhiggs/MacDict.vim'
Plug 'junegunn/vim-easy-align'
Plug 'VVVFO/markdown-shortcuts.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
call plug#end()


"FUNCTIONS

"trimspace
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

if has("gui_running")
  set transparency=2
endif

"Writing mode
function! s:goyo_enter()
  if has('gui_running')
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif

  set noshowmode
  set noshowcmd
  set guifont=Hack:h14
  Limelight
  TogglePencil
  " ...
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif

  set showmode
  set showcmd
  set guifont=Hack:h13
  Limelight!
  TogglePencil
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()




"IMPORTED FUNCTIONS

" Toggle Background


function! BgToggleSol()
    if (&background == "light")
      set background=dark
    else
       set background=light
    endif
endfunction

nnoremap <silent> <leader>sz :call BgToggleSol()<cr>




