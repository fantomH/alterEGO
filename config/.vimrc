"--{ ZmFudG9tSA==: "Open the vault of knowledge" }-----------------------------
"
" .vimrc:
"   created:       '2021-02-23 02:54:43 UTC'
"   updated:       '2021-03-13 01:14:50 UTC'
"   description:   'VIM main configuration file.' 
"   application:   'vim'
"   target:        '${HOME}/.vimrc'
"
"------------------------------{ alterEGO Linux }------------------------------

"----------{ GENERAL CONFIG }

  set nocompatible          " -- Forces vim to act like vim, not like vi.
  let mapleader = "-"       " -- <leader>
  set cursorline            " -- Highlights the cursor line.
  set noswapfile            " -- disable the creation of swap files.
  set colorcolumn=80        " -- Used with colored column.

"----------{ CHANGE CASES }

" -- Upper case.
  inoremap <C-u> <ESC>viwUea
  nnoremap <C-u> viwUea
" -- Lower case.
  inoremap <C-l> <ESC>viwu
  nnoremap <C-l> viwu

"----------{ COMMENTS TOGGLE }

" -- Stackoverflow
" .. What's a quick way to comment/uncomment lines in Vim?
" .. https://stackoverflow.com/a/22246318
" .. Remapped from <F7> to <leader>c
" .. Mapped visual and normal mode.
  autocmd FileType c,cpp,java,scala let b:comment_leader = '//'
  autocmd FileType sh,ruby,python   let b:comment_leader = '#'
  autocmd FileType conf,fstab       let b:comment_leader = '#'
  autocmd FileType tex              let b:comment_leader = '%'
  autocmd FileType mail             let b:comment_leader = '>'
  autocmd FileType vim              let b:comment_leader = '"'
  function! CommentToggle()
      execute ':silent! s/\([^ ]\)/' . b:comment_leader . ' \1/'
      execute ':silent! s/^\( *\)' . b:comment_leader . ' \?' . b:comment_leader . ' \?/\1/'
  endfunction
  vnoremap <leader>c :call CommentToggle()<CR>
  nnoremap <leader>c :call CommentToggle()<CR>

"----------{ EDIT .vimrc }

  nnoremap <leader>ev :tabedit $MYVIMRC<cr>
  nnoremap <leader>so :source $MYVIMRC<cr>

"----------{ ENCODING }

" -- The encoding displayed.
  set encoding=utf8
" -- The encoding written to file.
  set fileencoding=utf8
" -- set BOM ...WARNING: doesn't work, need to set manually.
" set bomb

"----------{ FILE EXPLORER }

" -- Same buffer
  nnoremap <leader>fe :Explore<CR> 
" -- New tab
  nnoremap <leader>te :Texplore<CR>

"----------{ HELP }

" -- View man pages of word under cursor.
  nmap <leader>k :silent execute '!man <cword>'<cr>:redraw!<cr>
" -- View Python documentation of word under cursor.
  nmap <leader>hp :silent execute '!pydoc <cword>'<cr>:redraw!<cr>

"----------{ HIGHLIGHT LINE }

  " -- ref. https://vimtricks.com/p/highlight-specific-lines/

  " -- Highlight the current line.
  nnoremap <silent> <Leader>hl :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
  " -- Clear all the highlighted lines.
  nnoremap <silent> <Leader>hc :call clearmatches()<CR>

"----------{ LINEBREAK AND WRAP }

  set linebreak
  set wrap
" set showbreak=[......]
  set showbreak==>\ \ 
" -- Toggle linewrap.
  map <leader>w :setlocal wrap!<CR>

"----------{ LINE NUMBER }

  set number
  set relativenumber
" -- Toggle linenumber.
  nnoremap <leader>nn :set norelativenumber nonumber<cr>
  nnoremap <leader>en :set relativenumber number<cr>

"----------{ LOREM }

  inoremap lorem<TAB> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sodales, dolor ut lobortis rhoncus, mauris leo condimentum metus, vel elementum arcu ipsum aliquam est. Integer a scelerisque turpis, at ultrices nisl. Nunc fermentum quam elementum, sagittis velit id, porta tellus. Nunc quis suscipit felis. Etiam et leo scelerisque, gravida elit nec, aliquet justo. Phasellus et neque vel turpis hendrerit fringilla sed in arcu. Suspendisse id enim lacinia libero auctor pellentesque. Proin sed sem non neque pellentesque vehicula. Nunc sapien justo, tincidunt vitae ultrices eu, consectetur sit amet orci.

"----------{ RUN SCRIPT }

" -- Requires tmux, with a second pane open.
" .. Python:
  nnoremap <leader>p :!tmux send-key -t 1 "python '%:p'" enter;<cr><C-l>
  nnoremap <leader>ss :!tmux send-keys -t 1 "C-c";<CR><C-l>

"----------{ SAVE FILE }

" -- CTRL+s to save file
" .. ref. https://stackoverflow.com/questions/3446320/in-vim-how-to-map-save-to-ctrl-s
  inoremap <C-s> <ESC>:write<CR>

"----------{ SCROLL OFFSET }

" -- When scrolling, keeps the cursor at the vertical center.
" .. Use so=999 for centered
" .. ref. http://vim.wikia.com/wiki/make_search_results_appear_in_the_middle_of_the_screen
  set scrolloff=999

