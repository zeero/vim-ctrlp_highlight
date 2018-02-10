" =============================================================================
" File:          plugin/ctrlp_highlight.vim
" Description:   CtrlP extension for highlight.
" =============================================================================

if exists('g:loaded_plugin_ctrlp_highlight') && (! exists('g:ctrlp_highlight#debug') )
  finish
endif
let g:loaded_plugin_ctrlp_highlight = 1

let s:save_cpo = &cpo
set cpo&vim

" Variables

" Commands
command! CtrlPHighlight call ctrlp#init(ctrlp#highlight#id())

" Keymaps


let &cpo = s:save_cpo
unlet s:save_cpo

