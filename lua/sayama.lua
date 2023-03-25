local util = require 'sayama.util'

local M = {}

_G.sayama_dir = _G.sayama_dir or os.getenv('HOME') .. '/.sayama'

function M.setup(config)
  if config.dir then
    _G.sayama_dir = config.dir
  end
end

function M.save(_)
  -- get filetype of current buffer [ api ] -> *location*
  local filetype = util.get_filetype()
  local ext = util.get_file_extension()
  if ext == nil then
    vim.ui.input({ prompt = 'Specify file extension: ' }, function (c)
     ext = c
    end)
  end
  -- get selected text in buffer [ api ] -> *code*
  local buf_content = util.get_selection()
  -- get name for code example [ input ] -> *name*
  local name = ""
  vim.ui.input({ prompt = 'Specify snippet name: ' }, function (c)
    name = c
  end)
  -- save file with *name* in *location*
  local base_name = vim.fn.join({ name, ext }, '.')
  local ft_path = vim.fn.join({ util.root(), filetype }, '/')
  if not (vim.fn.isdirectory(ft_path) == 1) then
    vim.fn.mkdir(ft_path, 'p')
  end
  local path = vim.fn.join({ ft_path, base_name }, '/')
  util.write_file { path, buf_content }
end

return M
