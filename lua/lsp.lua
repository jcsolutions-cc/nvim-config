local M = {}

function M.setup()
  local is_termux = vim.env.PREFIX ~= nil and vim.env.PREFIX:find("com.termux", 1, true) ~= nil
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- Keep the configured language servers relevant to this setup.
  -- LuaLS is intentionally not included.
  local servers = {
    "bashls",
    "cssls",
    "html",
    "intelephense",
    "jsonls",
    "pyright",
    "ts_ls",
  }

  -- On Termux, install clang/clangd with `pkg install clang`.
  -- On desktop Linux, clangd can be installed through Mason or the system package manager.
  if not is_termux then
    table.insert(servers, "clangd")
  end

  vim.lsp.config("*", { capabilities = capabilities })

  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_enable = servers,
  })

  vim.diagnostic.config({
    virtual_text = { spacing = 2, prefix = "●" },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { border = "rounded", source = "if_many" },
  })
end

return M
