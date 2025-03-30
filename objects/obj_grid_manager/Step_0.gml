if (is_game_over()) exit;

//pause timer if there is a clash
if (instance_exists(obj_clash_manager)) return; // clash actif → on ne fait rien

// === Analyse des lignes ===
for (var i = 0; i < grid_lines; i++) {
    check_consolidation(i);
    check_digestion(i);
	check_game_over(i, "J1");
}

// === Gestion du timer de vague de blocs ===
if (!is_digesting()) {
    bloc_timer--;
}

if (bloc_timer <= 0) {
    generate_bloc_wave();
    bloc_timer = bloc_timer_max;
}
global.game_paused = false;
