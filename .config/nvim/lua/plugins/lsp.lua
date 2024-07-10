local servers = {
  "ast_grep",     -- AST Grep
  "clangd",       -- C++
  "gopls",        -- Go
  "html",         -- HTML
  "jdtls",        -- Java
  "lua_ls",       -- Lua
  "marksman",     -- Markdown
  "pyright",      -- Python
  "rust_analyzer", -- Rust
  "sqlls",        -- SQL
  "texlab",       -- LaTeX
  "tsserver",     -- JavaScript
  "bashls",       -- Bash
  "taplo"         -- TOML
}

return {
  -- LSP has three parts: Mason, Mason-lspconfig and nvim

  -- Mason
  -- Installs and manages the LSPs
  {
    "williamboman/mason.nvim",
    opts = {},
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason-lspconfig
  -- Bridge the gap between neovim and Language servers and ensures languages
  -- are installed
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = servers,
      automatic_installation = true,
      -- java server
      servers = {
        jdtls = {},
      },
    },
  },

  -- nvim-lspconfig
  -- Allows neovim to communicate with language servers (I/O)
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      -- Function to get the virtual environment path dynamically
      local function get_python_path(workspace)
        -- Use the virtualenv in the workspace directory if available
        if workspace == nil then
          return vim.fn.exepath("python3") or vim.fn.exepath("python")
        end
        local venv_path = workspace .. "/.venv/bin/python"
        local venv_exists = vim.fn.glob(venv_path)
        if venv_exists ~= "" then
          return venv_path
        end
        -- Fallback to system python if no virtualenv is found
        return vim.fn.exepath("python3") or vim.fn.exepath("python")
      end

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          on_init = server == "pyright" and function(client)
            local python_path = get_python_path(client.config.root_dir)
            client.config.settings.python.pythonPath = python_path
            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
          end or nil,
        })
      end

      --          ╭─────────────────────────────────────────────────────────╮
      --          │                          Remap                          │
      --          ╰─────────────────────────────────────────────────────────╯

      local wk = require("which-key")
      wk.register({
        ["K"] = { vim.lsp.buf.hover, "Definitions", mode = "n" },
        ["gd"] = { vim.lsp.buf.definition, "Go to definitions", mode = "n" },
        ["<space>ca"] = { vim.lsp.buf.code_action, "Code action", mode = { "n", "v" } },
      })
    end,
  },
  { "nvim-lua/lsp-status.nvim" },
  {
    "onsails/lspkind.nvim",

    config = function()
      local lspkind = require("lspkind")
      local cmp = require("cmp")
      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- can also be a function to dynamically calculate max width such as
            -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
              return vim_item
            end,
          }),
        },
      })
    end,
  },
}
