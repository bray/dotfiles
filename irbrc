#IRB.conf[:PROMPT_MODE] = :DEFAULT
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

require 'rubygems'
require 'wirble'
Wirble.init
Wirble.colorize
