vim.opt.guicursor = ""

vim.opt.ruler = true
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = true

vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 2
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250

vim.opt.mouse = "a"

vim.opt.termguicolors = true

-- sync clipboard
vim.opt.clipboard = "unnamedplus"
