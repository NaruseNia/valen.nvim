if vim.g.loaded_valen then
  return
end
vim.g.loaded_valen = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "valen",
  callback = function(ev)
    if vim.fn.executable("valen-lsp") ~= 1 then
      return
    end
    local root_dir = vim.fs.root(ev.buf, { "build.gradle", "build.gradle.kts", "settings.gradle", ".git" })
      or vim.fn.getcwd()
    vim.lsp.start({
      name = "valen-lsp",
      cmd = { "valen-lsp" },
      root_dir = root_dir,
      capabilities = vim.lsp.protocol.make_client_capabilities(),
    })
  end,
})
