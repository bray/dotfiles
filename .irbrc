#IRB.conf[:PROMPT_MODE] = :DEFAULT
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

require 'rubygems'
require 'wirble'
require 'interactive_editor'

Wirble.init
Wirble.colorize
