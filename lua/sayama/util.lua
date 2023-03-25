local util = {}

function util.get_filetype()
  return vim.filetype.match { buf = 0 }
end

function util.get_file_extension()
  local path = vim.api.nvim_buf_get_name(0)
  local split_path = vim.split(path, '/')
  local base_name = split_path[#split_path]
  local split_name = vim.split(base_name, '.', { plain = true })
  if #split_name < 2 then
    return nil
  end
  return split_name[#split_name]
end

function util.get_selection()
  local vstart = vim.fn.getpos("'<")
  local vend = vim.fn.getpos("'>")

  local line_start = vstart[2]
  local line_end = vend[2]

  local lines = vim.fn.getline(line_start, line_end)
  return lines
end

function util.root()
  return _G.sayama_dir
end

function util.write_file(props)
  local path, content = props[1], props[2]
  local ok, result = pcall(vim.fn.writefile, content, path)

  return { ok, result or false }
end

return util
