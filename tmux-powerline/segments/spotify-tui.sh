#!/usr/bin/env bash
# From dracula theme, adapted to work with erikw/tmux-powerline
current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

run_segment()
{
  # storing the refresh rate in the variable RATE, default is 5
  RATE=$(get_tmux_option "@dracula-refresh-rate" 5)

  if ! command -v spt &> /dev/null
  then
    exit 1
  fi

  FORMAT=$(get_tmux_option "@dracula-spotify-tui-format" "%f %s %t - %a")
  spotify_playback=$(spt playback -f "${FORMAT}")
  echo ${spotify_playback}

}
