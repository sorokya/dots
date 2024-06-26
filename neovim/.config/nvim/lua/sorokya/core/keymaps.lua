local whichkey = require("which-key")

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>") -- leave insert mode with jk
keymap.set("n", "<ESC>", "<cmd> nohl <cr>", {
	desc = "Clear search highlights",
})

keymap.set("n", "x", '"_x') -- delete without copying to register

whichkey.register({
	s = {
		name = "Split",
		v = { "<C-w>v", "Split window vertically" },
		h = { "<C-w>s", "Split window horizontally" },
		x = { "<cmd> close <cr>", "Close active split" },
		m = { "<cmd> MaximizerToggle <cr>", "Maximize active split" },
	},
	g = {
		name = "Git",
		g = { "<cmd> Neogit <cr>", "Neogit" },
		o = { "<cmd> Telescope git_status <cr>", "Open changed files" },
		b = { "<cmd> Telescope git_branches <cr>", "Checkout branch" },
		c = { "<cmd> Telescope git_commits <cr>", "Checkout commit" },
	},
	t = {
		name = "Tab",
		o = { "<cmd> tabnew <cr>", "Open new tab" },
		x = { "<cmd> tabclose <cr>", "Close tab" },
		n = { "<cmd> tabn <cr>", "Next tab" },
		p = { "<cmd> tabp <cr>", "Previous tab" },
	},
	e = { "<cmd> NvimTreeToggle <cr>", "Toggle file tree" },
	E = { "<cmd> NvimTreeFindFile <cr>", "Find file in tree" },
	f = {
		name = "Find",
		b = { "<cmd> Telescope git_branches <cr>", "Checkout branch" },
		f = { "<cmd> Telescope find_files <cr>", "Find files" },
		t = { "<cmd> Telescope live_grep <cr>", "Find text" },
		T = { "<cmd> Telescope live_grep_args <cr>", "Live grep (args)" },
		s = { "<cmd> Telescope grep_string <cr>", "Find string" },
		h = { "<cmd> Telescope help_tags <cr>", "Help" },
		H = { "<cmd> Telescope highlights <cr>", "Highlights" },
		l = { "<cmd> Telescope resume <cr>", "Last search" },
		M = { "<cmd> Telescope man_pages <cr>", "Man pages" },
		r = { "<cmd> Telescope oldfiles <cr>", "Recent file" },
		R = { "<cmd> Telescope registers <cr>", "Registers" },
		k = { "<cmd> Telescope keymaps <cr>", "Keymaps" },
		C = { "<cmd> Telescope commands <cr>", "Commands" },
		u = { "<cmd> Telescope undo <cr>", "Undos" },
	},
}, { prefix = "<leader>" })
