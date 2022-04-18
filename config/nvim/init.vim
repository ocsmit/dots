"#####################"
"###### PLUGINS ######"
"#####################"


" Automatic vim-plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" General
Plug 'fehawen/sc.vim'
Plug 'airblade/vim-gitgutter'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'LinArcX/telescope-command-palette.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Status
"Plug 'fehawen/sl.vim'

" Sendcode
Plug 'jalvesaq/vimcmdline'

" Python
Plug 'psf/black', { 'branch': 'stable' }

" R
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

" LaTeX / Pandoc
Plug 'lervag/vimtex'
Plug 'conornewton/vim-pandoc-markdown-preview'

"Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Snippets
Plug 'SirVer/ultisnips'

" Initialize plugin system
call plug#end()

"#############################"
"###### GENERAL CONFIGS ######"
"#############################"
"
nnoremap <SPACE> <Nop>
map <Space> <Leader>
set mouse=a

" Vimtex
let g:tex_flavor = "latex"

"" Conceal
nnoremap <Leader>c :let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>

" Snippet
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/UltiSnips']


" Enable syntax and plugins
syntax enable
filetype on
filetype plugin on
filetype indent on

" Set encoding
scriptencoding utf-8
set encoding=utf-8
set noshowmode
set autoread
set ruler
set showmatch
set mat=2
set magic
set signcolumn=no
set nohlsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set nu
set lazyredraw
set nocursorline
set nocursorcolumn
set ffs=unix,dos,mac
set wrap
set pumheight=10
set nobackup
set nowritebackup
set noswapfile
set maxmempattern=20000
set completeopt-=preview
set title
set path+=**
set wildmenu
set wildignore+=**/.git/**


" Auto resize panes
"autocmd VimResized * wincmd =

autocmd BufWritePre * %s/\s\+$//e

" Highlight 81st column if line is at column 80 or higher,
" which allows us to avoid having the colorcolumn always
" present with e.g. colorcolumn=80
autocmd WinEnter,BufEnter * call matchadd('ColorColumn', '\%81v', 100)
autocmd WinLeave,BufLeave * call clearmatches()


" ctrl+left/right
nmap <ESC>[1;5D <C-Left>
nmap <ESC>[1;5C <C-Right>
cmap <ESC>[1;5D <C-Left>
cmap <ESC>[1;5C <C-Right>
imap <ESC>[1;5D <C-o><C-Left>
imap <ESC>[1;5C <C-o><C-Right>
" ctrl+backspace
nmap <C-h> <C-w>
cmap <C-h> <C-w>
imap <C-h> <C-w>

"set spell spelllang=en_us
set spellfile=~/.vim/spell/en.utf.8.add
autocmd ColorScheme * hi clear SpellBad
hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl
set spell

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

inoremap PrtSc <Esc>

" Set theme
colorscheme sc
hi Normal ctermbg=NONE guibg=NONE
hi StatusLine ctermbg=NONE cterm=NONE
"set notermguicolors
"highlight Search ctermfg=0

" Set list characters
set list
set listchars=
set listchars+=tab:›\ ,
set listchars+=trail:•,

" Set end of buffer and vertsplit to empty
set fillchars+=vert:\ ,


" indentLine
let g:indentLine_char = '•'

"#########################"
"###### KEYBINDINGS ######"
"#########################"

" remap esc
imap jj <Esc>

""""""""""""""""""""""
" Telescope

" Find files using Telescope command-line sugar.
nnoremap <leader>tt <cmd>Telescope file_browser<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>p  <cmd>Telescope command_palette<cr>

lua << EOF
require('telescope').setup({
  extensions = {
    command_palette = {
      {"File",
        { "entire selection (C-a)", ':call feedkeys("GVgg")' },
        { "save current file (C-s)", ':w' },
        { "save all files (C-A-s)", ':wa' },
        { "quit (C-q)", ':qa' },
        { "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()",1 },
        { "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
        { "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
        { "files (C-f)",     ":lua require('telescope.builtin').find_files()", 1 },
      },

      {"Help",
        { "tips", ":help tips" },
        { "cheatsheet", ":help index" },
        { "tutorial", ":help tutor" },
        { "summary", ":help summary" },
        { "quick reference", ":help quickref" },
        { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
      },

      {"Vim",
        { "reload vimrc", ":source $MYVIMRC" },
        { 'check health', ":checkhealth" },
        { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
        { "commands", ":lua require('telescope.builtin').commands()" },
        { "command history", ":lua require('telescope.builtin').command_history()" },
        { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
        { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
        { "vim options", ":lua require('telescope.builtin').vim_options()" },
        { "keymaps", ":lua require('telescope.builtin').keymaps()" },
        { "buffers", ":Telescope buffers" },
        { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
        { "paste mode", ':set paste!' },
        { 'cursor line', ':set cursorline!' },
        { 'cursor column', ':set cursorcolumn!' },
        { "spell checker", ':set spell!' },
        { "relative number", ':set relativenumber!' },
        { "search highlighting (F12)", ':set hlsearch!' },
      },
      {"R",
          {"rmd", ":! Rscript -e \"rmarkdown::render('%')\""},
      }
    }
  }
})

require('telescope').load_extension('command_palette')
require("telescope").load_extension "file_browser"
EOF

"""""""""""""""""""""""""
" Treesitter
"lua require("treesitter")

lua << EOF

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "python", "r", "go" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
EOF

""""""""""""""""""""""
" Python
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd BufWritePre *.py execute ':Black'

" R

let R_rconsole_width = 0
let R_rconsole_height = 15
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 1
let R_args = []  " if you had set any
let R_bracketed_paste = 1

vmap <LocalLeader>. <Plug>RDSendSelection
nmap <LocalLeader>. <Plug>RDSendLine

nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 1/4)<CR>


"""""""""""""""""""""""
" Send code

" vimcmdline mappings
let cmdline_map_start          = '<LocalLeader>s'
let cmdline_map_send           = '<Space>.'
let cmdline_map_send_and_stay  = '<LocalLeader><Space>'
let cmdline_map_source_fun     = '<LocalLeader>f'
let cmdline_map_send_paragraph = '<LocalLeader>p'
let cmdline_map_send_block     = '<LocalLeader>b'
let cmdline_map_send_motion    = '<LocalLeader>m'
let cmdline_map_quit           = '<LocalLeader>q'
