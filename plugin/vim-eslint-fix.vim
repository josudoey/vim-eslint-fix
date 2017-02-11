" check whether this script is already loaded
if exists('g:loaded_ESLintFix')
  finish
endif

let g:loaded_ESLintFix = 1

" temporary file for content
if !exists('g:tmp_file_ESLintFix')
  let g:tmp_file_ESLintFix = fnameescape(tempname())
endif

function! ESLintFix()
  let engine='eslint'
  if !executable(engine)
    " Executable bin doesn't exist
    echoerr 'The '.engine.' is not executable!'
    return 1
  endif

  let pos = getpos(".")
  let line1 = '1'
  let line2 = '$'
  let content = getline('0','$')
  call writefile(content, g:tmp_file_ESLintFix)
  let result = system(engine." --fix ".g:tmp_file_ESLintFix)
  let lines_ESLintFix = readfile(g:tmp_file_ESLintFix)
  silent exec line1.",".line2."j"
  call setline(line1, lines_ESLintFix[0])
  call append(line1, lines_ESLintFix[1:])
  call cursor(pos[1], pos[2])
endfunction
