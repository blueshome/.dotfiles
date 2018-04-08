set complete+=kspell
set conceallevel=2
set syntax=markdown

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

map <F6> :Goyo<cr>
map <F7> :setlocal spell! spelllang=en_us<CR>
map <F8> "dyiw:call MacDict(@d)<CR>

nmap <leader>h1 <Plug>(MarkdownToggleHeaderH1)
nmap <leader>h2 <Plug>(MarkdownToggleHeaderH2)
nmap <leader>h3 <Plug>(MarkdownToggleHeaderH3)
nmap <leader>h4 <Plug>(MarkdownToggleHeaderH4)
nmap <leader>h5 <Plug>(MarkdownToggleHeaderH5)
nmap <leader>h6 <Plug>(MarkdownToggleHeaderH6)
nmap <leader>ml <Plug>(MarkdownInsertLink)
nmap <leader>mb <Plug>(MarkdownToggleBold)
nmap <leader>mi <Plug>(MarkdownToggleItalics)
nmap <leader>mc <Plug>(MarkdownToggleInlineCode)



let g:vim_markdown_folding_disabled=1
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#autoformat = 1
let g:airline_section_x = '%{PencilMode()}'

" Disable syntax highlighting of matching parenthesis by default:
autocmd VimEnter * NoMatchParen
let g:vimtex_motion_matchparen = 0
