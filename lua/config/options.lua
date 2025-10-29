vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Basic Settings
vim.o.encoding = "UTF-8" -- Use UTF-8 encoding
vim.o.number = true -- Line numbers
vim.o.relativenumber = false -- Relative line numbers
vim.o.cursorline = true -- Highlight current line
vim.o.scrolloff = 4 -- Keep 4 lines above/below cursor
vim.o.sidescroll = 1 -- scroll left/right one char at a time
vim.o.sidescrolloff = 8 -- Keep 8 columns left/right of cursori
vim.o.smoothscroll = true
vim.o.wrap = false -- Don't wrap lines
vim.opt.spelllang = { "en" }

-- Tabbing / Indentation
vim.o.tabstop = 4 -- Tab width
vim.o.shiftwidth = 4 -- Indent width
vim.o.softtabstop = 4 -- Soft tab stop
vim.o.shiftround = true -- Round indent
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.smartindent = true -- Smart auto-indenting
vim.o.autoindent = true -- Copy indent from current line
vim.o.grepprg = "rg --vimgrep" -- Use ripgrep if available
vim.o.grepformat = "%f:%l:%c:%m" -- filename, line number, column, content
vim.opt.formatoptions:remove({ "r", "o" })
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Search Settings
vim.o.ignorecase = true -- Case-insensitive search
vim.o.smartcase = true -- Case-sensitive if uppercase in search
vim.o.hlsearch = false -- Don't highlight search results
vim.o.incsearch = true -- Show matches as you type
vim.o.inccommand = "nosplit" -- preview incremental substitute
vim.o.jumpoptions = "view"
vim.o.list = true -- Show some invisible characters (tabs...
vim.opt.listchars:append({ tab = "» ", trail = "·", nbsp = "␣" })

-- Visual Settings
vim.o.termguicolors = true -- Enable 24-bit colors
vim.o.signcolumn = "yes" -- Always show sign column
-- vim.o.colorcolumn = "100" -- Show column at 100 characters
vim.o.showmatch = true -- Highlight matching brackets
vim.o.matchtime = 2 -- How long to show matching bracket
vim.o.completeopt = "menu,menuone,noselect,fuzzy" -- Completion options
vim.o.showmode = false -- Don't show mode in command line
vim.o.showcmd = false -- Don't partial command below status line
vim.o.pumheight = 10 -- Popup menu height
vim.o.pumblend = 10 -- Popup menu transparency
vim.o.winblend = 0 -- Floating window transparency
vim.o.conceallevel = 0 -- Don't hide markup
vim.o.concealcursor = "" -- Show markup even on cursor line
vim.o.laststatus = 3 -- global statusline
vim.o.ruler = false -- Disable the default ruler

-- File Handling
vim.o.backup = false -- Don't create backup files
vim.o.writebackup = false -- Don't backup before overwriting
vim.o.swapfile = false -- Don't create swap files
vim.o.undofile = true -- Persistent undo
vim.o.undolevels = 10000
vim.opt.diffopt:append("vertical") -- Vertical diff splits
vim.opt.diffopt:append("algorithm:patience") -- Better diff algorithm
vim.opt.diffopt:append("linematch:60") -- Better diff highlighting (smart line matching)

-- Behavior Settings
vim.o.errorbells = false -- Disable error sounds
vim.o.backspace = "indent,eol,start" -- Make backspace behave naturally
vim.o.whichwrap = "<,>,h,l" -- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
vim.o.autochdir = false -- Don't change directory automatically
vim.opt.iskeyword:append("-") -- Treat dash as part of a word
vim.opt.path:append("**") -- Search into subfolders with `gf`
vim.o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
vim.o.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.o.wildmenu = true -- Enable command-line completion menu
vim.o.wildmode = "longest:full,full" -- Completion mode for command-line
vim.o.wildignorecase = true -- Case-insensitive tab completion in commands
vim.o.winminwidth = 5 -- Minimum window width
-- vim.o.autowrite = true -- Enable auto write
vim.o.confirm = true -- Confirm to save changes before exiting modified buffer

-- Folding Settings
vim.o.foldtext = ""
vim.o.foldmethod = "expr" -- Use expression for folding
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding
vim.o.foldlevel = 99 -- Keep all folds open by default
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- Split Behavior
vim.o.splitbelow = true -- Horizontal splits open below
vim.o.splitright = true -- Vertical splits open to the right

vim.o.mouse = "a" -- Enable mouse support
vim.o.keymodel = "startsel,stopsel" -- Shift + Cursor keys select text
-- vim.o.selection = "inclusive" -- "exclusive"
-- vim.o.selectmode = "mouse,key" -- "mouse,key,cmd"
-- vim.o.mousemodel = "popup" -- "popup_setpos"
-- vim.o.mousescroll = "ver:1,hor:0" -- disable horizontal scrolling

vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
