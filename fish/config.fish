# Execute tmux at startup
if status is-interactive
and not set -q TMUX
    exec tmux
end

# Delete fish welcome message
set fish_greeting

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

# Initialize the starship prompt
starship init fish | source
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/zombie/miniconda3/bin/conda
    eval /home/zombie/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<
