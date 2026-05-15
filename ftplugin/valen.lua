vim.bo.commentstring = "// %s"
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.expandtab = true
vim.bo.softtabstop = 4

-- Auto-indent: increase after { and decrease after }
vim.bo.cindent = false
vim.bo.smartindent = true
vim.bo.indentexpr = "v:lua.require'valen.indent'.get_indent()"
vim.b.did_indent = true
