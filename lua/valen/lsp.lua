local M = {}

local default_config = {
  cmd = { "valen-lsp" },
  filetypes = { "valen" },
  root_markers = { "build.gradle", "build.gradle.kts", "settings.gradle", ".git" },
  settings = {},
}

function M.setup(opts)
  opts = opts or {}
  local config = vim.tbl_deep_extend("force", default_config, opts)

  if vim.fn.executable(config.cmd[1]) ~= 1 then
    vim.notify(
      "[valen.nvim] `" .. config.cmd[1] .. "` not found in PATH. Build with: cargo build --release -p valen-lsp",
      vim.log.levels.WARN
    )
  end

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "valen",
    callback = function(ev)
      local root_dir = vim.fs.root(ev.buf, config.root_markers) or vim.fn.getcwd()
      vim.lsp.start({
        name = "valen-lsp",
        cmd = config.cmd,
        root_dir = root_dir,
        settings = config.settings,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      })
    end,
  })
end

return M
