local M = {}

function M.get_indent()
  local lnum = vim.v.lnum
  if lnum <= 1 then
    return 0
  end

  local sw = vim.bo.shiftwidth
  local prev_lnum = lnum - 1

  -- Find previous non-blank line
  while prev_lnum > 0 and vim.fn.getline(prev_lnum):match("^%s*$") do
    prev_lnum = prev_lnum - 1
  end
  if prev_lnum == 0 then
    return 0
  end

  local prev_line = vim.fn.getline(prev_lnum)
  local prev_indent = vim.fn.indent(prev_lnum)
  local cur_line = vim.fn.getline(lnum)

  local indent = prev_indent

  -- Increase indent after lines ending with { or (
  if prev_line:match("[{(]%s*$") then
    indent = indent + sw
  end

  -- Increase after -> { pattern (match arms)
  if prev_line:match("=>%s*$") then
    indent = indent + sw
  end

  -- Decrease indent for lines starting with } or )
  if cur_line:match("^%s*[})]") then
    indent = indent - sw
  end

  if indent < 0 then
    indent = 0
  end

  return indent
end

return M
