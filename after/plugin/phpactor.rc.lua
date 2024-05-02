local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

nvim_lsp.phpactor.setup {
  cmd = { "phpactor", "language-server" },
  filetype = { "php" },
}
