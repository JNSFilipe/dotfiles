#################################################################################################
######################################### CONFIGURATION #########################################
#################################################################################################

# Configurations heavily inspired by https://github.com/gpakosz/.tmux

# -- general -------------------------------------------------------------------

set -g default-terminal "screen-256color"
if 'infocmp -x tmux-256color > /dev/null 2>&1' 'set -g default-terminal "tmux-256color"'

# Set fish as default shell
set-option -g default-shell /usr/bin/fish

setw -g xterm-keys on
set -s escape-time 10                     # faster command sequences
set -sg repeat-time 600                   # increase repeat timeout
set -s focus-events on

set -g prefix2 C-a                        # GNU-Screen compatible prefix
bind C-a send-prefix -2

set -q -g status-utf8 on                  # expect UTF-8 (tmux < 2.2)
setw -q -g utf8 on

set -g history-limit 5000                 # boost history

# edit configuration
bind e new-window -n "~/.tmux.conf.local" "EDITOR=\${EDITOR//mvim/vim} && EDITOR=\${EDITOR//gvim/vim} && \${EDITOR:-vim} ~/.tmux.conf.local && tmux source ~/.tmux.conf && tmux display \"~/.tmux.conf sourced\""

# reload configuration
bind r source-file ~/.tmux.conf \; display '~/.tmux.conf sourced'

# -- navigation ----------------------------------------------------------------

# create session
bind C-c new-session

# find session
bind C-f command-prompt -p find-session 'switch-client -t %%'

# session navigation
bind BTab switch-client -l  # move to last session

# split current window horizontally
bind - split-window -v
# split current window vertically
bind _ split-window -h

# pane navigation
bind -r h select-pane -L  # move left
bind -r j select-pane -D  # move down
bind -r k select-pane -U  # move up
bind -r l select-pane -R  # move right
bind > swap-pane -D       # swap current pane with the next one
bind < swap-pane -U       # swap current pane with the previous one

# maximize current pane
bind + run 'cut -c3- ~/.tmux.conf | sh -s _maximize_pane "#{session_name}" #D'

# pane resizing
bind -r H resize-pane -L 2
bind -r J resize-pane -D 2
bind -r K resize-pane -U 2
bind -r L resize-pane -R 2

# window navigation
unbind n
unbind p
bind -r C-h previous-window # select previous window
bind -r C-l next-window     # select next window
bind Tab last-window        # move to last active window

# toggle mouse
bind m run "cut -c3- ~/.tmux.conf | sh -s _toggle_mouse"


# -- list choice (tmux < 2.4) --------------------------------------------------

# vi-choice is gone in tmux >= 2.4
run -b 'tmux bind -t vi-choice h tree-collapse 2> /dev/null || true'
run -b 'tmux bind -t vi-choice l tree-expand 2> /dev/null || true'
run -b 'tmux bind -t vi-choice K start-of-list 2> /dev/null || true'
run -b 'tmux bind -t vi-choice J end-of-list 2> /dev/null || true'
run -b 'tmux bind -t vi-choice H tree-collapse-all 2> /dev/null || true'
run -b 'tmux bind -t vi-choice L tree-expand-all 2> /dev/null || true'
run -b 'tmux bind -t vi-choice Escape cancel 2> /dev/null || true'


# -- edit mode (tmux < 2.4) ----------------------------------------------------

# vi-edit is gone in tmux >= 2.4
run -b 'tmux bind -ct vi-edit H start-of-line 2> /dev/null || true'
run -b 'tmux bind -ct vi-edit L end-of-line 2> /dev/null || true'
run -b 'tmux bind -ct vi-edit q cancel 2> /dev/null || true'
run -b 'tmux bind -ct vi-edit Escape cancel 2> /dev/null || true'


# -- copy mode -----------------------------------------------------------------

bind Enter copy-mode # enter copy mode

run -b 'tmux bind -t vi-copy v begin-selection 2> /dev/null || true'
run -b 'tmux bind -T copy-mode-vi v send -X begin-selection 2> /dev/null || true'
run -b 'tmux bind -t vi-copy C-v rectangle-toggle 2> /dev/null || true'
run -b 'tmux bind -T copy-mode-vi C-v send -X rectangle-toggle 2> /dev/null || true'
run -b 'tmux bind -t vi-copy y copy-selection 2> /dev/null || true'
run -b 'tmux bind -T copy-mode-vi y send -X copy-selection-and-cancel 2> /dev/null || true'
run -b 'tmux bind -t vi-copy Escape cancel 2> /dev/null || true'
run -b 'tmux bind -T copy-mode-vi Escape send -X cancel 2> /dev/null || true'
run -b 'tmux bind -t vi-copy H start-of-line 2> /dev/null || true'
run -b 'tmux bind -T copy-mode-vi H send -X start-of-line 2> /dev/null || true'
run -b 'tmux bind -t vi-copy L end-of-line 2> /dev/null || true'
run -b 'tmux bind -T copy-mode-vi L send -X end-of-line 2> /dev/null || true'

