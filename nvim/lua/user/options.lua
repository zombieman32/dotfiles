local vim = vim
local o = vim.opt

o.autochdir = true
o.compatible = false                      -- no vi compatibility
o.backup = false                          -- creates a backup file
o.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
o.cmdheight = 2                           -- more space in the neovim command line for displaying messages
o.completeopt = {"menu", "menuone", "noselect"  } -- mostly just for cmp
o.conceallevel = 2                        -- so that `` is visible in markdown files
o.concealcursor = "nc"
o.fileencoding = "utf-8"                  -- the encoding written to a file
o.hlsearch = true                         -- highlight all matches on previous search pattern
o.ignorecase = true                       -- ignore case in search patterns
o.mouse = "a"                             -- allow the mouse to be used in neovim
o.pumheight = 10                          -- pop up menu height
o.showtabline = 2                         -- always show tabs
o.smartcase = true                        -- smart case
o.smartindent = true                      -- make indenting smarter again
o.splitbelow = true                       -- force all horizontal splits to go below current window
o.splitright = true                       -- force all vertical splits to go to the right of current window
o.swapfile = false                        -- creates a swapfile
o.termguicolors = true                    -- set term gui colors (most terminals support this)
o.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true                         -- enable persistent undo
o.updatetime = 300                        -- faster completion (4000ms default)
o.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
o.expandtab = true                        -- convert tabs to spaces
o.shiftwidth = 4                          -- the number of spaces inserted for each indentation
o.tabstop = 4                             -- insert 4 spaces for a tab
o.cursorline = true                       -- highlight the current line
o.cursorcolumn = false                    -- highlight the current column
o.relativenumber = true                   -- set relative numbered lines
o.number = true
o.numberwidth = 2                         -- set number column width to 2 {default 4}
o.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
o.wrap = false                            -- display lines as one long line
o.scrolloff = 10                          -- is one of my fav
o.sidescrolloff = 8
o.guifont = "FiraCode-Regular"                    -- the font used in graphical neovim applications
o.showmode = true
o.incsearch = true
o.showcmd = true
o.showmatch = true
o.history = 1000
o.wildmenu = true
o.laststatus=2
vim.g.markdown_composer_autostart = 0
vim.g.markdown_composer_browser = "epiphany"
vim.loader.enable()
o.foldmethod = "syntax"
o.spelllang = "es_mx"

o.shortmess:append "c"

vim.cmd "filetype on"
vim.cmd "filetype plugin on"
vim.cmd "filetype indent on"
vim.cmd "hi CursorLine cterm=NONE ctermbg=242"
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set listchars=eol:󰌑,tab:\|·,trail:~,extends:>,precedes:<]]
vim.cmd [[set list]]
