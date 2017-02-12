## vim-jsbeautify

## Installing using Vim Plugin Manager


1. Add this line to your `.vimrc`:

  ```vim
Plugin 'maksimr/vim-jsbeautify'
  ```

2. Call `PlugInstall()` inside vim:

  ```vim
:PlugInstall
  ```

## Usage

```vima
".vimrc
function! PrettyFile()
  if &filetype=="javascript"
    if exists('g:loaded_Beautifier')
      call JsBeautify()
    endif
    if exists('g:loaded_ESLintFix')
      call ESLintFix()
    endif
  end
endfunction

"pretty the file before saving.
autocmd BufWritePre * execute 'call PrettyFile()'
```vim