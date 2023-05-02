nnoremap <leader>T <esc>:call RunTestFile()<cr>
nnoremap <leader>t <esc>:call RunTestFileFilteredByLine()<cr>
nnoremap <leader>at <esc>:call RunAllTests()<cr>

function! RubocopFixCs(target)
  let options=''
  let cmd = 'bundle exec rubocop'

  if filereadable('./bin/bundle')
    let cmd = './bin/bundle exec rubocop'
  endif

  if filereadable('.rubocop.yml')
    let options = ' --config=.rubocop.yml '
  endif

  let full_command = cmd . " -A " . options . a:target
  call ClearEchoAndExecute(full_command)
endfunction

function! RunTestFileFilteredByLine()
  let command = "run_test " . expand('%') . " --line=" . line(".")
  call ClearEchoAndExecute(command)
endfunction

function! RunTestFile()
  let command = "run_test " . expand('%')
  call ClearEchoAndExecute(command)
endfunction

function! RunAllTests()
  let command = "run_test " . expand('%') . " --all"
  call ClearEchoAndExecute(command)
endfunction
