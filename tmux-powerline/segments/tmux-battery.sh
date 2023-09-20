#!/usr/bin/env bash
# From dracula theme, adapted to work with erikw/tmux-powerline
current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

linux_acpi() {
  arg=$1
  BAT=$(ls -d /sys/class/power_supply/BAT* | head -1)
  if [ ! -x "$(which acpi 2> /dev/null)" ];then
    case "$arg" in
      status)
        cat $BAT/status
        ;;

      percent)
        cat $BAT/capacity
        ;;

      *)
        ;;
    esac
  else
    case "$arg" in
      status)
        acpi | cut -d: -f2- | cut -d, -f1 | tr -d ' '
        ;;
      percent)
        acpi | cut -d: -f2- | cut -d, -f2 | tr -d '% '
        ;;
      *)
        ;;
    esac
  fi
}

battery_percent()
{
  # Check OS
  case $(uname -s) in
    Linux)
      percent=$(linux_acpi percent)
      [ -n "$percent" ] && echo "$percent%"
      ;;

    Darwin)
      echo $(pmset -g batt | grep -Eo '[0-9]?[0-9]?[0-9]%')
      ;;

    FreeBSD)
      echo $(apm | sed '8,11d' | grep life | awk '{print $4}')
      ;;

    CYGWIN*|MINGW32*|MSYS*|MINGW*)
      # leaving empty - TODO - windows compatability
      ;;

    *)
      ;;
  esac
}

battery_status()
{
  # Check OS
  case $(uname -s) in
    Linux)
      status=$(linux_acpi status)
      ;;

    Darwin)
      status=$(pmset -g batt | sed -n 2p | cut -d ';' -f 2 | tr -d " ")
      ;;

    FreeBSD)
      status=$(apm | sed '8,11d' | grep Status | awk '{printf $3}')
      ;;

    CYGWIN*|MINGW32*|MSYS*|MINGW*)
      # leaving empty - TODO - windows compatability
      ;;

    *)
      ;;
  esac
  percent=$(linux_acpi percent)
  case $status in
    discharging|Discharging)
      if ((100>$percent && 90<=$percent))
      then
          echo '󰂂'
      elif ((90>$percent && 80<=$percent))
      then
          echo '󰂁'
      elif ((80>$percent && 70<=$percent))
      then
          echo '󰂀'
      elif ((70>$percent && 60<=$percent))
      then
          echo '󰁿'
      elif ((60>$percent && 50<=$percent))
      then
          echo '󰁾'
      elif ((50>$percent && 40<=$percent))
      then
          echo '󰁽'
      elif ((40>$percent && 30<=$percent))
      then
          echo '󰁼'
      elif ((30>$percent && 20<=$percent))
      then
          echo '󰁻'
      elif ((20>$percent && 10<=$percent))
      then
          echo '󰁻'
      elif ((10>$percent && 0<=$percent))
      then
          echo '󱃍'
      fi
      ;;
    high|Full)
      echo '󰁹'
      ;;
    charging|Charging)
      echo '󰂄'
      ;;
    *)
      echo '󰚥'
      ;;
  esac
  ### Old if statements didn't work on BSD, they're probably not POSIX compliant, not sure
  # if [ $status = 'discharging' ] || [ $status = 'Discharging' ]; then
  # 	echo ''
  # # elif [ $status = 'charging' ]; then # This is needed for FreeBSD AC checking support
  # 	# echo 'AC'
  # else
  #  	echo 'AC'
  # fi
}

run_segment()
{
  bat_label=$(get_tmux_option "@dracula-battery-label" "󰁹")
  bat_stat=$(battery_status)
  bat_perc=$(battery_percent)

  if [ -z "$bat_stat" ]; then # Test if status is empty or not
    echo "$bat_label $bat_perc"
  elif [ -z "$bat_perc" ]; then # In case it is a desktop with no battery percent, only AC power
    echo "$bat_stat"
  else
    echo "$bat_stat $bat_perc"
  fi
}

