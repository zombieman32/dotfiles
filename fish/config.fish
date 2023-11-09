# Execute tmux at startup
if status is-interactive
and not set -q TMUX
    exec tmux
end

function fish_greeting 
  echo (set_color yellow)"____________________________________________________________"
  echo "|__________________________________________________________|"
  echo "|_"(set_color green)"/"(set_color cyan)"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"(set_color yellow)"_____________________"(set_color green)"/"(set_color cyan)"\\\\\\"(set_color yellow)"________________|"
  echo "|_"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color green)"///////////"(set_color yellow)"_____________________"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_______________|"
  echo "|__"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"______________"(set_color green)"/\\"(set_color cyan)"\\\\"(set_color yellow)"______________"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"______________|"
  echo "|___"(set_color green)"\\/"(set_color cyan)"\\\\\\\\\\\\\\\\\\\\\\"(set_color yellow)"_____"(set_color green)"\\///"(set_color yellow)"___"(set_color green)"/"(set_color cyan)"\\\\\\\\\\\\\\\\\\\\"(set_color yellow)"_"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_____________|"
  echo "|____"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color green)"///////"(set_color yellow)"_______"(set_color green)"/\\"(set_color cyan)"\\\\"(set_color yellow)"_"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color green)"//////"(set_color yellow)"__"(set_color green)"\\/"(set_color cyan)"\\\\\\\\\\\\\\\\\\\\"(set_color yellow)"_____|"
  echo "|_____"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_____________"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_"(set_color green)"\\/"(set_color cyan)"\\\\\\\\\\\\\\\\\\\\"(set_color yellow)"_"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color green)"/////"(set_color cyan)"\\\\\\"(set_color yellow)"___|"
  echo "|______"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_____________"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_"(set_color green)"\\////////"(set_color cyan)"\\\\\\"(set_color yellow)"_"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"___"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"__|"
  echo "|_______"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_____________"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"__"(set_color green)"/"(set_color cyan)"\\\\\\\\\\\\\\\\\\\\"(set_color yellow)"_"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"___"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_|"
  echo "|________"(set_color green)"\\///"(set_color yellow)"______________"(set_color green)"\\///"(set_color yellow)"__"(set_color green)"\\//////////"(set_color yellow)"__"(set_color green)"\\///"(set_color yellow)"____"(set_color green)"\\///"(set_color yellow)"_|"
  echo "|__________________________________________________________|"
end

if type -q exa
  alias ll "exa -l -h -g --git --icons"
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

thefuck --alias | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export DENO_INSTALL "$HOME/.deno"
set --export PATH $DENO_INSTALL/bin $PATH
set --export CARGO_INSTALL "$HOME/.cargo/"
set --export PATH $CARGO_INSTALL/bin $PATH
set --export CABAL_INSTALL "$HOME/.cabal/"
set --export PATH $CABAL_INSTALL/bin $PATH
set --export GHCUP_INSTALL "$HOME/.ghcup/"
set --export PATH $GHCUP_INSTALL/bin $PATH
set --export BREW_INSTALL "/home/linuxbrew/.linuxbrew/"
set --export PATH $BREW_INSTALL/bin $PATH
set --export PATH $BREW_INSTALL/sbin $PATH
set --export PATH /home/zombie/.local/bin/ $PATH
set --export PATH /home/zombie/.luaver/ $PATH
set --export STEAM_LIBRARY /hdd/SteamLibrary
set --export PATH /usr/local/noweb/ $PATH
fish_add_path /home/zombie/.spicetify
