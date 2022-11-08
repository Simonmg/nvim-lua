local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local keymap = vim.keymap

local cmd = { "vscode-eslint-language-server", "--stdio"}

nvim_lsp.eslint.setup {
  cmd = cmd,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
    "svelte",
    "astro"
  }
}

keymap.set('n', 'fa', ':EslintFixAll<Return>', { silent = true })
