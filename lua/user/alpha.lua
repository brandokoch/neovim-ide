local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  [[NeoVim]],
}
dashboard.section.buttons.val = {
  dashboard.button("p", " " .. " Find file", ":FzfLua files<CR>"),
  dashboard.button("e", " " .. " Open Explorer", ":NvimTreeToggle<CR>"),
  dashboard.button("f", " " .. " Find text", ":FzfLua grep_project<CR>"),
  dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}
local function footer()
  return "Brando Koch"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
