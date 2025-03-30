//timer don't reset if u change line
function check_digestion_p2(line_index) {
    var manager = instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;
    var line = grid[line_index];

    if (array_length(line) == 0) return;

    var last_index = array_length(line) - 1;
	var first_bloc = line[array_length(line) - 1];

	
	// Reset tous les autres blocs de la ligne
    for (var i = 0; i < last_index; i++) {
        if (line[i].digestion_timer != -1) {
            line[i].digestion_timer = -1;
        }
    }
	
    // On ne digère que si c'est un bloc de taille 3
    if (first_bloc.bloc_taille == 3) {

        // Si le timer n’est pas encore lancé, on le démarre
        if (first_bloc.digestion_timer == -1) {
            first_bloc.digestion_timer = 180; // 3 secondes à 60 FPS
        } else {
            first_bloc.digestion_timer--;

            // Si le timer atteint 0, on digère !
            if (first_bloc.digestion_timer <= 0) {
				// Retirer du tableau d'abord
				array_delete(line, last_index, 1); // enlever de la ligne
				// Ensuite détruire
                with (first_bloc) instance_destroy();
				// Réajuster la ligne visuellement
                reposition_line_p2(line_index); // réajuste les blocs
            }
        }
    } else {
        // Si le premier bloc n'est pas digestible, on réinitialise le timer
        if (first_bloc.digestion_timer != -1) {
            first_bloc.digestion_timer = -1;
        }
    }
}

/*//timer reset if you change line
function check_digestion(line_index) {
    var manager = instance_find(obj_grid_manager, 0);
    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;
    var line = grid[line_index];

    var count = array_length(line);
    if (count == 0) return;

    // Réinitialise tous les timers sauf le premier bloc
    for (var i = 1; i < count; i++) {
        var b = line[i];
        if (b.digestion_timer != -1) {
            b.digestion_timer = -1;
        }
    }

    var first_bloc = line[0];

    // Si c’est un bloc de taille 3, on peut le digérer
    if (first_bloc.bloc_taille == 3) {
        if (first_bloc.digestion_timer == -1) {
            first_bloc.digestion_timer = 180; // 3 sec
        } else {
            first_bloc.digestion_timer--;

            if (first_bloc.digestion_timer <= 0) {
                with (first_bloc) instance_destroy();
                array_delete(line, 0, 1);
                reposition_line(line_index);
            }
        }
    } else {
        // Pas de taille 3 = on annule la digestion
        if (first_bloc.digestion_timer != -1) {
            first_bloc.digestion_timer = -1;
        }
    }
}*/
