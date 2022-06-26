filetype plugin indent on
set nocompatible

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set number
set list listchars=eol:↓,tab:--»,space:·
set mouse=a

" ##########|dein.vim|##########
" install dir {{{
let s:dein_dir = expand('~/.dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}
" dein installation check {{{
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone git@github.com:Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}
" begin settings {{{
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	" set toml directory
	let s:rc_dir = expand('~/.config/nvim/plug')
	" set toml file
	let s:toml_master = s:rc_dir . '/dein_master.toml'
	" read toml and cache
	call dein#load_toml(s:toml_master, {'lazy': 0})

	" end settings
	call dein#end()
	call dein#save_state()
endif
" }}}
" plugins installation check {{{
if dein#check_install()
	call dein#install()
endif
" }}}
" plugins removed check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
	call map(s:removed_plugins, "delete(v:val, 'rf')")
	call dein#recache_runtimepath()
endif
" }}}
