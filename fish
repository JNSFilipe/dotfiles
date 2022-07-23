starship init fish | source

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
