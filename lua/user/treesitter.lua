local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
	return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
  ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python" }, -- put the language you want in this array
  -- ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  
  highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},

})

-- Neovim 0.12 passes directive handlers a LIST of nodes per capture, while
-- nvim-treesitter master (supports 0.10/0.11 only) still expects one node, so
-- every fenced code block in markdown errored with "attempt to call method 'range'".
-- These overrides accept both shapes. Remove once nvim-treesitter is moved to
-- its `main` branch (the rewrite that supports 0.12).
local function first_node(match, capture_id)
	local nodes = match[capture_id]
	if type(nodes) == "table" and nodes.range == nil then
		return nodes[#nodes]
	end
	return nodes
end

vim.treesitter.query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
	local node = first_node(match, pred[2])
	if not node then
		return
	end
	local alias = vim.treesitter.get_node_text(node, bufnr):lower()
	metadata["injection.language"] = vim.treesitter.language.get_lang(alias) or alias
end, { force = true, all = true })

vim.treesitter.query.add_directive("downcase!", function(match, _, bufnr, pred, metadata)
	local id = pred[2]
	local node = first_node(match, id)
	if not node then
		return
	end
	local text = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[id] }) or ""
	if not metadata[id] then
		metadata[id] = {}
	end
	metadata[id].text = string.lower(text)
end, { force = true, all = true })
