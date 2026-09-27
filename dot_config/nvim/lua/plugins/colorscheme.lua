-- Use the Vercel Dark colorscheme defined in ~/.config/nvim/colors/vercel-dark.lua
-- lualine picks up ~/.config/nvim/lua/lualine/themes/vercel-dark.lua automatically
-- because LazyVim configures lualine with theme = "auto".
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vercel-dark",
    },
  },
}
