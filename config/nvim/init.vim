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
"Plug 'airblade/vim-gitgutter'

" requires
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'vim-ctrlspace/vim-ctrlspace'

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif


" CMP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'LinArcX/telescope-command-palette.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Status
"Plug 'fehawen/sl.vim'

" Sendcode
Plug 'jpalardy/vim-slime'

" Git
"Plug 'airblade/vim-gitgutter'
Plug 'mzlogin/vim-markdown-toc'

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
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" cheat.sh
Plug 'dbeniamine/cheat.sh-vim'

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
set number relativenumber
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
set scl=yes


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

" Splits
set splitbelow
set splitright
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

nnoremap <silent> <c-Up> :resize -2<CR>
nnoremap <silent> <c-Down> :resize +2<CR>
nnoremap <silent> <c-left> :vertical resize -2<CR>
nnoremap <silent> <c-right> :vertical resize +2<CR>

" Save
nnoremap <silent> <leader>w :update<CR>

"set spell spelllang=en_us
set spellfile=~/.vim/spell/en.utf.8.add
autocmd ColorScheme * hi clear SpellBad
hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl
hi Normal guibg=NONE ctermbg=NONE
set spell

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

inoremap PrtSc <Esc>

" Set theme
colorscheme sc
hi Normal ctermbg=NONE guibg=NONE
highlight clear SignColumn
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
    let g:slime_target = "tmux"
if exists('$TMUX')
    let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane":":.2"}
endif
"let g:slime_bracketed_paste = 1

""""""""""""""""""""
" Gitgutter


" CMP
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      --{ name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

  -- pyright
  require('lspconfig').pyright.setup {
    capabilities = capabilities
  }

  -- Check if OS and load apropriate C lsp
  require'lspconfig'.ccls.setup{}
  if jit.os == "OSX" then
      require'lspconfig'.clangd.setup{}
  else
      require'lspconfig'.ccls.setup{}
  end

EOF


" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>



lua << EOF
require'nvim-tree'.setup {
}
EOF

nnoremap <silent> <c-n> :NvimTreeToggle<CR>

set nocompatible
set hidden
let g:CtrlSpaceDefaultMappingKey = "<C-o> "
nnoremap <silent><C-p> :CtrlSpace O<CR>

set updatetime=100
