" Called after everything just before setting a default colorscheme
" Configure you own bindings or other preferences. e.g.:

" set nonumber " No line numbers
" let g:gitgutter_signs = 0 " No git gutter signs
" let g:SignatureEnabledAtStartup = 0 " Do not show marks
" nmap s :MultipleCursorsFind
" colorscheme hybrid
" let g:lightline['colorscheme'] = 'wombat'
" ...

" NERDTree
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap \ :NERDTreeToggle<CR>

" Jump to error
nmap <silent> ]q :ALENext <CR>
nmap <silent> [q :ALEPrevious <CR>

" Switch between file and test file
nmap <silent> ,. :GoAlternate <CR>

" Quickly run tests for current file
nmap <silent> ,t :TestFile <CR>
nmap <silent> ,T :TestNearest <CR>

" Open in GitHub
nmap <silent> ,gg :ToGithub <CR>
