-- Basic Settings
vim.opt.encoding = "UTF-8" -- Use UTF-8 encoding
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = false -- Relative line numbers
vim.opt.cursorline = true -- Highlight current line
vim.opt.scrolloff = 4 -- Keep 4 lines above/below cursor
vim.opt.sidescroll = 1 -- scroll left/right one char at a time
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursori
vim.opt.smoothscroll = true
vim.opt.wrap = false -- Don't wrap lines
vim.opt.spelllang = { "en" }

-- Tabbing / Indentation
vim.opt.tabstop = 4 -- Tab width
vim.opt.shiftwidth = 4 -- Indent width
vim.opt.softtabstop = 4 -- Soft tab stop
vim.opt.shiftround = true -- Round indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true -- Copy indent from current line
vim.opt.grepprg = "rg --vimgrep" -- Use ripgrep if available
vim.opt.grepformat = "%f:%l:%c:%m" -- filename, line number, column, content
vim.opt.formatoptions:remove({ "r", "o" })
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Search Settings
vim.opt.ignorecase = true -- Case-insensitive search
vim.opt.smartcase = true -- Case-sensitive if uppercase in search
vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.incsearch = true -- Show matches as you type
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.jumpoptions = "view"
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.listchars:append({ tab = "» ", trail = "·", nbsp = "␣" })

-- Visual Settings
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.signcolumn = "yes" -- Always show sign column
-- vim.opt.colorcolumn = "100" -- Show column at 100 characters
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show matching bracket
vim.opt.completeopt = "menu,menuone,noselect" -- Completion options
vim.opt.showmode = false -- Don't show mode in command line
vim.opt.pumheight = 10 -- Popup menu height
vim.opt.pumblend = 10 -- Popup menu transparency
vim.opt.winblend = 0 -- Floating window transparency
vim.opt.conceallevel = 0 -- Don't hide markup
vim.opt.concealcursor = "" -- Show markup even on cursor line
vim.opt.laststatus = 3 -- global statusline
vim.opt.ruler = false -- Disable the default ruler

-- File Handling
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't backup before overwriting
vim.opt.swapfile = false -- Don't create swap files
vim.opt.undofile = true -- Persistent undo
vim.opt.undolevels = 10000
vim.opt.diffopt:append("vertical") -- Vertical diff splits
vim.opt.diffopt:append("algorithm:patience") -- Better diff algorithm
vim.opt.diffopt:append("linematch:60") -- Better diff highlighting (smart line matching)

-- Behavior Settings
vim.opt.errorbells = false -- Disable error sounds
vim.opt.backspace = "indent,eol,start" -- Make backspace behave naturally
vim.opt.whichwrap = "<,>,[,],h,l" -- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
vim.opt.autochdir = false -- Don't change directory automatically
vim.opt.iskeyword:append("-") -- Treat dash as part of a word
vim.opt.path:append("**") -- Search into subfolders with `gf`
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.opt.wildmenu = true -- Enable command-line completion menu
vim.opt.wildmode = "longest:full,full" -- Completion mode for command-line
vim.opt.wildignorecase = true -- Case-insensitive tab completion in commands
vim.opt.winminwidth = 5 -- Minimum window width
-- vim.opt.autowrite = true -- Enable auto write
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer

-- Folding Settings
vim.opt.foldmethod = "expr" -- Use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding
vim.opt.foldlevel = 99 -- Keep all folds open by default
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- Split Behavior
vim.opt.splitbelow = true -- Horizontal splits open below
vim.opt.splitright = true -- Vertical splits open to the right

vim.opt.mouse = "a" -- Enable mouse support
vim.opt.keymodel = "startsel,stopsel" -- Shift + Cursor keys select text
vim.opt.selection = "inclusive" -- "exclusive"
-- vim.opt.selectmode = "mouse,key" -- "mouse,key,cmd"
-- vim.opt.mousemodel = "popup" -- "popup_setpos"
-- vim.opt.mousescroll = "ver:1,hor:0" -- disable horizontal scrolling

vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
