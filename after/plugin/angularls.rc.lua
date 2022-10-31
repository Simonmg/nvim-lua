local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local project_library_path = vim.fn.getcwd()

local cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  project_library_path ,
  "--ngProbeLocations",
  project_library_path
}

nvim_lsp.angularls.setup {
  cmd = cmd,
  fileTypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
  on_new_config = function (new_config, new_root_dir)
    new_config.cmd = cmd
  end
}

