## Installation

using `packer.nvim`:
```lua
use 'crispybaccoon/sayama.nvim'
```

using `lazy.nvim`:
```lua
{ 'crispybaccoon/sayama.nvim',
    config = function()
        require 'sayama'.setup {
            dir = '~/.snippets' -- defaults to ~/.sayama
        }
    end
},
```

## Usage

### `sayama.save { filetype, name, ext }`

save currently (visually) selected text to a snippet file.
the path extends to `.../{filetype}/{name}.{ext}`.

