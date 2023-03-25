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

### `sayama.save`

save currently (visually) selected text to a snippet file.
the path defaults to `.../{filetype}/{name}.{ext}`.

