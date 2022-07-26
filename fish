# Add rust install dir to path
fish_add_path ~/.cargo/bin

# Add helper scripts to path
fish_add_path ~/.aux

# Enable starship support
starship init fish | source

# Enable zoxide support
zoxide init fish | source

# Enable vi-mode
fish_vi_key_bindings

# Function to add !! functionality to fish
function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
    eval command sudo $history[1]
else
    command sudo $argv
    end
end

# Create alais to launch vim
alias vim="nvim"
alias v="nvim"

# Create alias to replace ls by exa
alias ls="exa"
alias ll="exa -l"
alias la="exa -la"

# Create alias to replace cat by bat
alias cat="bat"
