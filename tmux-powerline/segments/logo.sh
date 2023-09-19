run_segment() {
    prefix_indicator="#[fg=#282c34]#{?client_prefix,#[bg=#e5c07b],#[bg=#89ca78]}"
    prefix_indicator_right="#[bg=#282c34]#{?client_prefix,#[fg=#e5c07b],#[fg=#89ca78]}"
    prefix_indicator_left="#[fg=#282c34]#{?client_prefix,#[bg=#e5c07b],#[bg=#89ca78]}"

    echo "${prefix_indicator_left}${prefix_indicator}  ${prefix_indicator_right}"
	return 0
}
