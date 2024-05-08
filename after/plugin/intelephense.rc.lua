local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

nvim_lsp.intelephense.setup{
  cmd = {"intelephense", "--stdio"},
  filetype = { "php"}
}
