global.score_j1 = 0;
global.score_j2 = 0;

if(room = rm_tuto_7){
	bonus_timer = irandom_range(2 * game_get_speed(gamespeed_fps), 4 * game_get_speed(gamespeed_fps)); // entre 10 et 15 secondes
}else {
	bonus_timer = irandom_range(10 * game_get_speed(gamespeed_fps), 15 * game_get_speed(gamespeed_fps)); // entre 10 et 15 secondes
}