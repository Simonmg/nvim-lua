require("nvim-lsp-installer").setup {}

local status, nvim_lsp = pcall(require, 'lspconfig')
local statusTheme, tokionight = pcall(require, 'tokionight')
if (not status) then return end

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

nvim_lsp.lua_ls.setup {
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

nvim_lsp.tsserver.setup {
  on_atach = on_atach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  cmd = { "typescript-language-server", "--stdio" }
};

nvim_lsp.vuels.setup{
  cmd = { "vls" },
  on_atach = on_atach,
  filetypes = { "vue" }
}

nvim_lsp.volar.setup {}


if (not statusTheme) then return end

tokionight.setup {
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent"
  }
}

