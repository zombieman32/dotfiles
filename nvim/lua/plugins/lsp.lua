return {
    -- Enable LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
    },

    -- Simple LSP installer
    {
        'williamboman/mason.nvim',
        config = function()
            local settings = {
                ui = {
                    border = 'rounded',
                    icons = {
                        package_installed = '',
                        package_pending = '',
                        package_uninstalled = '',
                    },
                },
                log_level = vim.log.levels.INFO,
                max_concurrent_installers = 4,
            }

            require('mason').setup(settings)
        end,
    },

    -- Configuration and automatic installation of LSPs
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local servers = {
                'lua_ls',
                'cssls',
                'html',
                'tsserver',
                'pyright',
                'jsonls',
                'angularls',
                'asm_lsp',
                'clangd',
                'clojure_lsp',
                'dockerls',
                'jdtls',
                'kotlin_language_server',
                'ltex',
                'ruby_lsp',
                'rust_analyzer',
                'sqlls',
                'emmet_ls',
                'graphql',
                'svelte',
                'terraformls',
                'volar',
                'yamlls',
                'taplo',
                'csharp_ls',
                'elixirls',
            }

            require('mason-lspconfig').setup({
                ensure_installed = servers,
                automatic_installation = true,
            })

            local lspconfig = require('lspconfig')
            local opts = {}

            local handlers = require('plugins.lsp.handlers')

            for _, server in pairs(servers) do
                opts = {
                    on_attach = handlers.on_attach,
                    capabilities = handlers.capabilities,
                }

                server = vim.split(server, '@')[1]

                local require_ok, conf_opts = pcall(require,
                    'plugins.lsp.settings.' .. server)
                if require_ok then
                    opts = vim.tbl_deep_extend('force', conf_opts, opts)
                end

                lspconfig[server].setup(opts)
            end

            lspconfig.gdscript.setup({})
        end,
    },

    -- LSP diagnostics, formatting, completions and code actions
    {
        'nvimtools/none-ls.nvim',
        config = function()
            local none_ls = require('null-ls')
            local code_actions = none_ls.builtins.code_actions
            local diagnostics = none_ls.builtins.diagnostics
            local formatting = none_ls.builtins.formatting
            local hover = none_ls.builtins.hover
            local completion = none_ls.builtins.completion

            local sources = {
                completion.spell,
                completion.tags,
                code_actions.ts_node_action,
                diagnostics.actionlint,
                diagnostics.alex,
                diagnostics.cppcheck,
                diagnostics.deadnix,
                diagnostics.fish,
                diagnostics.gitlint,
                diagnostics.reek,
                diagnostics.statix,
                diagnostics.terraform_validate,
                diagnostics.tfsec,
                diagnostics.todo_comments,
                diagnostics.trail_space,
                formatting.alejandra,
                hover.dictionary,
                hover.printenv,
                none_ls.builtins.formatting.stylua.with({
                    extra_args = {
                        '--config-path',
                        vim.fn.expand(
                        '~/.config/nvim/lua/plugins/lsp/settings/stylua.toml'
                        ),
                    },
                }),
            }

            none_ls.setup({
                debug = false,
                sources = sources,
                diagnostics_format = '#{s} | #{m}',
            })
        end,
    },

    -- Better integration for Mason and nvim-dap
    'jay-babu/mason-nvim-dap.nvim',
    {
        'jay-babu/mason-null-ls.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'williamboman/mason.nvim',
            'nvimtools/none-ls.nvim',
        },
        config = function()
            local servers = {
                'prettier',
                'black',
                'stylua',
                'clang-format',
                'djlint',
                'joker',
                'ktlint',
                'latexindent',
                'rubocop',
                'sqlfmt',
                'buildifier',
                'fourmolu',
                'shfmt',
                'csharpier',
                'gdtoolkit',
                'flake8',
                'checkstyle',
                'cpplint',
                'eslint_d',
                'hadolint',
                'clj-kondo',
                'selene',
                'sqlfluff',
                'stylelint',
                'curlylint',
                'vint',
                'yamllint',
                'trivy',
                'checkmake',
                'codespell',
                'proselint',
            }

            require('mason-null-ls').setup({
                ensure_installed = servers,
                automatic_installation = true,
            })
        end,
    },

    -- UI for nvim-dap
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            {
                'mfussenegger/nvim-dap',
                config = function()
                    local sign = vim.fn.sign_define

                    sign('DapBreakpoint',
                        {
                            text = '●',
                            texthl = 'DapBreakpoint',
                            linehl = '',
                            numhl = ''
                        })

                    sign(
                        'DapBreakpointCondition',
                        {
                            text = '●',
                            texthl = 'DapBreakpointCondition',
                            linehl = '',
                            numhl = ''
                        })

                    sign('DapLogPoint',
                        {
                            text = '◆',
                            texthl = 'DapLogPoint',
                            linehl = '',
                            numhl = ''
                        })
                end,
            },
            'nvim-neotest/nvim-nio',
        },
        config = function()
            local dap, dapui = require('dap'), require('dapui')

            local keymap_opts = { noremap = true, silent = true }
            dapui.setup()

            vim.keymap.set('n',
                '<F3>',
                '<cmd>lua require("dapui").toggle("tray")<cr>', keymap_opts)
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },

    -- Complete highlight colors with LSP
    'folke/lsp-colors.nvim',

    -- LSP Utilities
    'niuiic/lsp-utils.nvim',

    -- Make LSP use fzf
    {
        'ojroques/nvim-lspfuzzy',
        dependencies = {
            { 'junegunn/fzf' },
            { 'junegunn/fzf.vim' }, -- to enable preview (optional)
        },
        config = true,
    },

    -- VSCode lightbuld for code actions
    {
        'kosayoda/nvim-lightbulb',
        config = function()
            require('nvim-lightbulb').setup({
                autocmd = {
                    enabled = true,
                },
                sign = {
                    enabled = false,
                },
                float = {
                    enabled = true,
                    text = '󱠂',
                },
            })
        end,
    },

    -- Statusline components for LSP
    'nvim-lua/lsp-status.nvim',
}
