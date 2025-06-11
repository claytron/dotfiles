set -g status-left-length 32
set -g status-right-length 150

set -g status-fg white
set -g status-bg colour234
set -g pane-border-fg colour244
set -g pane-border-bg colour240
set -g pane-active-border-bg colour136
set -g pane-active-border-fg colour136
set -g message-fg colour244
set -g message-bg colour230
set -g message-attr bold

set -g status-left '#[fg=colour235,bg=colour230,bold] ❐ #S #[fg=colour230,bg=colour238,nobold]⮀#[fg=colour245,bg=colour238,bold] ☯ #P #[fg=colour238,bg=colour234,nobold]⮀'
set -g window-status-format "#[fg=colour234,bg=colour240,nobold]⮀#[fg=colour244,bg=colour240,bold] #W ⮁ #I#F #[fg=colour240,bg=colour234,nobold]⮀"
set -g window-status-current-format "#[fg=colour234,bg=colour33,nobold]⮀#[fg=colour254,bg=colour33,bold] #W ⮁ #I#F #[fg=colour33,bg=colour234,nobold]⮀"
# Show the host name and current date
set -g status-right '#[fg=colour238,bg=colour234,nobold]⮂#[fg=colour245,bg=colour238,bold] #h #[fg=colour230,bg=colour238,nobold]⮂#[fg=colour235,bg=colour230,bold] %d %b %R #[fg=colour238,bg=colour230,nobold]⮂#[fg=colour245,bg=colour238,bold] #(battery_osx.sh) #(wemux status_users)'

set -g window-status-activity-attr bold
