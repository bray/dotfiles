Pry.config.history_file = ".pry_history"

def r; reload! end
Pry.config.pager = false

def cp(string)
  Clipboard.copy string
end

def copy_token(user)
  Clipboard.copy user.api_client.user_token
end

def pbcopy(input)
  str = input.to_s
  IO.popen('pbcopy', 'w') { |f| f << str }
  str
end

def puts_last(lines_count)
  puts Readline::HISTORY.entries[(-2 - lines_count + 1)..-2].join("\n")
end
alias print_last puts_last

# Change pry syntax highlighting colors
CodeRay.scan("example", :ruby).term # just to load necessary files

TERM_TOKEN_COLORS = {
  string: {
    #self: "\e[0;91m",
    self: "\e[1;31m",
    modifier: "\e[1;31m",
    char: "\e[1;35m",
    delimiter: "\e[1;31m",
    escape: "\e[1;31m",
  }
}

module CodeRay
  module Encoders
    class Terminal < Encoder
      # override old colors
      TERM_TOKEN_COLORS.each_pair do |key, value|
        TOKEN_COLORS[key] = value
      end
    end
  end
end
