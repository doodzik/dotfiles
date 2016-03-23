" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

function! SelectaFile(path)
  " TODO ignore paths with .gitignore file
  " TODO check if locate is faster
  call SelectaCommand("find " . a:path . "/* -type f -not -path '~/Library/*' -not -path './node_modules/*' -not -path './lib/*' -not -path './public/assets/*'", "", ":e")
endfunction
