call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
" Plug 'bling/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'easymotion/vim-easymotion'
Plug 'lervag/vimtex'
Plug 'tpope/vim-endwise'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" (Optional) Multi-entry selection UI.
Plug 'editorconfig/editorconfig-vim'
Plug 'mbbill/undotree'
" A dependency of 'ncm2'.
" Plug 'roxma/nvim-yarp'
" Plug 'othree/yajs.vim'

" v2 of the nvim-completion-manager.
" Plug 'ncm2/ncm2'
" Plug 'dense-analysis/ale'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" List ends here. Plugins become visible to Vim after this call.
call plug#end()


let g:python2_host_prog="/usr/bin/python"
let g:python3_host_prog="/usr/bin/python3"

let g:deoplete#enable_at_startup = 1

" call deoplete#custom#option('sources', {
" \ '_': ['ale'],
" \})

set shortmess+=c
set updatetime=100
set completeopt-=preview
set completeopt+=noinsert
set noswapfile

let mapleader="\<Space>"
let maplocalleader=","

" autocmd BufEnter  *  call ncm2#enable_for_buffer()

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gf :call ale#definition#GoTo({})()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


set completeopt=noinsert,menuone,noselect


set clipboard+=unnamedplus
set noshowmode
set cmdheight=2
set nocompatible
set hidden
" set background =dark
syntax on
set termguicolors
set expandtab
set softtabstop=2
set shiftwidth=2
set number relativenumber
colorscheme onedark

set nobackup
set nowritebackup

" NERD Tree
map <M-1> :NERDTreeToggle<CR>

nnoremap <Leader>fs :wa<CR>
nnoremap <Leader>wd :q<CR>
nnoremap <Leader>qq :qa!<CR>

nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>ws :ssplit<CR>

" fzf bindings
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
nnoremap <Leader>wf :Windows<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader><Leader> :Files<CR>
nnoremap <Leader>fa :FZF -x ~<CR>
nnoremap <Leader>fc :Ag <CR>
nnoremap <Leader>b :History<CR>
nnoremap <Leader>s :Snippets<CR>
nnoremap <Leader>c :Commands<CR>

nnoremap <silent><A-Up> :m .-2<CR>
nnoremap <silent><A-Down> :m .+1<CR>
inoremap <silent><A-Down> <Esc>:m .+1<CR>gi
inoremap <silent><A-Up> <Esc>:m .-2<CR>gi
vnoremap <silent><A-Down> :m '>+1<CR>gv=gv
vnoremap <silent><A-Up> :m '<-2<CR>gv=gv


" previous buffer
nnoremap <Leader><tab> :b# <CR>

" window switching
nmap <silent> <A-l> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
" nmap <silent> <A-Up> :wincmd k<CR>
" nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nmap <silent> <Leader>1 :1wincmd W<CR>
nmap <silent> <Leader>2 :2wincmd W<CR>
nmap <silent> <Leader>3 :3wincmd W<CR>
nmap <silent> <Leader>4 :4wincmd W<CR>
nmap <silent> <Leader>5 :5wincmd W<CR>
nmap <silent> <Leader>6 :6wincmd W<CR>

nnoremap Z ^
nnoremap X $

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#win_nr_show = 1
" let g:airline_section_z = '%{strftime("%H:%M")}'
" let g:airline_section_c = airline#section#create(['%{getcwd()}', '/', 'file'])

let g:startify_bookmarks = [ '~/.config/nvim/init.vim', '~/Projects/' ]
let g:startify_session_autoload = 1

noremap <silent><F11> :call GuiWindowFullScreen(1)<CR>

nnoremap <Leader>jf :PrettierAsync<CR>

" easy clip
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipUseCutDefaults = 0
" cut is on <leader>d now
nnoremap d "_d
xnoremap d "_d
nnoremap dd "_dd
nnoremap D "_D
nmap gd <Plug>MoveMotionPlug
xmap gd <Plug>MoveMotionXPlug
nmap gdd <Plug>MoveMotionLinePlug
map gD <Plug>MoveMotionEndOfLinePlug

" COC CONFIG HERE
tnoremap <C-a> <C-\><C-n>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.

inoremap <silent><expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gf <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
