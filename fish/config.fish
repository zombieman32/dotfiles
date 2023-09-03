if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
starship init fish | source
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/zombie/miniconda3/bin/conda
    eval /home/zombie/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<
