-- import whichkey plugin safely
local status, whichkey = pcall(require, "which-key")
if not status then
	return
end

vim.o.timeout = true
vim.o.timeoutlen = 300

whichkey.setup({})
