# 1.9 style new window in the same dir
bind c new-window -c '#{pane_current_path}'
bind - split-window -c '#{pane_current_path}'
bind | split-window -h -c '#{pane_current_path}'
