local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_atach = function(client, bufnr)
  --formating
  if client.server_capabilities.documentFormatingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formattign_seq_sync]]
    vim.api.nvim_command [[augroup End]]
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

nvim_lsp.tsserver.setup {
  on_atach = on_atach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

nvim_lsp.sumneko_lua.setup {
  on_atach = on_atach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the lenguaje server to recognize the 'vim' global
        globals = { 'vim' }
      },

      workspace = {
        -- make the server aware of Neovim rintime Files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
}
