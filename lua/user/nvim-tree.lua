local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

-- Mappings are set per-buffer via on_attach now; view.mappings and
-- nvim-tree.config.nvim_tree_callback were both removed upstream.
local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.map.on_attach.default(bufnr)

  vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "o", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
  vim.keymap.set("n", "v", api.node.open.vertical, opts "Open: Vertical Split")
end

nvim_tree.setup {
  on_attach = on_attach,
  update_focused_file = {
    enable = true,
    update_root = true, -- was update_cwd; set false if you do not want dirs changed
  },
  renderer = {
    root_folder_label = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  filters = {
    git_ignored = false, -- was git.ignore = false
  },
  git = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
  },
}
