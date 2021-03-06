let s:save_cpo = &cpo
set cpo&vim

if exists('g:loaded_neocomplete_json_schema')
  finish
endif
let g:loaded_neocomplete_json_schema = 1

augroup NeoCompleteJsonSchema
  autocmd!
  autocmd BufRead,BufNewFile *.json
        \ if getline(1) . getline(2) =~# '\$schema'
        \   | call neocomplete#sources#json_schema#helper#init()
        \   | endif
augroup END

if !exists('g:neocomplete#json_schema_work_dir')
  let g:neocomplete#json_schema_work_dir = $HOME . '/.neocomplete-json-schema'
endif

if !exists('g:neocomplete#json_schema_directory')
  let g:neocomplete#json_schema_directory = 'schema'
endif

let &cpo = s:save_cpo
unlet s:save_cpo
