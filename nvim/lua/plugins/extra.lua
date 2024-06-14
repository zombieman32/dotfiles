return {
    -- Autopair brackets, parentheses, etc.
    {
        'windwp/nvim-autopairs',
        config = function()
            local autopairs = require('nvim-autopairs')
            local Rule = require('nvim-autopairs.rule')
            local conds = require('nvim-autopairs.conds')
            local ts_conds = require('nvim-autopairs.ts-conds')
            local handlers = require('nvim-autopairs.completion.handlers')
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')

            autopairs.setup({
                check_ts = true,
                ts_config = {
                    lua = { 'string', 'source' },
                    javascript = { 'string', 'template_string' },
                },
                disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
                fast_wrap = {
                    map = '<M-e>',
                    chars = { '{', '[', '(', '"', "'" },
                    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
                    offset = 0, -- Offset from pattern match
                    end_key = '$',
                    keys = 'qwertyuiopzxcvbnmasdfghjkl',
                    check_comma = true,
                    highlight = 'PmenuSel',
                },
                highlight_grey = 'LineNr',
                enable_check_bracket_line = false,
                ignored_next_char = '[%w%.]',
            })

            autopairs.add_rules({
                Rule('%', '%', 'lua'):with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
                Rule('$', '$', 'lua'):with_pair(ts_conds.is_not_ts_node({ 'function' })),
            })

            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done({
                    filetypes = {
                        -- "*" is a alias to all filetypes
                        ['*'] = {
                            ['('] = {
                                kind = {
                                    cmp.lsp.CompletionItemKind.Function,
                                    cmp.lsp.CompletionItemKind.Method,
                                },
                                handler = handlers['*'],
                            },
                        },
                        -- Disable for tex
                        tex = false,
                    },
                })
            )

            -- Add spaces between parentheses
            local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
            autopairs.add_rules({
                -- Rule for a pair with left-side ' ' and right side ' '
                Rule(' ', ' ')
                -- Pair will only occur if the conditional function returns true
                    :with_pair(
                        function(opts)
                            -- We are checking if we are inserting a space in (), [], or {}
                            local pair = opts.line:sub(opts.col - 1, opts.col)
                            return vim.tbl_contains({
                                brackets[1][1] .. brackets[1][2],
                                brackets[2][1] .. brackets[2][2],
                                brackets[3][1] .. brackets[3][2],
                            }, pair)
                        end
                    )
                    :with_move(conds.none())
                    :with_cr(conds.none())
                -- We only want to delete the pair of spaces when the cursor is as such: ( | )
                    :with_del(
                        function(opts)
                            local col = vim.api.nvim_win_get_cursor(0)[2]
                            local context = opts.line:sub(col - 1, col + 2)
                            return vim.tbl_contains({
                                brackets[1][1] .. '  ' .. brackets[1][2],
                                brackets[2][1] .. '  ' .. brackets[2][2],
                                brackets[3][1] .. '  ' .. brackets[3][2],
                            }, context)
                        end
                    ),
            })

            -- For each pair of brackets we will add another rule
            for _, bracket in pairs(brackets) do
                autopairs.add_rules({
                    -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
                    Rule(bracket[1] .. ' ', ' ' .. bracket[2])
                        :with_pair(conds.none())
                        :with_move(function(opts)
                            return opts.char == bracket[2]
                        end)
                        :with_del(conds.none())
                        :use_key(bracket[2])
                    -- Removes the trailing whitespace that can occur without this
                        :replace_map_cr(
                            function(_)
                                return '<C-c>2xi<CR><C-c>O'
                            end
                        ),
                })
            end

            -- Add space on =
            Rule('=', '')
                :with_pair(conds.not_inside_quote())
                :with_pair(function(opts)
                    local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
                    if last_char:match('[%w%=%s]') then
                        return true
                    end
                    return false
                end)
                :replace_endpair(function(opts)
                    local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
                    local next_char = opts.line:sub(opts.col, opts.col)
                    next_char = next_char == ' ' and '' or ' '
                    if prev_2char:match('%w$') then
                        return '<bs> =' .. next_char
                    end
                    if prev_2char:match('%=$') then
                        return next_char
                    end
                    if prev_2char:match('=') then
                        return '<bs><bs>=' .. next_char
                    end
                    return ''
                end)
                :set_end_pair_length(0)
                :with_move(conds.none())
                :with_del(conds.none())
        end,
    },

    -- Save last session
    {
        'folke/persistence.nvim',
        event = 'BufReadPre', -- this will only start session saving when an actual file was opened
        config = true,
    },

    -- Search nerdicons
    {
        '2kabhishek/nerdy.nvim',
        dependencies = {
            'stevearc/dressing.nvim',
            'nvim-telescope/telescope.nvim',
        },
        cmd = 'Nerdy',
    },

    -- Color codes preview
    'norcalli/nvim-colorizer.lua',

    -- Discord integration
    'andweeb/presence.nvim',

    {
        'smoka7/multicursors.nvim',
        dependencies = {
            'smoka7/hydra.nvim',
        },
        config = function()
            local multicursors = require('multicursors')
            multicursors.setup({
                normal_keys = {
                    -- to change default lhs of key mapping change the key
                    ['<C-c>'] = {
                        method = function()
                            require('multicursors.utils').call_on_selections(function(selection)
                                vim.api.nvim_win_set_cursor(0, { selection.row + 1, selection.col + 1 })
                                local line_count = selection.end_row - selection.row + 1
                                vim.cmd('normal ' .. line_count .. 'gcc')
                            end)
                        end,
                        opts = { desc = 'comment selections' },
                    },
                },
                hint_config = {
                    border = 'rounded',
                    position = 'bottom-right',
                },
                generate_hints = {
                    normal = true,
                    insert = true,
                    extend = true,
                    config = {
                        column_count = 1,
                    },
                },
            })
        end,
    },

    -- Obsidian integration
    {
        'epwalsh/obsidian.nvim',
        version = '*', -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = 'markdown',
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        --   "BufReadPre path/to/my-vault/**.md",
        --   "BufNewFile path/to/my-vault/**.md",
        -- },
        dependencies = {
            -- Required.
            'nvim-lua/plenary.nvim',
            'hrsh7th/nvim-cmp',
            'nvim-telescope/telescope.nvim',
            'nvim-treesitter/nvim-treesitter',

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            workspaces = {
                {
                    name = 'default',
                    path = '/hdd/Documentos/Notes/obsidian/default/',
                },
            },
        },
    },

    -- Tmux integration
    'christoomey/vim-tmux-navigator',

    -- OrgMode
    { 'nvim-orgmode/orgmode', config = true },

    -- Neorg
    {
        'nvim-neorg/neorg',
        dependencies = {
            'luarocks.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-neorg/neorg-telescope',
            'nvim-neorg/lua-utils.nvim',
            'pysan3/pathlib.nvim',
            'nvim-neotest/nvim-nio',
            'MunifTanjim/nui.nvim',
        },
        lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = '*', -- Pin Neorg to the latest stable release
        opts = {
            load = {
                ['core.defaults'] = {},
                ['core.integrations.telescope'] = {},
            },
        },
        config = true,
    },

    -- Add utf-8 bullet points
    {
        'akinsho/org-bullets.nvim',
        config = function()
            require('org-bullets').setup()
        end,
    },

    -- Create tables
    'dhruvasagar/vim-table-mode',

    -- Keymap reminder
    {
        'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300

            local which_key = require('which-key')
            local setup = {
                plugins = {
                    marks = true,         -- shows a list of your marks on ' and `
                    registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                    spelling = {
                        enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                        suggestions = 20, -- how many suggestions should be shown in the list?
                    },
                    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                    -- No actual key bindings are created
                    presets = {
                        operators = false,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
                        motions = false,      -- adds help for motions
                        text_objects = false, -- help for text objects triggered after entering an operator
                        windows = true,       -- default bindings on <c-w>
                        nav = true,           -- misc bindings to work with windows
                        z = true,             -- bindings for folds, spelling and others prefixed with z
                        g = true,             -- bindings for prefixed with g
                    },
                },
                -- add operators that will trigger motion and text object completion
                -- to enable all native operators, set the preset / operators plugin above
                -- operators = { gc = "Comments" },
                icons = {
                    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
                    separator = ' ', -- symbol used between a key and it's label
                    group = '󰜌 ', -- symbol prepended to a group
                },
                popup_mappings = {
                    scroll_down = '<c-d>', -- binding to scroll down inside the popup
                    scroll_up = '<c-u>',   -- binding to scroll up inside the popup
                },
                window = {
                    border = 'rounded',       -- none, single, double, shadow
                    position = 'bottom',      -- bottom, top
                    margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
                    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                    winblend = 30,
                },
                layout = {
                    height = { min = 4, max = 25 },                                           -- min and max height of the columns
                    width = { min = 20, max = 50 },                                           -- min and max width of the columns
                    spacing = 3,                                                              -- spacing between columns
                    align = 'left',                                                           -- align columns left, center or right
                },
                ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
                hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
                show_help = true,                                                             -- show help message on the command line when the popup is visible
                triggers = 'auto',                                                            -- automatically setup triggers
                -- triggers = {"<leader>"} -- or specify a list manually
                triggers_blacklist = {
                    -- list of mode / prefixes that should never be hooked by WhichKey
                    -- this is mostly relevant for key maps that start with a native binding
                    -- most people should not need to change this
                    i = { 'j', 'k' },
                    v = { 'j', 'k' },
                },
            }

            local opts = {
                mode = 'n',     -- NORMAL mode
                prefix = '<leader>',
                buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
                silent = true,  -- use `silent` when creating keymaps
                noremap = true, -- use `noremap` when creating keymaps
                nowait = true,  -- use `nowait` when creating keymaps
            }

            local mappings = {
                ['L'] = { '<cmd>Lazy<cr>', 'Lazy' },
                ['a'] = { '<cmd>Alpha<cr>', 'Alpha' },
                ['b'] = {
                    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
                    'Buffers',
                },
                ['e'] = { '<cmd>NvimTreeToggle<cr>', 'Explorer' },
                ['w'] = { '<cmd>w!<CR>', 'Save' },
                ['q'] = { '<cmd>q!<CR>', 'Quit' },
                ['c'] = { '<cmd>Bdelete!<CR>', 'Close Buffer' },
                ['h'] = { '<cmd>nohlsearch<CR>', 'No Highlight' },
                ['f'] = {
                    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
                    'Find files',
                },
                ['F'] = { '<cmd>Telescope live_grep theme=ivy<cr>', 'Find Text' },
                ['P'] = { '<cmd>Telescope projects<cr>', 'Projects' },
                ['k'] = { '<cmd>lua require("ts-node-action").node_action<cr>', 'Node action' },

                g = {
                    name = 'Git',
                    g = { '<cmd>lua _LAZYGIT_TOGGLE()<CR>', 'Lazygit' },
                    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", 'Next Hunk' },
                    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", 'Prev Hunk' },
                    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", 'Blame' },
                    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", 'Preview Hunk' },
                    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", 'Reset Hunk' },
                    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", 'Reset Buffer' },
                    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", 'Stage Hunk' },
                    u = {
                        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
                        'Undo Stage Hunk',
                    },
                    o = { '<cmd>Telescope git_status<cr>', 'Open changed file' },
                    b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
                    c = { '<cmd>Telescope git_commits<cr>', 'Checkout commit' },
                    d = {
                        '<cmd>Gitsigns diffthis HEAD<cr>',
                        'Diff',
                    },
                },

                l = {
                    name = 'LSP',
                    a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code Action' },
                    d = {
                        '<cmd>Telescope lsp_document_diagnostics<cr>',
                        'Document Diagnostics',
                    },
                    w = {
                        '<cmd>Telescope lsp_workspace_diagnostics<cr>',
                        'Workspace Diagnostics',
                    },
                    f = { '<cmd>lua vim.lsp.buf.formatting()<cr>', 'Format' },
                    i = { '<cmd>LspInfo<cr>', 'Info' },
                    I = { '<cmd>LspInstallInfo<cr>', 'Installer Info' },
                    j = {
                        '<cmd>lua vim.diagnostic.goto_next()<CR>',
                        'Next Diagnostic',
                    },
                    k = {
                        '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>',
                        'Prev Diagnostic',
                    },
                    l = { '<cmd>lua vim.lsp.codelens.run()<cr>', 'CodeLens Action' },
                    q = { '<cmd>lua vim.diagnostic.setloclist()<cr>', 'Quickfix' },
                    r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
                    s = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document Symbols' },
                    S = {
                        '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
                        'Workspace Symbols',
                    },
                },
                s = {
                    name = 'Search',
                    b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
                    c = { '<cmd>Telescope colorscheme<cr>', 'Colorscheme' },
                    h = { '<cmd>Telescope help_tags<cr>', 'Find Help' },
                    M = { '<cmd>Telescope man_pages<cr>', 'Man Pages' },
                    r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
                    R = { '<cmd>Telescope registers<cr>', 'Registers' },
                    k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
                    C = { '<cmd>Telescope commands<cr>', 'Commands' },
                },

                d = {
                    name = 'DAP',
                    s = {
                        '<cmd> lua require("dapui").float_element("scopes", {enter = true,position = "center",width = 50,height = 20})<cr>',
                        'Variable Scopes',
                    },
                    t = {
                        '<cmd> lua require("dapui").float_element("stacks", {enter = true,position = "center",width = 50,height = 20})<cr>',
                        'Threads and Stack Frames',
                    },
                    w = {
                        '<cmd> lua require("dapui").float_element("watches", {enter = true,position = "center",width = 50,height = 20})<cr>',
                        'Watch Expressions',
                    },
                    b = {
                        '<cmd> lua require("dapui").float_element("breakpoints", {enter = true,position = "center",width = 50,height = 20})<cr>',
                        'Breakpoints',
                    },
                    r = {
                        '<cmd> lua require("dapui").float_element("repl", {enter = true,position = "center",width = 50,height = 20})<cr>',
                        'REPL',
                    },
                    c = {
                        '<cmd> lua require("dapui").float_element("console", {enter = true,position = "center",width = 50,height = 20})<cr>',
                        'Console',
                    },
                },
            }

            which_key.setup(setup)
            which_key.register(mappings, opts)
        end,
    },

    -- Take pretty code screenshots
    {
        'niuiic/code-shot.nvim',
        dependencies = {
            'niuiic/core.nvim',
        },
        config = function()
            local codeshot = require('code-shot')
            codeshot.setup({
                output = function()
                    local core = require('core')
                    local buf_name = vim.api.nvim_buf_get_name(0)
                    return '/hdd/Imágenes/Screenshots/Codeshot' .. core.file.name(buf_name) .. '.png'
                end,
                options = function(select_area)
                    if not select_area then
                        return {
                            '--shadow-blur-radius',
                            '5',
                            '--no-line-number',
                            '--theme',
                            'OneHalfDark',
                            '--font',
                            'Fira Code',
                            '--line-pad',
                            '4',
                        }
                    end
                    return {
                        '--shadow-blur-radius',
                        '5',
                        '--line-offset',
                        select_area.s_start.row,
                        '--no-line-number',
                        '--theme',
                        'OneHalfDark',
                        '--font',
                        'Fira Code',
                        '--line-pad',
                        '4',
                    }
                end,
            })
        end,
    },

    -- Highlights for certain filetypes
    {
        'lukas-reineke/headlines.nvim',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = true,
    },

    -- Color picker
    'uga-rosa/ccc.nvim',

    -- Zoxide integratrion
    'nanotee/zoxide.vim',

    -- Visit links in a file
    {
        'xiyaowong/link-visitor.nvim',
        config = function()
            require('link-visitor').setup({
                open_cmd = 'xdg-open',
                border = 'rounded', -- none, single, double, rounded, solid, shadow see `:h nvim_open_win()`
            })
        end,
    },

    -- Use luarocks inside nvim
    {
        'vhyrro/luarocks.nvim',
        priority = 1100, -- this plugin needs to run before anything else
        lazy = true,
        opts = {
            rocks = { 'magick' },
        },
        config = true,
    },

    -- Generate images with kitty protocol
    -- {
    --     '3rd/image.nvim',
    --     dependencies = { 'luarocks.nvim' },
    --     config = function()
    --         local image = require('image')
    --
    --         image.setup({
    --             integrations = {
    --                 neorg = {
    --                     enabled = true,
    --                 },
    --             },
    --         })
    --     end,
    -- },
    {
        'norcalli/nvim-terminal.lua',
        config = true,
    },

    -- Clipboard history
    {
        'AckslD/nvim-neoclip.lua',
        dependencies = {
            { 'nvim-telescope/telescope.nvim' },
        },
        config = true,
    },

    -- List of utilities to debug
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            position = 'right',
        },
    },

    -- Task Manager
    { 'niuiic/task.nvim',     dependencies = { 'niuiic/core.nvim' } },

    -- Markers
    {
        'niuiic/track.nvim',
        dependencies = { 'niuiic/core.nvim', 'nvim-telescope/telescope.nvim' },
        config = true,
    },

    --Translation
    {
        'niuiic/translate.nvim',
        dependencies = { 'niuiic/core.nvim' },
        config = true,
    },

    -- Smooth Scrolling
    'niuiic/scroll.nvim',

    -- Markdown preview with glow
    {
        'ellisonleao/glow.nvim',
        cmd = 'Glow',
        config = function()
            require('glow').setup({
                border = 'rounded',
                style = 'dark',
            })
        end,
    },

    -- Links utilities in Markdwon
    {
        'Nedra1998/nvim-mdlink',
        config = function()
            require('nvim-mdlink').setup({
                keymap = true,
                cmp = true,
            })

            local has_mdlink, mdlink = pcall(require, 'nvim-mdlink.cmp')
            if has_mdlink then
                require('cmp').register_source('mdlink', mdlink.new())
            end
        end,
    },

    -- Notify bad nvim practices
    'antonk52/bad-practices.nvim',

    -- Cellular automaton
    {
        'eandrju/cellular-automaton.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
    },

    -- Minesweeper
    'seandewar/nvimesweeper',

    -- Look for ToDo comments
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- Divider lines
    {
        'niuiic/divider.nvim',
        config = true,
    },

    -- Edit a part of a file
    {
        'niuiic/part-edit.nvim',
        dependencies = {
            'niuiic/core.nvim',
        },
        config = true,
    },

    -- Autosave
    {
        'okuuva/auto-save.nvim',
        cmd = 'ASToggle',
        event = { 'InsertLeave', 'TextChanged' },
    },

    -- Highlight
    {
        'Pocco81/HighStr.nvim',
        config = function()
            local high_str = require('high-str')
            local mocha = require('catppuccin.palettes').get_palette('mocha')

            high_str.setup({
                verbosity = 0,
                saving_path = '/tmp/highstr/',
                highlight_colors = {
                    -- color_id = {"bg_hex_code",<"fg_hex_code"/"smart">}
                    color_0 = { mocha.crust, 'smart' },    -- Cosmic charcoal
                    color_1 = { mocha.yellow, 'smart' },   -- Pastel yellow
                    color_2 = { mocha.sapphire, 'smart' }, -- Aqua menthe
                    color_3 = { mocha.mauve, 'smart' },    -- Proton purple
                    color_4 = { mocha.red, 'smart' },      -- Orange red
                    color_5 = { mocha.green, 'smart' },    -- Office green
                    color_6 = { mocha.blue, 'smart' },     -- Just blue
                    color_7 = { mocha.pink, 'smart' },     -- Blush pink
                    color_8 = { mocha.overlay, 'smart' },  -- Cosmic latte
                    color_9 = { mocha.peach, 'smart' },    -- Fallow brown
                },
            })
        end,
    },

    -- Better folding
    {
        'chrisgrieser/nvim-origami',
        event = 'BufReadPost',
        opts = true, -- needed even when using default config
    },

    -- Automatically genereate licenses
    {
        'https://git.sr.ht/~reggie/licenses.nvim',
        config = function()
            require('licenses').setup({
                copyright_holder = 'Rafael Verde',
                email = 'rafaelverde10@proton.me',
                license = 'mit',
            })
        end,
    },

    -- Extended C-a and C-x
    {
        'RutaTang/compter.nvim',
        config = function()
            require('compter').setup({
                fallback = true,
                templates = {
                    {
                        -- For numbers
                        pattern = [[-\?\d\+]],
                        priority = 0,
                        increase = function(content)
                            content = tonumber(content)
                            return content + 1, true
                        end,
                        decrease = function(content)
                            content = tonumber(content)
                            return content - 1, true
                        end,
                    },

                    -- For lowercase alphabet
                    {
                        pattern = [[\l]],
                        priority = 0,
                        increase = function(content)
                            local ansiCode = string.byte(content) + 1
                            if ansiCode > string.byte('z') then
                                ansiCode = string.byte('a')
                            end
                            local char = string.char(ansiCode)
                            return char, true
                        end,
                        decrease = function(content)
                            local ansiCode = string.byte(content) - 1
                            if ansiCode < string.byte('a') then
                                ansiCode = string.byte('z')
                            end
                            local char = string.char(ansiCode)
                            return char, true
                        end,
                    },

                    -- for uppercase alphabet
                    {
                        pattern = [[\u]],
                        priority = 0,
                        increase = function(content)
                            local ansiCode = string.byte(content) + 1
                            if ansiCode > string.byte('Z') then
                                ansiCode = string.byte('A')
                            end
                            local char = string.char(ansiCode)
                            return char, true
                        end,
                        decrease = function(content)
                            local ansiCode = string.byte(content) - 1
                            if ansiCode < string.byte('A') then
                                ansiCode = string.byte('Z')
                            end
                            local char = string.char(ansiCode)
                            return char, true
                        end,
                    },

                    -- for date format: dd/mm/YYYY
                    {
                        pattern = [[\d\{2}/\d\{2}/\d\{4}]],
                        priority = 100,
                        increase = function(content)
                            local ts = vim.fn.strptime('%d/%m/%Y', content)
                            if ts == 0 then
                                return content, false
                            else
                                ts = ts + 24 * 60 * 60
                                return vim.fn.strftime('%d/%m/%Y', ts), true
                            end
                        end,
                        decrease = function(content)
                            local ts = vim.fn.strptime('%d/%m/%Y', content)
                            if ts == 0 then
                                return content, false
                            else
                                ts = ts - 24 * 60 * 60
                                return vim.fn.strftime('%d/%m/%Y', ts), true
                            end
                        end,
                    },
                },
            })
        end,
    },

    -- Toggle relative and absolute number
    'cpea2506/relative-toggle.nvim',

    --Better macros
    {
        'chrisgrieser/nvim-recorder',
        dependencies = 'rcarriga/nvim-notify', -- optional
        opts = {},                             -- required even with default settings
    },

    -- Draw Venn diagrams
    'jbyuki/venn.nvim',

    -- images
    'edluffy/hologram.nvim',

    -- Show colorcolumn when column limit is exceeded
    {
        'm4xshen/smartcolumn.nvim',
        opts = {
            disabled_filetypes = {
                'NvimTree',
                'lazy',
                'mason',
                'help',
                'checkhealth',
                'lspinfo',
                -- 'noice',
                'Trouble',
                'fish',
                'alpha',
            },
        },
        config = true,
    },

    -- Project Manager
    {
        'pluffie/neoproj',
        cmd = { 'ProjectOpen', 'ProjectNew' },
    },

    -- Another code screenshoter powered by silicone
    {
        'krivahtoo/silicon.nvim',
        build = './install.sh',
        config = function()
            require('silicon').setup({
                font = 'FiraCode=16',
                theme = 'Dracula',
                output = {
                    path = '/hdd/Imágenes/Screenshots/silicon',
                    format = 'silicon_'
                        .. vim.api.nvim_buf_get_name(0)
                        .. '_[year][month][day]_[hour][minute][second].png',
                },
                watermark = {
                    text = '   @zombieman32',
                },
                window_title = function()
                    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':~:.')
                end,
            })
        end,
    },

    -- Yet another code screenshoter powered by carbon
    {
        'ellisonleao/carbon-now.nvim',
        lazy = true,
        cmd = 'CarbonNow',
        ---@param opts cn.ConfigSchema
        opts = {
            options = {
                theme = 'onedark',
                bg = 'pink',
                titlebar = '   @zombieman32',
            },
        },
    },

    -- Toggle text (true/false, on/off, etc.)
    { 'nguyenvukhang/nvim-toggler',   config = true },

    -- Preview folds
    { 'anuvyklack/fold-preview.nvim', dependencies = 'anuvyklack/keymap-amend.nvim', config = true },

    -- Open URLs
    {
        'sontungexpt/url-open',
        event = 'VeryLazy',
        cmd = 'URLOpenUnderCursor',
        config = function()
            local status_ok, url_open = pcall(require, 'url-open')
            if not status_ok then
                return
            end
            url_open.setup({})

            vim.api.nvim_set_keymap('n', '<leader>o', '<cmd>URLOpenUnderCursor<cr>', { noremap = true, silent = true })
        end,
    },

    -- Autocreate dirs
    'mateuszwieloch/automkdir.nvim',
}
