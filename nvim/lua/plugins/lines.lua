return {
    -- Statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
        config = function()
            local lualine = require('lualine')

            local hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end

            local diagnostics = {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                sections = { 'error', 'warn' },
                symbols = { error = ' ', warn = ' ' },
                colored = false,
                update_in_insert = false,
                always_visible = true,
            }

            local diff = {
                'diff',
                colored = false,
                symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
                cond = hide_in_width,
            }

            local mode = {
                'mode',
                fmt = function(str)
                    return ' ' .. str .. ' '
                end,
            }

            local filename = {
                'filename',
                fmt = function(str)
                    return ' ' .. str .. ' '
                end,
            }

            local filetype = {
                'filetype',
                icons_enabled = false,
                icon = nil,
            }

            local branch = {
                'branch',
                icons_enabled = true,
                icon = '',
            }

            local location = {
                'location',
                padding = 0.5,
            }

            local icons = {
                '',
                '',
                '',
                '',
                '󱓞',
                '󰥟',
                '󰟕',
                '󱎓',
                '',
                '󰣙',
                '󰣘',
                '󰽯',
                '󰽰',
                '󰎈',
                '󰽭',
                '󰽫',
                '',
                '󰡚',
                '󰡗',
                '󰡜',
                '󰡛',
                '󰡘',
                '󰡙',
                '',
                '󰝱',
                '󰙽',
                '󰚩',
                '󱚝',
                '󱚟',
                '󱚡',
                '󱚣',
                '󱚥',
                '󰳆',
                '󰏒',
                '󰩃',
                '󱐍',
                '',
                '',
                '󰜂',
                '󱓷',
                '󱉟',
                '󱗂',
                '',
                '',
                '',
                '',
                '󰦚',
                '󱢢',
                '󱢦',
                '󱢪',
                '󱢮',
                '',
                '󰟡',
                '󰖫',
                '󰯙',
                '',
                '󰔱',
                '󰩑',
                '󱌴',
                '󰍳',
            }
            local random = math.random(0, #icons - 1)

            local function cat()
                local icon = icons[random]
                return icon
            end
            -- cool function for progress
            local progress = function()
                local current_line = vim.fn.line('.')
                local total_lines = vim.fn.line('$')
                -- { "󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂁", "󰁹" }
                local chars = {
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                }
                local line_ratio = current_line / total_lines
                local index = math.ceil(line_ratio * #chars)
                return chars[index]
            end

            local spaces = function()
                return 'spaces ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
            end

            local function is_active()
                local ok, hydra = pcall(require, 'hydra.statusline')
                return ok and hydra.is_active()
            end

            local function get_name()
                local ok, hydra = pcall(require, 'hydra.statusline')
                if ok then
                    return hydra.get_name()
                end
                return ''
            end

            lualine.setup({
                options = {
                    icons_enabled = true,
                    theme = 'catppuccin',
                    component_separators = { left = ')', right = '(' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = { 'dashboard', 'NvimTree', 'Outline' },
                    always_divide_middle = true,
                },
                sections = {
                    lualine_a = { branch, diagnostics },
                    lualine_b = { mode, { get_name, cond = is_active } },
                    lualine_c = { filename },
                    -- lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_x = { cat, diff, spaces, filetype },
                    lualine_y = { location },
                    lualine_z = { progress },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                extensions = {
                    'nvim-dap-ui',
                    'oil',
                    'lazy',
                    'mason',
                    'nvim-tree'
                },
            })
        end,
    },
    -- Buffer and status line
    --    {
    --        'tamton-aquib/staline.nvim',
    --        enable = false,
    --        config = function()
    --            local staline = require('staline')
    --            local stabline = require('stabline')
    --
    --            staline.setup()
    --            stabline.setup()
    --        end,
    --    },
    -- Bufferline
    {
        'willothy/nvim-cokeline',
        dependencies = {
            'nvim-lua/plenary.nvim', -- Required for v0.4.0+
            'nvim-tree/nvim-web-devicons', -- If you want devicons
        },
        config = function()
            local cokeline = require('cokeline')
            local mocha = require('catppuccin.palettes').get_palette('mocha')

            local switch = {
                [1] = '#f38ba8',
                [2] = '#eba0ac',
                [3] = '#f2cdcd',
                [4] = '#fab387',
                [5] = '#f9e2af',
                [6] = '#a6e3a1',
                [7] = '#94e2d5',
                [8] = '#89dceb',
                [9] = '#74c7ec',
                [10] = '#89b4fa',
                [11] = '#b4befe',
                [0] = '#cba6f7',
            }

            cokeline.setup({
                buffers = {
                    focus_on_delete = 'prev',
                    new_buffers_position = 'next',
                },
                pick = {
                    use_filename = false,
                    letters = '<123456789qwertyuiopasdfghjklñzxcvbnm,.',
                },
                default_hl = {
                    fg = function(buffer)
                        return buffer.is_focused and mocha.base or mocha.text
                    end,
                    bg = function(buffer)
                        return buffer.is_focused and switch[math.fmod(buffer.index, 7)] or mocha.surface1
                    end,
                },
                sidebar = {
                    filetype = 'NvimTree',
                    components = {
                        {
                            text = '  NvimTree 󰙅',
                            fg = mocha.sapphire,
                            bg = mocha.base,
                            style = 'bold',
                        },
                    },
                },

                components = {
                    {
                        text = ' ',
                        bg = mocha.base,
                    },
                    {
                        text = '█',
                        fg = function(buffer)
                            return buffer.is_focused and switch[math.fmod(buffer.index, 7)] or mocha.surface1
                        end,

                        bg = mocha.base,
                    },
                    {
                        text = function(buffer)
                            return buffer.devicon.icon
                        end,
                        fg = function(buffer)
                            return buffer.is_focused and mocha.base or buffer.devicon.color
                        end,
                    },
                    {
                        text = ' ',
                    },
                    {
                        text = function(buffer)
                            return buffer.filename .. '  '
                        end,
                        style = function(buffer)
                            return buffer.is_focused and 'italic,bold' or nil
                        end,
                    },
                    {
                        text = '󰅖',
                        delete_buffer_on_left_click = true,
                    },
                    {
                        text = '█',
                        fg = function(buffer)
                            return buffer.is_focused and switch[math.fmod(buffer.index, 7)] or mocha.surface1
                        end,
                        bg = mocha.base,
                    },
                },
                mappings = {
                    cycle_prev_next = true,
                },
            })
        end,
    },
    -- Status, buffer and window line
    { 'rebelot/heirline.nvim', enabled = false },
}
