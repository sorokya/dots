local whichkey = require("which-key")

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>") -- leave insert mode with jk
keymap.set("n", "<ESC>", "<cmd> nohl <cr>", {
  desc = "Clear search highlights",
})

keymap.set("n", "x", '"_x') -- delete without copying to register

whichkey.add({
  { "<leader>s",  group = "Split" },
  { "<leader>sv", "<C-w>v",                              desc = "Split window vertically" },
  { "<leader>sh", "<C-w>s",                              desc = "Split window horizontally" },
  { "<leader>sx", "<cmd> close <cr>",                    desc = "Close active split" },

  { "<leader>g",  group = "Git" },
  { "<leader>gg", "<cmd> Neogit <cr>",                   desc = "Neogit" },
  { "<leader>go", "<cmd> Telescope git_status <cr>",     desc = "Open changed files" },
  { "<leader>gb", "<cmd> Telescope git_branches <cr>",   desc = "Checkout branch" },
  { "<leader>gc", "<cmd> Telescope git_commits <cr>",    desc = "Checkout commit" },

  { "<leader>t",  group = "Tab" },
  { "<leader>to", "<cmd> tabnew <cr>",                   desc = "Open new tab" },
  { "<leader>tx", "<cmd> tabclose <cr>",                 desc = "Close active tab" },
  { "<leader>to", "<cmd> tabn <cr>",                     desc = "Next tab" },
  { "<leader>to", "<cmd> tabp <cr>",                     desc = "Previous tab" },

  { "<leader>e",  "<cmd> NvimTreeToggle <cr>",           desc = "Toggle file tree" },
  { "<leader>E",  "<cmd> NvimTreeFindFile <cr>",         desc = "Toggle file in tree" },

  { "<leader>f",  group = "Find" },
  { "<leader>ff", "<cmd> Telescope find_files <cr>",     desc = "Find files" },
  { "<leader>ft", "<cmd> Telescope live_grep <cr>",      desc = "Find text" },
  { "<leader>fT", "<cmd> Telescope live_grep_args <cr>", desc = "Find files (args)" },
  { "<leader>fl", "<cmd> Telescope resume <cr>",         desc = "Last search" },
  { "<leader>fr", "<cmd> Telescope oldfiles <cr>",       desc = "Recent files" },
  { "<leader>fu", "<cmd> Telescope undo <cr>",           desc = "Undos" },
})
