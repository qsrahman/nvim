local map = vim.keymap.set

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit Neovim" })
map({ "n", "i" }, "<C-q>", "<Esc><cmd>qa<CR>", { desc = "Quit Neovim" })

map("n", "<Esc>", "<cmd>nohl<CR>", { desc = "Clear search highlights", silent = true })

-- save file
map("n", "<D-s>", "<cmd>w<CR>", { desc = "Save file" })
map("i", "<D-s>", "<C-o><cmd>w<CR>", { desc = "Save file" })
map("v", "<D-s>", "<C-c><cmd>w<CR>", { desc = "Save file" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- delete single character without copying into register
map({ "v", "n" }, "x", '"_x', { desc = "Delete single character" })

map("n", "<D-k>", '"_d$', { desc = "Delete to end of line" })
map("i", "<D-k>", '<C-o>"_d$', { desc = "Delete to end of line" })

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
map("i", "<C-a>", "<C-o>gg<C-o><S-v>G", { desc = "Select all" })

-- Better J behavior
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

map("n", "<Bs>", '"_X', { desc = "Delete new line above cursor" })
map("v", "<Bs>", '"_d', { desc = "Delete selected text" })
map("n", "<Enter>", "O<Down><Esc>", { desc = "Insert new line above cursor" })

map("n", "<D-Up>", "gg", { desc = "Jump to start of file" })
map("n", "<D-Down>", "G", { desc = "Jump to end of file" })
map("i", "<D-Up>", "<C-o>gg", { desc = "Jump to start of file" })
map("i", "<D-Down>", "<C-o>G", { desc = "Jump to end of file" })
map("n", "<D-Left>", "0", { desc = "Jump to start of line" })
map("n", "<D-Right>", "$", { desc = "Jump to end of line" })
map("i", "<D-Left>", "<C-o>0", { desc = "Jump to start of line" })
map("i", "<D-Right>", "<C-o>$", { desc = "Jump to end of line" })

map("v", "y", '"+y', { desc = "Yank to system clipboard" })

-- Keep last yanked when pasting
map({ "v", "x" }, "p", '"_dP', { desc = "Paste over selection without yanking it" })

-- Cut, Copy and Paste
map("v", "<D-x>", '"+x', { desc = "Cut" }) -- Cut visual mode
map("v", "<D-c>", '"+y', { desc = "Copy" }) -- Copy visual mode
map({ "n", "v" }, "<D-v>", '"+P', { desc = "Paste" }) -- Paste normal and visual mode
map("i", "<D-v>", '<Esc>"+Pi', { desc = "Paste" }) -- Paste insert mode
-- map("c", "<D-v>", "<C-r>+", { desc = "Paste" }) -- Paste command mode

--CTRL-Z is Undo; not in cmdline though
map("n", "<C-Z>", "u", { desc = "Undo" })
map("i", "<C-Z>", "<C-o>u", { desc = "Undo" })

--CTRL-Y is Redo
map("n", "<C-Y>", "<C-R>", { desc = "Redo" })
map("i", "<C-Y>", "<C-o><C-R>", { desc = "Redo" })

map("n", "<D-r>", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>", { desc = "Search and replace" })
-- map("i", "<D-r>", "<C-o>:%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>", { desc = "Search and replace" })
-- map("v", "<D-r>", '"hy:%s/<C-r>h/<C-r>h/g<Left><Left>', { desc = "Search and replace" })

-- Better indenting in visual mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Duplicate line
map("n", "<A-S-Down>", "yyp", { noremap = true, silent = true, desc = "Duplicate current line" })
map("i", "<A-S-Down>", "<Esc>yypi", { noremap = true, silent = true, desc = "Duplicate current line" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- CTRL-Tab is Next window
map("n", "<C-Tab>", "<C-W>w", { desc = "Next window" })
map("i", "<C-Tab>", "<C-O><C-W>w", { desc = "Next window" })
map({ "c", "o" }, "<C-Tab>", "<C-C><C-W>w", { desc = "Next window" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
map("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })

-- Buffer navigation
map("n", "<Tab>", "<Cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Center screen when jumping
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("n", "<D-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<D-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

map("n", "<A-/>", "gcc", { desc = "Toggle comment line", remap = true })
map("i", "<A-/>", "<C-o>gcc", { desc = "Toggle comment line", remap = true })
map("v", "<A-/>", "gc", { desc = "Toggle comments", remap = true })

-- location list
map("n", "<leader>xl", function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Location List" })

-- quickfix list
map("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", function()
  vim.treesitter.inspect_tree()
  vim.api.nvim_input("I")
end, { desc = "Inspect Tree" })

-- windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Open terminal
-- map("n", "<D-`>", "<cmd>below terminal<CR>", { desc = "Toggle terminal" })
-- map("i", "<D-`>", "<C-o><cmd>below terminal<CR>", { desc = "Toggle terminal" })
map("t", "<D-`>", "exit<CR>", { desc = "Toggle terminal" })
map({ "n", "i" }, "<D-`>", function()
  local b = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_open_win(b, true, {
    split = "below",
    height = 15,
    fixed = true,
  })

  vim.cmd.term()
  vim.cmd.startinsert()
end, { desc = "Toggle terminal" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
