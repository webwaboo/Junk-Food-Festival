if (is_game_over()) exit;

//pause timer if there is a clash
if (instance_exists(obj_clash_manager)) return; // clash actif → on ne fait rien

// === Analyse des lignes (consolidation & digestion) ===
for (var i = 0; i < grid_lines; i++) {
    check_consolidation_p2(i);
    check_digestion_p2(i);
	check_game_over(i, "J2");
}

// === Timer pour la génération automatique de blocs ===
// Il se met en pause si un bloc est en cours de digestion
if (!is_digesting_p2()) {
    bloc_timer--;
}

if (bloc_timer <= 0) {
    generate_bloc_wave_p2();
    bloc_timer = bloc_timer_max;
}
