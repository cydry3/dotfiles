"Plugin Management(vim-plug)
call plug#begin('~/.vim/plugged')
	Plug 'lervag/vimtex'
	Plug 'rust-lang/rust.vim'
	Plug 'prabirshrestha/async.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'mattn/vim-lsp-settings'
call plug#end()

"Tab completion(for asyncomplete.vim)
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

"Automatically popup completion candidates(for asyncomplete.vim)
let g:asyncomplete_auto_popup = 0

"Laguage Server Protocol, Rust(for vim-lsp)
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

"Run Testing, Rust(for vim-quickrun)
let g:quickrun_config = {}
autocmd BufNewFile,BufRead *.rs let g:quickrun_config.rust = {'exec': 'cargo test -- --nocapture'}

"Preview, LaTeX(for vimtex)
let g:vimtex_compiler_latexmk_engines = { '_' : '-pdfdvi' }

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
