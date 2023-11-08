#!/usr/bin/env bash
run_segment(){
    status=$(pomodoro status -f "󱎫 %r/%l  %c %d %t")
    time=$(pomodoro status -f "%r")
    stop="0:00"
    if  [ -z "$status"]; then
        echo " "
    elif [ "$time" = "$stop" ]; then
        echo " Break"
    else
        echo "$status"
    fi
}
