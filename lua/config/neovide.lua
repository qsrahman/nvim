if not vim.g.neovide then
  return
end

vim.g.neovide_theme = "dark" -- 'auto', light', 'dark'

vim.o.guifont = "JetBrainsMono Nerd Font:h14"
vim.g.neovide_text_gamma = 0.9
vim.g.neovide_text_contrast = 0.1

-- vim.g.neovide_opacity = 0.85
-- vim.g.neovide_floating_blur_amount_x = 4.0
-- vim.g.neovide_floating_blur_amount_y = 4.0
vim.g.neovide_remember_window_size = true
vim.g.neovide_show_border = true
