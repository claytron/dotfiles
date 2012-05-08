set -g status-left-length 32
set -g status-right-length 150

set -g status-fg white
set -g status-bg colour234
set -g window-status-activity-attr bold
set -g pane-border-fg colour244
set -g pane-border-bg colour240
set -g pane-active-border-bg colour136
set -g pane-active-border-fg colour136
set -g message-fg colour244
set -g message-bg colour230
set -g message-attr bold

set -g status-left '#[fg=colour235,bg=colour230,bold] ❐ #S #[fg=colour230,bg=colour238,nobold]⮀#[fg=colour245,bg=colour238,bold] #I #[fg=colour238,bg=colour234,nobold]⮀#[fg=colour230,bg=colour234,nobold] #P'
set -g window-status-format "#[fg=colour234,bg=colour240]⮀#[fg=colour230,bg=colour240] #I #W #[fg=colour240,bg=colour234]⮀"
set -g window-status-current-format "#[fg=colour234,bg=colour33]⮀#[fg=colour254,bg=colour33,noreverse,bold] #I ⮁ #W #[fg=colour33,bg=colour234,nobold]⮀"
# Show the host name and current date
set -g status-right '#[fg=colour238,bg=colour234]⮂#[fg=colour245,bg=colour238] #h #[fg=colour230,bg=colour238]⮂#[fg=colour235,bg=colour230] %d %b %R #(wemux status_users)'