# copy to X11 clipboard
if -b 'command -v xsel > /dev/null 2>&1' 'bind y run -b "tmux save-buffer - | xsel -i -b"'
if -b '! command -v xsel > /dev/null 2>&1 && command -v xclip > /dev/null 2>&1' 'bind y run -b "tmux save-buffer - | xclip -i -selection clipboard >/dev/null 2>&1"'
# copy to macOS clipboard
if -b 'command -v pbcopy > /dev/null 2>&1' 'bind y run -b "tmux save-buffer - | pbcopy"'
if -b 'command -v reattach-to-user-namespace > /dev/null 2>&1' 'bind y run -b "tmux save-buffer - | reattach-to-user-namespace pbcopy"'
# copy to Windows clipboard
if -b 'command -v clip.exe > /dev/null 2>&1' 'bind y run -b "tmux save-buffer - | clip.exe"'
if -b '[ -c /dev/clipboard ]' 'bind y run -b "tmux save-buffer - > /dev/clipboard"'

# -- buffers -------------------------------------------------------------------

bind b list-buffers  # list paste buffers
bind p paste-buffer  # paste from the top paste buffer
bind P choose-buffer # choose which buffer to paste from


#################################################################################################
############################################# THEME #############################################
#################################################################################################

# Copied bluntly form:
# https://github.com/arcticicestudio/nord-tmux
#
# It is the beutiful north theme, is just that I do not like to use plugins, 
# so adapted it to be self contained within the tmux.conf file

#+---------+
#+ Options +
#+---------+
set -g status-interval 1
set -g status on

#+--------+
#+ Status +
#+--------+
#+--- Layout ---+
set -g status-justify left

#+--- Colors ---+
set -g status-style bg=black,fg=white

#+-------+
#+ Panes +
#+-------+
set -g pane-border-style bg=default,fg=brightblack
set -g pane-active-border-style bg=default,fg=blue
set -g display-panes-colour black
set -g display-panes-active-colour brightblack

#+------------+
#+ Clock Mode +
#+------------+
setw -g clock-mode-colour cyan

#+----------+
#+ Messages +
#+---------+
set -g message-style bg=brightblack,fg=cyan
set -g message-command-style bg=brightblack,fg=cyan

#+----------------+
#+ Plugin Support +
#+----------------+
#+--- tmux-prefix-highlight ---+
set -g @prefix_highlight_output_prefix "#[fg=brightcyan]#[bg=black]#[nobold]#[noitalics]#[nounderscore]#[bg=brightcyan]#[fg=black]"
set -g @prefix_highlight_output_suffix ""
set -g @prefix_highlight_copy_mode_attr "fg=brightcyan,bg=black,bold"

#+--------+
#+ Status +
#+--------+
#+--- Bars ---+
#set -g status-left "#[fg=black,bg=blue,bold] #S #[fg=blue,bg=black,nobold,noitalics,nounderscore]"
set -g status-left-length 64
set -g status-left "#[fg=black,bg=blue,bold] #S #{?client_prefix,#[reverse]M#[noreverse],} #{b:pane_current_path} #[fg=blue,bg=black,nobold,noitalics,nounderscore]"
set -g status-right "#{prefix_highlight}#[fg=brightblack,bg=black,nobold,noitalics,nounderscore]#[fg=white,bg=brightblack] %d-%M-%Y #[fg=white,bg=brightblack,nobold,noitalics,nounderscore]#[fg=white,bg=brightblack] %H:%M #[fg=cyan,bg=brightblack,nobold,noitalics,nounderscore]#[fg=black,bg=cyan,bold] #H "

#+--- Windows ---+
set -g window-status-format "#[fg=black,bg=brightblack,nobold,noitalics,nounderscore] #[fg=white,bg=brightblack]#I #[fg=white,bg=brightblack,nobold,noitalics,nounderscore] #[fg=white,bg=brightblack]#W #F #[fg=brightblack,bg=black,nobold,noitalics,nounderscore]"
set -g window-status-current-format "#[fg=black,bg=cyan,nobold,noitalics,nounderscore] #[fg=black,bg=cyan]#I #[fg=black,bg=cyan,nobold,noitalics,nounderscore] #[fg=black,bg=cyan]#W #F #[fg=cyan,bg=black,nobold,noitalics,nounderscore]"
set -g window-status-separator ""

