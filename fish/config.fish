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
    # printf "  __  _      _    \n / _|(_) ___| |_  \n|  _|| |(_-/|   \ \n|_|  |_|/__/|_||_|" | ponysay -f pinkiepie
end

if type -q eza
  alias ll "eza -l -h -U --group-directories-first --no-permissions --no-user --color-scale --git --icons"
  alias lla "ll -a"
end

alias cat "bat"
alias gitui "gitui -t mocha.ron"

# Abbreviations
abbr --add c clear
abbr --add ga git add
abbr --add gcm git commit -m
abbr --add gr git rm --cached
abbr --add gc git clone
abbr --add nvim_config nvim ~/.config/nvim/init.lua
abbr --add install sudo dnf install
abbr --add remove sudo dnf remove
abbr --add search dnf search
abbr --add rights sudo chmod +x
abbr --add nfish_config nvim ~/.config/fish/config.fish
abbr --add overviewer ~/Applications/The-Minecraft-Overviewer-1.20.3/overviewer.py
abbr --add init_mysql sudo systemctl start mysqld
abbr --add init_mariadb sudo systemctl start mariadb
abbr --add init_postgre sudo systemctl start postgresql
abbr --add init_redis sudo systemctl start redis
abbr --add init_cassandra docker run --name cass_cluster cassandra:latest
abbr --add init_mongodb sudo systemctl start mongod.service
abbr --add cassandra docker exec -it cass_cluster cqlsh
abbr --add dotgrid epiphany ~/Applications/dotgrid-main/index.html
abbr --add ronin epiphany ~/Applications/ronin-main/index.html

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
fish_add_path /home/zombie/Applications/uxn

# Initialize the starship prompt
starship init fish | source
thefuck --alias | source
source ~/.asdf/asdf.fish
bass source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
direnv hook fish | source
