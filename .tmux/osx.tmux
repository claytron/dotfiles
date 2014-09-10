# Set up the default shell so that we can use pb{copy,paste}
set-option -g default-command "reattach-to-user-namespace -l zsh"

# Automagically copy to the os x clipboard
bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"
