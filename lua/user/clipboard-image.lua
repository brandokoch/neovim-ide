local clipboard_status_ok, clipboard = pcall(require, "clipboard-image")
if not clipboard_status_ok then
	return
end

clipboard.setup {
  -- Default configuration for all filetype
  default = {
    img_dir = "images",
    img_name = function()
        vim.fn.inputsave()
        local name = vim.fn.input("Name: ")
        vim.fn.inputrestore()
        return name
      end,
  },
  -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
  -- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
  -- Missing options from `markdown` field will be replaced by options from `default` field
  markdown = {
    img_dir = "img", -- Use table for nested dir (New feature form PR #20)
    img_dir_txt = "img",
    img_handler = function(img) -- New feature from PR #22
      local script = string.format('./image_compressor.sh "%s"', img.path)
      os.execute(script)
    end,
  }
}
