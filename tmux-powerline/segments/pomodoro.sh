#!/usr/bin/env bash
run_segment(){
    status=$(pomodoro status -f "󱎫 %!r  %c%!g %d %t")
    if  [ -z "$status"]; then
        exit 1
    fi

    echo "$status"
}
