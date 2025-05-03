if (room=rm_tuto_9){
	menu_options = [ "Quit to Title", "Retry"];
}else{
	menu_options = ["Next Level", "Retry", "Quit to Title"];
}
menu_index = 0;
audio_play_sound(snd_success, 1, false)
// Activer la pause
global.game_paused = true;

// Effet fondu
alpha = 0;