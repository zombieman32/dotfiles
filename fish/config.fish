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
echo "|__"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"______________"(set_color green)"/"(set_color cyan)"\\\\\\"(set_color yellow)"______________"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"______________|"
  echo "|___"(set_color green)"\\/"(set_color cyan)"\\\\\\\\\\\\\\\\\\\\\\"(set_color yellow)"_____"(set_color green)"\\///"(set_color yellow)"___"(set_color green)"/"(set_color cyan)"\\\\\\\\\\\\\\\\\\\\"(set_color yellow)"_"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_____________|"
  echo "|____"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color green)"///////"(set_color yellow)"_______"(set_color green)"/"(set_color cyan)"\\\\\\"(set_color yellow)"_"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color green)"//////"(set_color yellow)"__"(set_color green)"\\/"(set_color cyan)"\\\\\\\\\\\\\\\\\\\\"(set_color yellow)"_____|"
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

# Abbreviations
abbr --add c clear
abbr --add ga git add
abbr --add gcm git commit -m ""
abbr --add nvim_config nvim ~/.config/nvim/init.lua
abbr --add install sudo dnf install
abbr --add rights sudo chmod +x
abbr --add nfish_config nvim ~/.config/fish/config.fish
abbr --add overviewer overviewer.py
# Initialize the starship prompt
starship init fish | source

thefuck --alias | source

source ~/.asdf/asdf.fish

set --export STEAM_LIBRARY /hdd/SteamLibrary
fish_add_path /home/zombie/.bun/bin/
fish_add_path /home/zombie/.deno/bin/
fish_add_path /home/zombie/.cargo/bin/
fish_add_path /home/zombie/.cabal/bin/
fish_add_path /home/zombie/.ghcup/bin/
fish_add_path /home/zombie/.local/bin/
fish_add_path /home/linuxbrew/.linuxbrew/bin/
fish_add_path /home/linuxbrew/.linuxbrew/sbin/
fish_add_path /home/zombie/.spicetify
fish_add_path /home/zombie/.luaver
fish_add_path /usr/local/noweb/
