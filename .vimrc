cd ~
set autochdir

set nobackup

set backspace=indent,eol,start

set ignorecase smartcase

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif "see :help last-position-jump

set ts=2 sw=2 ai si sta et
syntax on
set ruler
set nu
set hls is
set dip=filler,context:3,vertical

filetype indent on
filetype plugin on

set lz
set foldmethod=syntax
set foldnestmax=2
set foldlevelstart=1

" This behaviour can be approximated, but not precisely duplicated, with [zk and ]zj instead
map ]] m'zcjmm''zo'm
map [[ m'zckmm''zo'm

vmap > >gv
vmap < <gv
vmap = =gv

nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap Q @q

nnoremap Y y$
if has ('unnamedplus')
  set clipboard=unnamedplus,unnamed
endif

"function! SuperCleverTab()
"	if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
"		return "\<Tab>"
"	else
"		if &omnifunc != ''
"			return "\<C-X>\<C-O>"
"		elseif &dictionary != ''
"			return "\<C-K>"
"		else
"			return "\<C-N>"
"		endif
"	endif
"endfunction
"inoremap <Tab> <C-R>=SuperCleverTab()<cr>

"vnoremap <F12> :! perl -MHTML::Entities -e "while(<>){$s.=encode_entities($_);}print $s;"<CR>gv
"vnoremap <S-F12> :! perl -MHTML::Entities -e "while(<>){$s.=decode_entities($_);}print $s;"<CR>gv
"map <F11> :call JsBeautify()<cr>

noremap <HOME> ^
imap <HOME> <Esc>^i

