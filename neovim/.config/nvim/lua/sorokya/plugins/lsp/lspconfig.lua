-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

-- import whichkey plugin safely
local status, whichkey = pcall(require, "which-key")
if not status then
	return
end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	whichkey.register({
		l = {
			name = "LSP",
			a = { "<cmd> lua vim.lsp.buf.code_action() <cr>", "Show available code actions" },
			r = { "<cmd> lua vim.lsp.buf.rename() <cr>", "Smart rename" },
			d = { "<cmd> lua vim.diagnostics.open_float() <cr>", "Show diagnostics for line" },
		},
	}, { prefix = "<leader>", buffer = bufnr })

	whichkey.register({
		g = {
			d = { "<cmd> lua vim.lsp.buf.declaration() <cr>", "Go to declaration" },
			i = { "<cmd> lua vim.lsp.buf.implementation() <cr>", "Go to implementation" },
			r = { "<cmd> lua vim.lsp.buf.references() <cr>", "Go to references" },
		},
		K = { "<cmd> lua vim.lsp.buf.hover() <cr>", "Show documentation for what is under cursor" },
	}, { buffer = bufnr })
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- configure rust server
lspconfig["rust_analyzer"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		checkOnSave = {
			command = "clippy",
		},
	},
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
