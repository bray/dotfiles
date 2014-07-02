def r; reload! end
Pry.config.pager = false

def cp(string)
  Clipboard.copy string
end

def copy_token(user)
  Clipboard.copy user.api_client.user_token
end

def puts_last(lines_count)
  puts Readline::HISTORY.entries[(-2 - lines_count + 1)..-2].join("\n")
end
alias print_last puts_last
