# Set fish as the default shell
set-option -g default-shell /bin/fish

set-window-option -g mode-keys vi # vim-style movement
# in normal tmux mode
bind Escape copy-mode # `tmux prefix + Escape` starts copy mode.
bind p paste-buffer # `prefix + p` pastes the latest buffer

# in copy mode…
# bind -t vi-copy v begin-selection # `v` begins a selection. (movement keys to select the desired bits)
# bind -t vi-copy y copy-selection # `y` copies the current selection to one of tmux's "paste buffers"
# bind -t vi-copy V rectangle-toggle # `V` changes between line- and columnwise selection

# bind -t vi-copy Y copy-end-of-line # ^1
# bind + delete-buffer


# Always renumber windows, so indexes remain sequential
set-option -g renumber-windows on

# Start counting panes from 1
set-window-option -g pane-base-index 1

# Define the left part of the status bar as an empty character for better readability
set -g status-left " "

# Define the right part of the status bar as session hostname time.
set -g status-right-length 100
set -g status-right '#[fg=#eee8d5]#S #[fg=#268bd2]#h #[fg=#839496]%d.%m.%y #[fg=#eee8d5]%H:%M '']'
