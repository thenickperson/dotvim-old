" Disable stupid annoying visual bell with gvim
autocmd VimEnter * set vb t_vb=

" Set default window size
set lines=45 columns=140

" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=

" Don't beep
set visualbell

" Start without the toolbar
set guioptions-=T

" If we go fullscreen, use all the room.
" set fuopt=maxvert,maxhorz

" Stupid blinking cursor.
set gcr=n:blinkon0

" Disable the right and left scroll bar.
set guioptions-=r
set guioptions-=L
