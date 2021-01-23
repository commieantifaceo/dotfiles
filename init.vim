"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')

" plugins here
" maybe one day ill fucking comment to explain what all of these are
" until then ill just wanna shoot myself
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

call plug#end()


" just some defaults for vim-sleuth and editorconfig
set expandtab
set tabstop=2
set shiftwidth=2

" fzf epic style
" change the ; character to whatever the h*ck you want
map ; :Files<CR>

set number
