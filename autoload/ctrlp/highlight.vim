" =============================================================================
" File:          autoload/ctrlp/highlight.vim
" Description:   CtrlP extension for highlight.
" =============================================================================

" To load this extension into ctrlp, add this to your vimrc:
"
"     let g:ctrlp_extensions = ['highlight']
"
" Where 'highlight' is the name of the file 'highlight.vim'
"
" For multiple extensions:
"
"     let g:ctrlp_extensions = [
"         \ 'my_extension',
"         \ 'my_other_extension',
"         \ ]

" Load guard
if ( exists('g:loaded_ctrlp_highlight') && (! exists('g:ctrlp_highlight#debug') ) )
  \ || v:version < 700 || &cp
  finish
endif
let g:loaded_ctrlp_highlight = 1


" Add this extension's settings to g:ctrlp_ext_vars
"
" Required:
"
" + init: the name of the input function including the brackets and any
"         arguments
"
" + accept: the name of the action function (only the name)
"
" + lname & sname: the long and short names to use for the statusline
"
" + type: the matching type
"   - line : match full line
"   - path : match full line like a file or a directory path
"   - tabs : match until first tab character
"   - tabe : match until last tab character
"
" Optional:
"
" + enter: the name of the function to be called before starting ctrlp
"
" + exit: the name of the function to be called after closing ctrlp
"
" + opts: the name of the option handling function called when initialize
"
" + sort: disable sorting (enabled by default when omitted)
"
" + specinput: enable special inputs '..' and '@cd' (disabled by default)
"
call add(g:ctrlp_ext_vars, {
\ 'init': 'ctrlp#highlight#init()',
\ 'accept': 'ctrlp#highlight#accept',
\ 'lname': 'highlight',
\ 'sname': 'hi',
\ 'type': 'line',
\ 'enter': 'ctrlp#highlight#enter()',
\ 'exit': 'ctrlp#highlight#exit()',
\ 'opts': 'ctrlp#highlight#opts()',
\ 'sort': 0,
\ 'specinput': 0,
\})


" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#highlight#init()
  redir => output
  silent! highlight
  redir END
  let highlights = split(output, "\n")

  for highlight in highlights
    let highname = get(split(highlight), 0, '')
    execute "syn match " . highname . " '" . highname . "\\s*\\zsxxx'"
  endfor

  let words = ['term=', 'start=', 'stop=', 'cterm=', 'ctermfg=', 'ctermbg=', 'gui=', 'font=', 'guifg=', 'guibg=', 'guisp=']
  for word in words
    let highname = get(split(highlight), 0, '')
    execute "syn match Keyword '" . word . "'"
  endfor

  return highlights
endfunction


" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#highlight#accept(mode, str)
  call ctrlp#exit()
  execute 'normal! a' . get(split(a:str), 0)
endfunction


" (optional) Do something before enterting ctrlp
function! ctrlp#highlight#enter()
endfunction


" (optional) Do something after exiting ctrlp
function! ctrlp#highlight#exit()
endfunction


" (optional) Set or check for user options specific to this extension
function! ctrlp#highlight#opts()
endfunction


" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#highlight#id()
  return s:id
endfunction

