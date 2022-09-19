-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>c", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>[", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<leader><C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
end
local cpb = vim.lsp.protocol.make_client_capabilities()
cpb.textDocument.completion.completionItem.snippetSupport = true

local servers = {
  yamlls = {
    -- other configuration for setup {}
    settings = {
      yaml = {
        -- other settings. note this overrides the lspconfig defaults.
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["../path/relative/to/file.yml"] = "/.github/workflows/*",
          ["/path/from/root/of/project"] = "/.github/workflows/*",
        },
      },
    },
  },
  clangd = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  sumneko_lua = {
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  },
}
local cpb = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
for server, config in pairs(servers) do
  config.capabilities = cpb;
  config.on_attach = on_attach;
  require("lspconfig")[server].setup(config)
end
