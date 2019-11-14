# vim FTW
Pry.config.editor = "nvim"

# My pry is polite
# Pry.hooks = { :after_session => proc { puts "bye-bye" } }

# Prompt with ruby version
# Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]


begin
  Pry.commands.alias_command 'w', 'whereami'
  Pry::Commands.command(/^$/, "clear screen and show current place") do
    _pry_.run_command '.clear'
    _pry_.run_command 'whereami'
  end
rescue
end

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# loading rails configuration if it is running as a rails console
#load File.dirname(__FILE__) + '/.railsrc' if defined?(Rails) && Rails.env
