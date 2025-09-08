local map = vim.keymap.set

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

map("n", "<Esc>", "<cmd>nohl<CR>", { desc = "Clear search highlights", silent = true })

-- save file
map("n", "<D-s>", "<cmd>w<CR>", { desc = "Save file" })
map("i", "<D-s>", "<C-o><cmd>w<CR>", { desc = "Save file" })

-- delete single character without copying into register
map({ "v", "n" }, "x", '"_x', { desc = "Delete single character" })

-- Keep last yanked when pasting
map({ "v", "x" }, "p", '"_dP', { desc = "Paste" })

map("v", "y", '"+y', { desc = "Yank to system clipboard" })

map("n", "<D-k>", '"_d$', { desc = "Delete to end of line" })
map("i", "<D-k>", '<C-o>"_d$', { desc = "Delete to end of line" })

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
map("i", "<C-a>", "<C-o>gg<S-v>G", { desc = "Select all" })

-- Better J behavior
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

map("n", "<Enter>", "O<Down><Esc>", { desc = "Insert new line above cursor" })
map("n", "<Bs>", "X", { desc = "Delete new line above cursor" })
map("v", "<bs>", '"_di', { desc = "Delete selected text" })

-- Search and replace
map("n", "<D-r>", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>", { desc = "Search and replace" })
map("i", "<D-r>", "<C-o>:%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>", { desc = "Search and replace" })
map("v", "<D-r>", '"hy:%s/<C-r>h/<C-r>h/g<Left><Left>', { desc = "Search and replace" })

-- Better indenting in visual mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

map("n", "<A-S-Down>", "yyp", { noremap = true, silent = true, desc = "Duplicate current line" })
map("i", "<A-S-Down>", "<C-o>yyp", { noremap = true, silent = true, desc = "Duplicate current line" })

-- Buffer navigation
-- map("n", "<Tab>", "<Cmd>bnext<CR>", { desc = "Next buffer" })
-- map("n", "<S-Tab>", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })

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

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Move Lines
map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Open terminal
map("n", "<D-`>", "<cmd>bo term<CR>", { desc = "Toggle terminal" })
map("i", "<D-`>", "<C-o><cmd>bo term<CR>", { desc = "Toggle terminal" })
map("t", "<D-`>", "exit<CR>", { desc = "Toggle terminal" })

map("n", "<D-/>", "gcc", { desc = "Toggle comment line", remap = true })
map("i", "<D-/>", "<C-o>gcc", { desc = "Toggle comment line", remap = true })
map("v", "<D-/>", "gc", { desc = "Toggle comments", remap = true })

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

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", function()
  vim.treesitter.inspect_tree()
  vim.api.nvim_input("I")
end, { desc = "Inspect Tree" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
