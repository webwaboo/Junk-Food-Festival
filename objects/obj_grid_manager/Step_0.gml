//check if gameover or paused
if (global.game_paused) exit;
if (is_game_over()) exit;

//pause timer if there is a clash
if (instance_exists(obj_clash_manager)) return; // clash actif → on ne fait rien

// === Analyse des lignes ===
for (var i = 0; i < grid_lines; i++) {
	if (!tuto_mechanic_enabled("consolidation")) {
        check_consolidation(i);
	}
	if (!tuto_mechanic_enabled("digestion")) {
		check_digestion(i);
	}   
	check_game_over(i, "J1");
}

// === Gestion du timer de vague de blocs ===
if (!tuto_mechanic_enabled("digestion")) {
	if (!is_digesting()) {
		bloc_timer--;
	}
} 



/*if (bloc_timer = 180) {
    audio_play_sound(snd_new_line_alarm, 1, false)
}

if (bloc_timer = 120) {
    audio_play_sound(snd_new_line_alarm, 1, false)
}

if (bloc_timer = 60) {
    audio_play_sound(snd_new_line_alarm, 1, false)
}*/

if (!tuto_mechanic_enabled("generation"))  {
	if (bloc_timer <= 0) {
	    generate_bloc_wave();
	    bloc_timer = bloc_timer_max;
		audio_play_sound(snd_new_line_2, 1, false)
	}
}



global.game_paused = false;
