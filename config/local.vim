call g:plug#begin()
  Plug 'JuliaEditorSupport/julia-vim'
  Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
  Plug 'roxma/nvim-completion-manager'  " optional
  Plug'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call g:plug#end()

" julia
let g:default_julia_version = '0.6'

" language server
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
\       using LanguageServer;
\       server = LanguageServer.LanguageServerInstance(STDIN, STDOUT, false);
\       server.runlinter = true;
\       run(server);
\   '],
\ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

let g:airline_theme='oceanicnext'

set noro
