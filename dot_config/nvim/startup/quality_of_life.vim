" ways to copy the filepath to general clipboard
nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>

" ------- NerdCommenter -------
let NERDSpaceDelims=1
