if not vim.g.neovide then
  return
end

vim.g.neovide_theme = "auto" -- 'auto', light', 'dark'

vim.o.guifont = "JetBrainsMono Nerd Font:h13"
vim.g.neovide_text_gamma = 0.9
vim.g.neovide_text_contrast = 0.1

-- vim.g.neovide_opacity = 0.85
-- vim.g.neovide_floating_blur_amount_x = 4.0
-- vim.g.neovide_floating_blur_amount_y = 4.0
vim.g.neovide_remember_window_size = true

vim.keymap.set("v", "<D-c>", '"+y') -- Copy
vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

-- This allows me to use cmd+v to paste stuff into neovide
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
