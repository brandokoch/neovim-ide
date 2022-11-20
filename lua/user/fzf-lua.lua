local status_ok, fzflua= pcall(require, "fzf-lua")
if not status_ok then
  return
end

local actions = require "fzf-lua.actions"

fzflua.setup({
  on_create = function()
      local tnoremap = function(lhs, rhs)
          vim.api.nvim_buf_set_keymap(0, "t", lhs, rhs, { silent = true, noremap = true })
      end

      print("on_create")
      tnoremap("<c-j>", "<down>")
      tnoremap("<c-k>", "<up>")
  end,
})
