# Turn off the automatic pager
Pry.config.pager = false

# Make the prompt silly.
Pry.config.prompt_name = 'oh no!'

# Hit Enter to repeat last command
Pry::Commands.command(/^$/, 'repeat last command') do
  last_command = Pry.history.to_a.last
  ignored_command = %w(c continue q exit-program quit).include?(last_command)
  _pry_.run_command(last_command) unless ignored_command
end

# Single letter and pdb like aliases
if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'return', 'finish'
  Pry.commands.alias_command 'r', 'finish'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'l', 'whereami'
  Pry.commands.alias_command 'list', 'whereami'
  Pry.commands.alias_command 'q', 'exit-program'
  Pry.commands.alias_command 'quit', 'exit-program'
end

# Load rails files if present
Rails.application.eager_load! if defined?(Rails)
