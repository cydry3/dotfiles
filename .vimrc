"Plugin Management(vim-plug)
call plug#begin('~/.vim/plugged')
	Plug 'lervag/vimtex'
	Plug 'rust-lang/rust.vim'
	Plug 'prabirshrestha/async.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'mattn/vim-lsp-settings'
	Plug 'thinca/vim-quickrun'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'rhysd/rust-doc.vim'
	Plug 'jiangmiao/auto-pairs'
call plug#end()

"Tab completion(for asyncomplete.vim)
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

"Automatically popup completion candidates(for asyncomplete.vim)
let g:asyncomplete_auto_popup = 1

"Laguage Server Protocol, Rust(for vim-lsp)
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif
"C family(for vim-lsp)
if executable('clangd-7')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd-7',
        \ 'cmd': {server_info->['clangd-7']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

"Run Testing, Rust(for vim-quickrun)
let g:quickrun_config = {}
autocmd BufNewFile,BufRead *.rs let g:quickrun_config.rust = {'exec': 'cargo test -- --nocapture'}

"Preview, LaTeX(for vimtex)
autocmd BufNewFile,BufNewFile *.tex let g:vimtex_compiler_latexmk_engines = { '_' : '-pdfdvi' }

"Status/Tab line theme(for vim-airline)
let g:airline_theme='molokai'

"Rust Doc directory, specified(for rust-doc)
let doc_home = fnamemodify(substitute(system('rustup doc --path'), '\n$', '', ''), ':h')
let g:rust_doc#downloaded_rust_doc_dir = doc_home

"Format file, Clang
function FormatCFile()
    let curr_line = line(".")
    exec ":%! clang-format-7"
    exec ":" . curr_line
endfunction

"General Configration
if has('reltime')
  set incsearch
endif

set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start
set history=200		
set ruler		
set showcmd		
set wildmenu		
set ttimeout		
set ttimeoutlen=100	
set display=truncate
set hlsearch
set number

inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

if has('mouse')
  set mouse=a
endif

if has("autocmd")
  filetype plugin indent on
endif 

syntax enable

set verbosefile=/tmp/vim.log
set verbose=20

if has('gui_running')
       set guifont=Monospace\ 11
       set guioptions-=T
       colorscheme monokai
endif

