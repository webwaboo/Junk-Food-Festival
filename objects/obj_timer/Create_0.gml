//15 sec for the tutorial ! and 99 for a game
if (string_starts_with(room_get_name(room), "rm_tuto_")) {
	global.timer_seconds = 15;
} else {
	global.timer_seconds = 99;
}
timer_frame = 0;
