local function augroup(name)
  return vim.api.nvim_create_augroup("qsr_" .. name, { clear = true })
end

-- Highlight the yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("man_unlisted"),
  pattern = { "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
})

-- start terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup("term-open"),
  pattern = "*",
  command = "startinsert | set winfixheight",
  desc = "Start terminal in insert mode",
})
