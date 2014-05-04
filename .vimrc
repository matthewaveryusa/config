nnoremap <S-Insert> "*p
inoremap jj <Esc>`^
nnoremap <Esc> <nop>
inoremap <Esc> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
set foldmethod=syntax

syntax enable

set guifont=monospace\ 10
set et
set ai
set cin
set ru
set bs=2
set sw=2  "this is the level of autoindent, adjust to taste
set expandtab
set tabstop=2
set shm=A
set nu
set shell=/bin/bash
set ignorecase
colorscheme candycode
let g:load_doxygen_syntax=1
set noswapfile
set nobackup

" NERDTree
nmap \dir :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['\.o', '\.so','\.tsk']
let NERDTreeShowHidden=1
set updatetime=500

" taglist 
nmap \tag :TlistToggle<CR>

"ctrlp
let g:ctrlp_extensions = ['tag']

" easymotion
let g:EasyMotion_do_mapping = 0
nmap \s <Plug>(easymotion-s2)
nmap \h <Plug>(easymotion-linebackward)
nmap \l <Plug>(easymotion-lineforward)
nmap \k <Plug>(easymotion-k)
nmap \j <Plug>(easymotion-j)

let Tlist_Ctags_Cmd = "/usr/bin/ctags"

set history=3000		" keep 50 lines of command line history
set number		" show line numbers
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set autoindent
set wildmenu
set wildmode=longest,full
filetype plugin on

"scroll options for lines of context

function! Fstswc()
  :ls
  call inputsave()
  let selected = input('Enter buffer: ')
  call inputrestore()
  :execute "buffer " . selected
endfunction

set showtabline=2 " always show tabs in gvim, but not vim
" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  return label
endfunction
set guitablabel=%{GuiTabLabel()}
source ~/.vim/vundle_config.vim
