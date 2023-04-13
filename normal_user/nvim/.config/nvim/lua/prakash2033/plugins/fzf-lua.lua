-- import fzf-lua plugin safely
local setup, fzf_lua = pcall(require, "fzf-lua")
if not setup then
  return
end

-- enable fzf-lua
fzf_lua.setup({
  winopts = {
    hl = { border = "FloatBorder" },
  },
})
