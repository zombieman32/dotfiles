if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end

# Execute tmux at startup
if status is-interactive
and not set -q TMUX
    exec tmux
end

function fish_greeting
  clear
  # echo (set_color yellow)"____________________________________________________________"
  # echo "|__________________________________________________________|"
  # echo "|_"(set_color green)"/"(set_color cyan)"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"(set_color yellow)"_____________________"(set_color green)"/"(set_color cyan)"\\\\\\"(set_color yellow)"________________|"
  # echo "|_"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color green)"///////////"(set_color yellow)"_____________________"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_______________|"
  # echo "|__"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"______________"(set_color green)"/"(set_color cyan)"\\\\\\"(set_color yellow)"______________"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"______________|"
  # echo "|___"(set_color green)"\\/"(set_color cyan)"\\\\\\\\\\\\\\\\\\\\\\"(set_color yellow)"_____"(set_color green)"\\///"(set_color yellow)"___"(set_color green)"/"(set_color cyan)"\\\\\\\\\\\\\\\\\\\\"(set_color yellow)"_"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_____________|"
  # echo "|____"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color green)"///////"(set_color yellow)"_______"(set_color green)"/"(set_color cyan)"\\\\\\"(set_color yellow)"_"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color green)"//////"(set_color yellow)"__"(set_color green)"\\/"(set_color cyan)"\\\\\\\\\\\\\\\\\\\\"(set_color yellow)"_____|"
  # echo "|_____"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_____________"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_"(set_color green)"\\/"(set_color cyan)"\\\\\\\\\\\\\\\\\\\\"(set_color yellow)"_"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color green)"/////"(set_color cyan)"\\\\\\"(set_color yellow)"___|"
  # echo "|______"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_____________"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_"(set_color green)"\\////////"(set_color cyan)"\\\\\\"(set_color yellow)"_"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"___"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"__|"
  # echo "|_______"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_____________"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"__"(set_color green)"/"(set_color cyan)"\\\\\\\\\\\\\\\\\\\\"(set_color yellow)"_"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"___"(set_color green)"\\/"(set_color cyan)"\\\\\\"(set_color yellow)"_|"
  # echo "|________"(set_color green)"\\///"(set_color yellow)"______________"(set_color green)"\\///"(set_color yellow)"__"(set_color green)"\\//////////"(set_color yellow)"__"(set_color green)"\\///"(set_color yellow)"____"(set_color green)"\\///"(set_color yellow)"_|"
  # echo "|__________________________________________________________|"
  printf "  __  _      _    \n / _|(_) ___| |_  \n|  _|| |(_-/|   \ \n|_|  |_|/__/|_||_|" | ponysay
  sleep 1.5
  clear
end

function ya
	set tmp (mktemp -t "yazi-cwd.XXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

if type -q eza
  alias ll "eza -l -h --group-directories-first --no-user --git --icons"
  alias lln "eza -l -h --group-directories-first --no-permissions --no-user --git --icons"
  alias lla "ll -a"
  alias llan "lln -a"
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
abbr --add dl wget -c 

set --export STEAM_LIBRARY /hdd/SteamLibrary
set --export BW_SESSION VcmjeOR0C2eCMCpCHlKxu/v+CSR53bUdbEMiqzwcpFABPD8zhZB52o1CIuagfpJxxGVd86Hc3DVTkTR8YLMjfQ==
fish_add_path /home/zombie/.bun/bin/
fish_add_path /home/zombie/.deno/bin/
fish_add_path /home/zombie/.cargo/bin/
fish_add_path /home/zombie/.cabal/bin/
fish_add_path /home/zombie/.ghcup/bin/
fish_add_path /home/zombie/.local/bin/
fish_add_path /home/zombie/go/bin/
fish_add_path /home/linuxbrew/.linuxbrew/bin/
fish_add_path /home/linuxbrew/.linuxbrew/sbin/
fish_add_path /home/zombie/.spicetify
fish_add_path /home/zombie/.luaver
fish_add_path /usr/local/noweb/
fish_add_path /snap/bin/
fish_add_path /home/zombie/Applications/uxn
fish_add_path /home/zombie/Applications/bw-linux-2024.1.0/
fish_add_path /home/zombie/Applications/jq/
fish_add_path /home/zombie/.config/tmux/plugins/tmuxifier/bin/

# Initialize the starship prompt
starship init fish | source
thefuck --alias | source
source ~/.asdf/asdf.fish
bass source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
direnv hook fish | source
eval (tmuxifier init - fish)
zoxide init --cmd cd fish | source

# argc-completions
set -gx ARGC_COMPLETIONS_ROOT "/home/zombie/Development/argc-completions"
set -gx ARGC_COMPLETIONS_PATH "$ARGC_COMPLETIONS_ROOT/completions"
fish_add_path "$ARGC_COMPLETIONS_ROOT/bin"
# To add completions for only the specified command, modify next line e.g. set argc_scripts cargo git
set argc_scripts (ls -1 "$ARGC_COMPLETIONS_ROOT/completions" | sed -n 's/\.sh$//p')
argc --argc-completions fish $argc_scripts | source
