local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Better window navigation
keymap('n', 'k', 'kzz', opts)
keymap('n', 'j', 'jzz', opts)
keymap('n', 'Q', ':q<CR>', opts)

keymap('n', '<C-Left>', '<C-w>h', opts)
keymap('n', '<C-Down>', '<C-w>j', opts)
keymap('n', '<C-Up>', '<C-w>k', opts)
keymap('n', '<C-Right>', '<C-w>l', opts)

-- Integration with tmux
keymap('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', opts)
keymap('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', opts)
keymap('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', opts)
keymap('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<cr>", opts)
-- keymap("n", "<S-h>", ":bprev<cr>", opts)
keymap('n', '<S-j>', '<Plug>(cokeline-focus-next)', opts)
keymap('n', '<S-k>', '<Plug>(cokeline-focus-prev)', opts)
keymap('n', '<S-l>', '<Plug>(cokeline-switch-next)', opts)
keymap('n', '<S-h>', '<Plug>(cokeline-switch-prev)', opts)
keymap('n', '<S-p>', '<Plug>(cokeline-pick-focus)', opts)
keymap('n', '<S-c>', '<cmd>:bd<CR>', opts)

-- Close all windows but focused
keymap('n', '<C-o>', '<cmd>:only<CR>', opts)

-- Undo and redo
keymap('n', '<S-z>', ':undo<CR>', opts)
keymap('n', '<S-x>', ':redo<CR>', opts)

-- Nvimtree
keymap('n', '<A-t>', '<Cmd>NvimTreeToggle<CR>', opts)

-- Take photo of code
keymap('n', 'ff', '$', opts)

keymap('n', 'ff', '$', opts)

-- Move lines up or down
keymap('n', '<A-k>', ':move -2<cr>', opts)
keymap('n', '<A-j>', ':move +1<cr>', opts)

-- Focus pwd to current file
keymap('n', '<A-p>', ':cd %:p:h<CR>', opts)

--Splits
keymap('n', '<A-h>', ':vsplit<cr>', opts)
keymap('n', '<A-v>', ':split<cr>', opts)

-- Resize with arrows
keymap('n', '<A-Up>', ':resize +2<CR>', opts)
keymap('n', '<A-Down>', ':resize -2<CR>', opts)
keymap('n', '<A-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<A-Right>', ':vertical resize +2<CR>', opts)

-- [Visual] --
keymap('v', 'ff', '$', opts)

-- Telescope --
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap(
    'n',
    '<C-f>',
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
    opts
)
keymap('n', '<c-t>', '<cmd>Telescope live_grep<cr>', opts)

keymap('n', '<F5>', '<Cmd>UndotreeToggle<CR>', opts)
keymap('n', '<leader>L', '<Cmd>Lazy<CR>', opts)

if vim.bo.filetype == 'tidal' then
    keymap('i', 'billybd', '[t ~ ~ ~] [~ ~ ~ ~] [t ~ ~ ~] [~ ~ ~ ~]', opts)
    keymap('i', 'billysn', '[~ ~ ~ ~] [t ~ ~ ~] [~ ~ ~ ~] [t ~ ~ ~]', opts)
    keymap('i', 'billych', '[t ~ t ~] [t ~ t ~] [t ~ t ~] [t ~ t ~]', opts)
    keymap('i', 'bluemondaybd', '[t ~ ~ ~] [~ ~ ~ ~] [t ~ ~ ~] [~ ~ ~ ~]', opts)
    keymap('i', 'bluemondaysn', '[~ ~ ~ ~] [t ~ ~ ~] [~ ~ ~ ~] [t ~ ~ ~]', opts)
    keymap('i', 'bluemondaycp', '[~ ~ ~ ~] [t ~ ~ ~] [~ ~ ~ ~] [t ~ ~ ~]', opts)
    keymap('i', 'bluemondayoh', '[~ ~ t ~] [~ ~ t ~] [~ ~ t ~] [~ ~ t ~]', opts)
end

keymap('n', '<F2>', "<cmd> lua require('code-shot').shot()<cr>", opts) -- Codeshot normal Mode
keymap('v', '<F2>', "<cmd> lua require('code-shot').shot()<cr>", opts) -- Codeshot visual mode
keymap('n', '<F12>', '<cmd>:set spell! <CR>', opts) -- Activate spelling
keymap('i', '<F12>', '<cmd>:set spell! <CR>', opts)
keymap('n', '<F11>', '<cmd>:ZenMode <CR>', opts)
