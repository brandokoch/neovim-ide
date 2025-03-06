-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }


--Remap space as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","

-- Modes
--   normal_mode = "n", insert_mode = "i", visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Remap save and quit 
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>i",":lua require'clipboard-image.paste'.paste_img()<CR>")

-- Replace operations
keymap("n", "<S-s>", ":%s//g<left><left>", opts) -- Start replace pattern
-- keymap("n", "<C-r", "")


-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Fzf and RipGrep
keymap("n", "<leader>p", ":FzfLua files<CR>", opts) -- Searches files while matching path
keymap("n", "<leader>f", ":FzfLua grep_project --hidden<CR>", opts) -- Searches text while matching text
keymap("n", "<leader>v", ":FzfLua grep_visual<CR>", opts) -- Searches text while matching path and text
keymap("n", "<leader>a", ":lua require'fzf-lua'.fzf_exec('rga .', {prompt = 'RGA> ', actions = { ['default'] = require'fzf-lua'.actions.file_edit}})<CR>")

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dk", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.run_to_cursor()<cr>", opts)
keymap("n", "<leader>dv", "<cmd>lua require'dap.ui.widgets'.hover()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>da", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

function load_config_and_continue()
	if vim.fn.filereadable('./launch.json') then
		require('dap.ext.vscode').load_launchjs('./launch.json')
	end
	require('dap').continue()
end

keymap("n", "<leader>dd", "<cmd> lua load_config_and_continue() <cr>")

-- Markdown
keymap("n", "<C-p>", ":MarkdownPreviewToggle<CR>", opts)

-- Window maximizer (useful in debugging UI)
keymap("n", "<leader>m",":MaximizerToggle!<CR>",opts)

-- Image pasting from clipboard
keymap("n", "<leader>i",":lua require'clipboard-image.paste'.paste_img()")
