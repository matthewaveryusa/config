nnoremap <S-Insert> "*p
inoremap jj <Esc>`^
nnoremap <Esc> <nop>
inoremap <Esc> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

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
