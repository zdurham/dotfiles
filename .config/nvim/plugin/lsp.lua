local nvim_lsp = require('lspconfig')

local opts = { noremap = true, silent = true }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option("omnifunc", 'v:lua.vim.lsp.omnifunc')

  buf_set_keymap("n", "gD", '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap("n", "gi", '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
end

-- Set up completion
local capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

servers = {
  ["pyright"] = {},
  ["tsserver"] = {},
  ["rust_analyzer"] = {
    settings = {
            ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
  },
  ["gopls"] = {
    cmd = {"gopls", "serve"},
    settings = {
      ["gopls"] = {
          analyses = {
            unusedparams = true
          },
          staticcheck = true
      }
    }
  },
  ["sumneko_lua"] = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false
        }
      }
    }
  },
  ["astro"] = {},
  ["cssls"] = {}
}

-- iterate over servers
for lsp, lsp_config in pairs(servers) do
  
  lsp_config["on_attach"] = on_attach
  lsp_config["capabilities"] = capabilities
  nvim_lsp[lsp].setup(lsp_config)
end

-- set up efm
-- set up elm?
