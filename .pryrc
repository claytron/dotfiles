# Turn off the automatic pager
Pry.config.pager = false

# Make the prompt silly.
Pry.config.prompt_name = 'oh no!'

# Hit Enter to repeat last command
Pry::Commands.command(/^$/, "repeat last command") do
  _pry_.run_command Pry.history.to_a.last
end
