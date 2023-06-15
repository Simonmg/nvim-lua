local status, tokyonight = pcall(require, "tokyonight")

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"

if (not status) then return end
if (is_mac) then return end

tokyonight.setup({
  style = "storm",
  lighty_style = "day",
  transparent = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  }
})

vim.cmd[[colorscheme tokyonight]]
