-- lualine theme matching ~/.config/nvim/colors/vercel-dark.lua
local c = {
  bg = "#101010",
  fg = "#ededed",
  bg_highlight = "#1a1a1a",
  gray = "#a1a1a1",
  red = "#f75f8f",
  green = "#62c073",
  yellow = "#ff9907",
  blue = "#52a8ff",
  magenta = "#c472fb",
}

local function mode(color)
  return {
    a = { fg = c.bg, bg = color, gui = "bold" },
    b = { fg = c.fg, bg = c.bg_highlight },
    c = { fg = c.gray, bg = c.bg },
  }
end

local theme = {
  normal = mode(c.blue),
  insert = mode(c.green),
  visual = mode(c.magenta),
  replace = mode(c.red),
  command = mode(c.yellow),
  inactive = {
    a = { fg = c.gray, bg = c.bg_highlight },
    b = { fg = c.gray, bg = c.bg_highlight },
    c = { fg = c.gray, bg = c.bg },
  },
}

return theme
