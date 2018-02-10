# vim-ctrlp_highlight
CtrlP Extension for highlight.

## Install
You should use package manager.

[dein.vim](https://github.com/Shougo/dein.vim):
```dein.toml
[[plugin]]
repo = 'zeero/vim-ctrlp_highlight'
lazy = 1
on_cmd = ['CtrlPHighlight']
depends = ['ctrlp.vim']
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

