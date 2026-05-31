function check_digestion_p2(line_index) {
    var manager = instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;
    var line = grid[line_index];

    if (array_length(line) == 0) return;

    clean_line(line); // 🔒 sécurité

    var last_index = array_length(line) - 1;
    var first_bloc = line[last_index]; // côté corps chez P2

    // ✅ Seuls les blocs de taille 3 peuvent être digérés
    if (first_bloc.bloc_taille == 3) {

        if (first_bloc.digestion_timer == -1) {
            first_bloc.digestion_timer = global.digestion_timer_duration;
        } else {
            first_bloc.digestion_timer--;

            if (first_bloc.digestion_timer <= 0) {
                array_delete(line, last_index, 1);
                with (first_bloc) instance_destroy();
                reposition_line_p2(line_index);
				audio_play_sound(snd_bloc_digested, 1, false)
				//ajoute le score
				if (manager.object_index == obj_grid_manager) {
				    global.score_j1 += 300;
				} else {
				    global.score_j2 += 300;
				}
            }
        }

    } else {
        // ❌ Pas un bloc digestible → reset timer
        if (first_bloc.digestion_timer != -1) {
            first_bloc.digestion_timer = -1;
        }
    }
}
