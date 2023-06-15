local status, nvim_tree = pcall(require, 'nvim-tree')
if (not status) then return end

local keymap = vim.keymap
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

nvim_tree.setup {
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}

keymap.set('n', 'fe', ':NvimTreeToggle<Return>', { silent = true })
keymap.set('n', 'ff', ':NvimTreeFindFile<Return>', { silent = true })

