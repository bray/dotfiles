vim.cmd([[
  function! CopilotAcceptOneWord()
      let suggestion = copilot#Accept("")
      let bar = copilot#TextQueuedForInsertion()
      echo suggestion
      echo bar
      return split(bar, '[ .]\zs')[0]
  endfunction

  imap <expr> <C-l> CopilotAcceptOneWord()
]])
