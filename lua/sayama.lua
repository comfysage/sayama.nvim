local util = require 'sayama.util'

local M = {}

_G.sayama_dir = _G.sayama_dir or os.getenv('HOME') .. '/.sayama'

function M.setup(config)
  if config.dir then
    _G.sayama_dir = config.dir
  end
end

---@param props { filetype: string, name: string, ext: string }
function M.save(props)
  -- get filetype of current buffer [ api ] -> *location*
  local filetype = props.filetype or util.get_filetype()
  local ext = props.ext or util.get_file_extension()
  if ext == nil then
    vim.ui.input({ prompt = 'Specify file extension: ' }, function (c)
     ext = c
    end)
  end
  -- get selected text in buffer [ api ] -> *code*
  local buf_content = util.get_selection()
  -- get name for code example [ input ] -> *name*
  local name = props.name or nil
  if name == nil then
    vim.ui.input({ prompt = 'Specify snippet name: ' }, function (c)
      name = c
    end)
  end
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
