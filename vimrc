" TIPS for Keeping your Vim Configuration File Clean 
"
" (Hacking Vim, pp.214, Appendix B) (Kim Schultz) 

" TIP #1 (Always have VIM in no-compatible mode)
" Opens up a lot of features in Vim that other tips and
" scripts may take advantage of.
set nocompatible 

" TIP #2 (Use Comments)
" Add description, source, author to the things you add.
" It is more likely you can trace back all your code.

" TIP #3 & #4 (Group Data) (Use multiple files)
" General system-wide setup, Key mappings for your own macros,
" Script-specific  settings ordered per script,
" 'Playground' with all the script snippets and 
" " macros you find and test.
" e.g. source $HOME/.vim/mappings.vim for key mappings

" TIP #5 (Use other files for tests)
" In order to test a new functionality or macro is better to use another
" file  and source it. If you like it you can move it to your vim
" configuration file
" (or other  setting file) and if not just delete it.

" GENERAL SYSTEM-WIDE SETUP
" Show Line numbers
set number
" Turn on syntax highlighting
syntax on
" Auto-indentation
set autoindent 
" A good color scheme and background
colorscheme default
set background=dark
" Creation of a backup file whenever an opened file is 
" altered and saved through Vim.
set nobackup
" Tell vim how many columns a tab counts for
set tabstop=4 
set et
set sw=4
set smarttab
" Live search and the cursor will start jumping through 
" the file as you type
set incsearch
" A more visual cursor (line & column)
set cursorline
set cursorcolumn
" Set spell check
setlocal spell spelllang=en_us,es
" Attempt to determine the type of a file based on its name and possible
" its contents
filetype plugin on
" Also for automatic indentation for a file based on its name
filetype indent on
" Wrap lines
set textwidth=80

" -----------------------------------------------------------------------------
"  TABLINE SETUP (pp. 42 Hacking Vim)
function! ShortTabLine()
    let ret = ''
    for i in range(tabpagenr('$'))
  "Select the color group for highlighting active tab
  if i + 1 == tabpagenr()
      let ret .= '%#errorMsg#'
  else
      let ret .= '%#TabLine#'
  endif

  "Find the buffername for the tablabel
  let buflist = tabpagebuflist(i+1)
  let winnr = tabpagewinnr(i+1)
  let buffername = bufname(buflist[winnr - 1])
  let filename = fnamemodify(buffername, ':t')
  "Check if there is no name
  if filename == ''
      let filename = 'noname'
  endif
  if strlen(filename) >= 8
      let ret .= '['.filename[0:4].'..]'
  else
      let ret .= '['.filename.']'
  endif
    endfor

    "After the last tab fill with TabLineFill and reset tab page #
    let ret .= '%#TabLineFill#%T'
    return ret
endfunction

set tabline=%!ShortTabLine()

" -----------------------------------------------------------------------------

" KEY MAPPINGS FOR YOUR OWN MACROS 
"source $HOME/.vim/mappings.vim
" MATCHING COMMANDS (you still have :match free)
" Please, note lines more than 80 characters.
" (Hacking Vim, pp.33, Example 1, Kim Schulz)
2match ErrorMsg /\%>80v.\+/
" Better use tabs only to indent code (very useful for programming)
" (Hacking Vim, pp.33, Example 2, Kim Schulz)
3match ErrorMsg /[^\t]\zs\t\+/
"END MATCHING COMMANDS

" STATUS LINE
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ 
\[TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ 
\[POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2


" Avoid tabs when copy/paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" ,mh apply Octave header
nmap ,oh :.!~/Documents/QBITO/PythonScripts/OctaveHeader.py
vmap ,oh !~/Documents/QBITO/PythonScripts/OctaveHeader.py
" .m files are "octave" files
augroup filetypedetect
	au! BufRead,BufNewFile *.m, set filetype=matlab
augroup END

" F5 executes the octave script you are editing
autocmd FileType matlab  map <buffer> <f5> :!octave -q %<cr>
" Bind <f2> key to running the python interpreter on the currently active
" file.  (courtesy of Steve Howell from email dated 1 Feb 2006).
" " The second line binds <f3> to running python3 on a GNU/Linux system,
" " like Ubuntu or Fedora, that use python3 to launch Python 3.
 map <f2> :w\|!python %<cr>
 map <f3> :w\|!python3 %<cr>
"
 map <f6> :w\|!racket %<cr>

" SCRIPT-SPECIFIC SETTINGS ORDERED PER SCRIPT
"source $HOME/.vim/script_settings.vim

"Begin of LATEX-SUITE configuration
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
" filetype plugin on (already done before)
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: This enables automatic indentation as you type.
" filetype indent on (already done before)
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files
" defaults  to  'plaintex' instead of 'tex', which results in vim-latex 
" not being loaded. The following changes the default filetype back to
" 'tex':
let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_UseMakefile=0
let g:Tex_CompileRule_pdf='pdflatex -shell-escape 
						\-interaction=nonstopmode 
						\-file-line-error-style $*'
let g:Tex_ViewRule_pdf='zathura'
"End of LATEX-SUITE configuration
"  'PLAYGROUND' WITH ALL THE SCRIPT SNIPPETS AND MACROS YOU FIND AND TEST and if
"  you like it put it here!
source $HOME/.vim/playground.vim 

