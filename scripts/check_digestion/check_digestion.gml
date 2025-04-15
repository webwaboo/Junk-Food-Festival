function check_digestion(line_index) {
    var manager = instance_find(obj_grid_manager, 0);
    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;
    var line = grid[line_index];

    if (array_length(line) == 0) return;

    clean_line(line); // 🔒 sécurise l’array

    var first_bloc = line[0];

    // ✅ Seuls les blocs de taille 3 peuvent être digérés
    if (first_bloc.bloc_taille == 3) {

        // ⏱️ Si timer non lancé, on le démarre
        if (first_bloc.digestion_timer == -1) {
            first_bloc.digestion_timer = 180; // 3 secondes
        } else {
            first_bloc.digestion_timer--;

            if (first_bloc.digestion_timer <= 0) {
                array_delete(line, 0, 1); // retirer du tableau
                with (first_bloc) instance_destroy(); // puis détruire
                reposition_line(line_index); // réajuste visuellement
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
        // ❌ Pas un bloc digestible → on stoppe le timer si nécessaire
        if (first_bloc.digestion_timer != -1) {
            first_bloc.digestion_timer = -1;
        }
    }
}
