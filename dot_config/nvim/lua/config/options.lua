-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.textwidth = 100

-- A window can retain 'nowrap' after hosting a plugin buffer. Restore soft
-- wrapping whenever an ordinary buffer is displayed in that window.
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
  group = vim.api.nvim_create_augroup("WrapRegularBuffers", { clear = true }),
  callback = function()
    if vim.bo.buftype == "" then
      vim.opt_local.wrap = true
      vim.opt_local.linebreak = true
      vim.opt_local.breakindent = true
    end
  end,
})
