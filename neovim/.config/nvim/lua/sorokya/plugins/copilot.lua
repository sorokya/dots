-- import copilot plugin safely
local setup_copilot, copilot = pcall(require, "copilot")
if not setup_copilot then
	return
end

local setup_copilot_cmp, copilot_cmp = pcall(require, "copilot_cmp")
if not setup_copilot_cmp then
	return
end

copilot.setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})

copilot_cmp.setup()
