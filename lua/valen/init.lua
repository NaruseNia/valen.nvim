local M = {}

function M.setup(opts)
  opts = opts or {}
  require("valen.lsp").setup(opts.lsp or {})
end

return M
