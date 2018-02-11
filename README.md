# vim-ctrlp_highlight
CtrlP Extension for highlight.

## Install
Install with package manager.

[dein.vim](https://github.com/Shougo/dein.vim):
```dein.toml
[[plugin]]
repo = 'zeero/vim-ctrlp_highlight'
depends = ['ctrlp.vim']
lazy = 1
on_cmd = ['CtrlPHighlight']
```

## Usage
```
:CtrlPHighlight
```
This plugin shows list of vim 'highlight' definitions.
After ctrlp select, highlight name will be appended in current buffer.

If may add keymap into your vimrc like below:
```
nnoremap <leader>t :<C-u>CtrlPHighlight<CR>
```

