require 'awesome_print'

#Pry.config.editor = 'mate -w'

def r; reload! end

# Default print but without pretty print
Pry.config.print = proc do |output, value|
  stringified = begin
    value.inspect
  rescue Pry::RescuableException
    nil
  end

  unless String === stringified
    # Read the class name off of the singleton class to provide a default inspect.
    klass = (class << value; self; end).ancestors.first
    stringified = "#<#{klass}:0x#{value.__id__.to_s(16)}>"
  end

  nonce = rand(0x100000000).to_s(16) # whatever
  colorized = Pry::Helpers::BaseHelpers.colorize_code(stringified.gsub(/#</, "%<#{nonce}"))
  Pry::Helpers::BaseHelpers.stagger_output("=> #{colorized.gsub(/%<(.*?)#{nonce}/, '#<\1')}", output)
end

# Only for Rails < 3.1 ...
ActiveRecord::Base.logger = Logger.new(STDOUT)

