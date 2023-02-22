-- import diffview plugin safely
local setup_actions, actions = pcall(require, "diffview.actions")
if not setup_actions then
	return
end

local setup, diffview = pcall(require, "diffview")
if not setup then
	return
end

diffview.setup({
	-- custom config
})
