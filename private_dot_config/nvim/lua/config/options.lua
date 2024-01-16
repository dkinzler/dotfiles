vim.opt.autowrite = true -- Automatically write when changing buffers and other events
vim.opt.confirm = true   -- Confirm to save changes e.g. when trying to exit buffer with unsaved buffer, would otherwise just fail
vim.opt.mouse = "a"      -- Enable mouse support
vim.opt.backup = false
vim.opt.undofile = true  -- Save undo history to file
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.timeoutlen = 500 -- How long to wait for mapped sequence to complete in ms, default 1000
vim.opt.updatetime = 250 -- If nothing is typed for this many ms, swap file will be written to disk
vim.opt.spelllang = { "en", "de" }

vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.opt.ruler = true
vim.opt.number = true                        -- Print line numbers
vim.opt.relativenumber = true
vim.opt.wrap = false                         -- Don't wrap lines longer than width of window
vim.opt.scrolloff = 4                        -- Min number of lines above/below cursor
vim.opt.showmode = false                     -- Don't show extra line with mode, already in status bar
vim.opt.cmdheight = 1                        -- Hide command line
vim.opt.signcolumn = "yes"
vim.opt.completeopt = "menu,menuone,preview" -- Options for insert mode completion
vim.opt.splitbelow = true                    -- Put new window below current
vim.opt.splitright = true                    -- Put new window right of current
vim.opt.ignorecase = true                    -- Ignore case in search patterns
vim.opt.smartcase = true                     -- Don't ignore case if serach pattern contains upper case characters
vim.opt.inccommand = "nosplit"               -- Preview incremental substitute
vim.opt.hlsearch = false
vim.opt.incsearch = true                     -- Highlight first match so far

vim.opt.expandtab = true                     -- Replace tabs with spaces, also applies to indent commands
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.shiftwidth = 4 -- Number of spaces for indents

vim.g.netrw_banner = 0

-- Other options
-- vim.opt.cursorline = true -- Highlight current line
-- vim.opt.pumblend = 10 -- Transparent popups
