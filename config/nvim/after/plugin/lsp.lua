local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  -- Autoformat on save
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp", { clear = true }),
    callback = function(args)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format {async = false, id = args.data.client_id }
        end,
      })
    end
  })
end)

-- Null-ls is a plugin that allows you to use any language server
-- Not needed unless for something outside of Mason
local null_ls = require("null-ls")

local sources = { 
  null_ls.builtins.diagnostics.erb_lint,
  null_ls.builtins.formatting.erb_format,
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.formatting.prettierd,
}

null_ls.setup({ sources = sources })

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require("mason").setup({})
require("mason-null-ls").setup({
  ensure_installed = {"erb-formatter", "erb_lint", "eslint_d", "prettierd"},
})
require("mason-lspconfig").setup({
  ensure_installed = {"eslint", "rubocop", "ruby_lsp", "rust_analyzer", "tsserver"},
  handlers = {
    lsp_zero.default_setup,
    eslint = function()
      require("lspconfig").eslint.setup({
        cmd = {"eslint_d", "--stdio", "--config", vim.fn.expand("~/workspace/Jobber/.eslintrc.js")},
        filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx"},
        format = false,
        on_attach = lsp_zero.on_attach,
      })
    end,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
    rubocop = function()
      require("lspconfig").rubocop.setup({
        cmd = {"bundle", "exec", "rubocop", "--lsp"},
        filetypes = {"ruby"},
        on_attach = lsp_zero.on_attach,
        root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git")
      })
    end,
    ruby_lsp = function() 
      require("lspconfig").ruby_lsp.setup({
        cmd = {"ruby-lsp"},
        init_options = {
          formatter = {"rubocop"},
        },
        filetypes = {"ruby"},
        on_attach = lsp_zero.on_attach,
        root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git")
      })
    end,
    tsserver = function()
      require("lspconfig").tsserver.setup({
        cmd = {"typescript-language-server", "--stdio"},
        filetypes = {"typescript", "typescriptreact", "typescript.tsx"},
        on_attach = lsp_zero.on_attach,
      })
    end,
  }
})

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  sources = {
    {name = "path"},
    {name = "nvim_lsp"},
    {name = "nvim_lua"},
    {name = "luasnip", keyword_length = 2},
    {name = "buffer", keyword_length = 3},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
})

