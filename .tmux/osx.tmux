# Set up the default shell so that we can use pb{copy,paste}
set-option -g default-command "reattach-to-user-namespace -l zsh"

# Bind ctrl-v to paste
bind C-v run "reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer"
