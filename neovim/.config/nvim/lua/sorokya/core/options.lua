local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping

opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- include - as part of word
opt.iskeyword:append("-")

-- undo stuff
local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")
opt.undodir = { prefix .. "/nvim/.undo//" }
opt.backupdir = { prefix .. "/nvim/.backup//" }
opt.directory = { prefix .. "/nvim/.swp//" }
opt.undofile = true
