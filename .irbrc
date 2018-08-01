#IRB.conf[:PROMPT_MODE] = :DEFAULT
IRB.conf[:PROMPT_MODE] = :SIMPLE
#IRB.conf[:AUTO_INDENT] = true


# For non-pry apps
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 1000


require 'rubygems'
require 'wirble'
require 'interactive_editor'

Wirble.init
Wirble.colorize