"----------{ SEARCH }

" -- Fuzzy find and wildmenu.
  set path+=**
  set wildmenu
" -- Search ignorecase.
  set ignorecase
" -- Search highlight.
  set hlsearch

"----------{ SPELLCHECKER }

" -- Toggle spell checker.
  map <F5> :setlocal spell! spelllang=en_us<CR>

"----------{ STATUSLINE }

  set laststatus=2
  set statusline=
  set statusline+=\ %<%F\ "File+path
  set statusline+=\ buffer:[%n] "buffernr
  set statusline+=\ %y\ "FileType 
  set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''} "Encoding 
  set statusline+=\ %{(&bomb?\",BOM\":\"\")}\ "Encoding2 
  set statusline+=\ %{&ff}\ "FileFormat (dos/unix..) 
  set statusline+=\ %=\ row:%l/%L\ (%03p%%)\ "Rownumber/total (%) 
  set statusline+=\ col:%03c\ "Colnr 
  set statusline+=\ %m%r%w\ %P\ \ "Modified? Readonly? Top/bot.

"----------{ TAB AND INDENT }

  set tabstop=2
" -- shiftround : rounds indent to multiple of shiftwidth.
" -- Applies to < and > in normal mode. <C-t> and <C-d> in insert mode
" -- always round the indent.
  set shiftround
  set shiftwidth=2
  set expandtab

"----------{ TAGS }

  inoremap "<TAB> ""<left>
  inoremap '<TAB> ''<left>
  inoremap (<TAB> ()<left>
  inoremap [<TAB> []<left>
  inoremap {<TAB> {}<left>
  inoremap {<CR> {<CR>}<ESC>O
  inoremap {;<CR> {<CR>};<ESC>O

"----------{ TIMESTAMP }

" -- Insert timestamp.
" -- ex: Fri Mar 8 13:29:52 UTC 2019  
  nnoremap <F12> "=system('echo -n $(date --utc "+%F %H:%M:%S %Z" )')<CR>p
" -- Insert timestamp as ID.
" -- ex: 202005151148
  nnoremap <F9> "=system('echo -n $(date --utc "+%Y%m%d%H%M")')<CR>p

"----------{XCLIP }
" -- Enable clipboard ability with xclip.
" -- ref. Andrew [8xx8] Kulakov 'VIM Copy/Paste' <https://coderwall.com/p/hmki3q/vim-copy-paste>
  map <F7> y:call system("xclip -i -selection clipboard", getreg("\""))<cr>
  map <S-F7> :call setreg("\"",system("xclip -o -selection clipboard"))<cr>p")")")"))

"----------{ PLUGINS }

  syntax enable
  filetype plugin on

"-----[ vim-plug ]

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/davidhalter/jedi-vim.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" -- Automatically install missing plugins.
" .. https://github.com/junegunn/vim-plug/wiki/extra#automatically-install-missing-plugins-on-startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" -- Disable automatic indent on from vim-plug
  filetype indent off

"-----[ PLUGIN: fzf.vim ]

" -- Buffers list.
nnoremap <silent> <leader>ls :Buffers<CR>
" -- Open files in $HOME.
nnoremap <silent> <C-o> :Files<CR>
" -- Open files from /.
nnoremap <silent> <leader>os :Files /<CR>
" -- Find lines containing.
nnoremap <silent> <C-f> :BLines<CR>
" -- Droidnotes TOC find.
nnoremap <silent> <leader>td :BLines <!-- <CR>

"-----[ PLUGIN: emmet-vim ]

" -- Enable emmet-vim tab completion 
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"----------{COLORSCHEME}

  " -- Colors:
  " .. 0   Black
  " .. 10  Lime

  set t_Co=256

  " -- iceberg: https://github.com/cocopon/iceberg.vim/blob/master/src/iceberg.vim
  " -- blaquemagick: https://github.com/xero/blaquemagick.vim/blob/master/colors/blaquemagick.vim

  " colorscheme default
  colorscheme iceberg
  set background=dark

  highlight ColorColumn   cterm=NONE    ctermfg=NONE  ctermbg=238
  highlight Comment       cterm=BOLD    ctermfg=31    ctermbg=NONE
  highlight CursorLine    cterm=NONE    ctermfg=NONE  ctermbg=238
  highlight Function      cterm=BOLD    ctermfg=150   ctermbg=NONE
  highlight LineHighlight cterm=NONE    ctermfg=0     ctermbg=10
  highlight LineNr        cterm=NONE    ctermfg=246   ctermbg=238
  highlight Search        cterm=NONE    ctermfg=16    ctermbg=11
  highlight Statement     cterm=ITALIC  ctermfg=110   ctermbg=NONE
  highlight StatusLine    cterm=NONE    ctermfg=246   ctermbg=238
  highlight StatusLineNC  cterm=NONE    ctermfg=0     ctermbg=238
  highlight Visual        cterm=NONE    ctermfg=16    ctermbg=11

  " -- html/md
  " .. ref. http://vimdoc.sourceforge.net/htmldoc/syntax.html
  highlight htmlTagName   cterm=BOLD    ctermfg=23    ctermbg=NONE
  highlight link htmlTag    htmlTagName
  highlight link htmlEndTag htmlTagName

"--{ file:fin }----------------------------------------------------------------
