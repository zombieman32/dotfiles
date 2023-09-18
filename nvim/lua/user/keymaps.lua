local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.g.mapleader = "."
vim.g.maplocalleader = "."

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Better window navigation
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Integration with tmux
keymap("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", opts)
keymap("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", opts)
keymap("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<Plug>(cokeline-focus-next)", opts)
keymap("n", "<S-h>", "<Plug>(cokeline-focus-prev)", opts)
keymap("n", "<S-j>", "<Plug>(cokeline-switch-next)", opts)
keymap("n", "<S-k>", "<Plug>(cokeline-switch-prev)", opts)
keymap("n", "<S-p>", "<Plug>(cokeline-pick-focus)", opts)
keymap("n", "<S-c>", ":bdelete<CR>", opts)
-- keymap("n", "<S-k>", ":BufferLineMoveNext<CR>", opts)
-- keymap("n", "<S-j>", ":BufferLineMovePrev<CR>", opts)
-- keymap("n", "<S-p>", ":BufferLinePick<CR>", opts)

-- Close all windows but focused
keymap("n", "<C-o>", ":only<CR>", opts)

-- Nvimtree
keymap("n", "<A-t>", "<Cmd>NvimTreeToggle<CR>", opts)

-- Take photo of code
keymap("n", "ff", "$", opts)

keymap("n", "ff", "$", opts)

-- Move lines up or down
keymap("n", "<A-k>", ":move -2<cr>", opts)
keymap("n", "<A-j>", ":move +1<cr>", opts)

-- Focus pwd to current file
keymap("n", "<A-p>", ":cd %:p:h<CR>", opts)

--Splits
keymap("n", "<A-h>", ":vsplit<cr>", opts)
keymap("n", "<A-v>", ":split<cr>", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- [Visual] --
keymap("v", "ff", "$", opts)
keymap("v", "(", "di()<esc>hp", opts) -- Surround selected text in parentheses
keymap("v", "{", "di{}<esc>hp", opts) -- Surround selected text in brackets
keymap("v", "[", "di[]<esc>hp", opts) -- Surround selected text in square brackets
keymap("v", '"', 'di""<esc>hp', opts) -- Surround selected text in quotes
keymap("v", "'", "di''<esc>hp", opts) -- Surround selected text in single quotes

-- Telescope --
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap(
	"n",
	"<leader>f",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
