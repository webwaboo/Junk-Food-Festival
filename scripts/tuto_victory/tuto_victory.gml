function tuto_victory() {
    switch (room) {
        case rm_tuto_1:
            var cursor = instance_find(obj_cursor, 0);
            if (!instance_exists(cursor)) return false;

            if (!variable_instance_exists(cursor, "visited_top")) {
                cursor.visited_top = false;
                cursor.visited_bottom = false;
            }

            if (cursor.ligne_index == 0) cursor.visited_top = true;
            if (cursor.ligne_index == 5) cursor.visited_bottom = true;

            return cursor.visited_top && cursor.visited_bottom;

        case rm_tuto_2:
            var top_reached = false;
            var bottom_reached = false;

            var manager = instance_find(obj_grid_manager, 0);
            if (instance_exists(manager)) {
                var grid = manager.player_grid;
                for (var i = 0; i < array_length(grid); i++) {
                    var line = grid[i];
                    for (var j = 0; j < array_length(line); j++) {
                        var bloc = line[j];
                        if (!instance_exists(bloc)) continue;
                        if (bloc.bloc_owner == "J1") {
                            if (i == 0) top_reached = true;
                            if (i == array_length(grid) - 1) bottom_reached = true;
                        }
                    }
                }
            }

            return top_reached && bottom_reached;


		case rm_tuto_3:
		    var count_size3 = 0;
		    var manager = instance_find(obj_grid_manager, 0);
		    if (instance_exists(manager)) {
		        var grid = manager.player_grid;
		        for (var i = 0; i < array_length(grid); i++) {
		            var line = grid[i];
		            for (var j = 0; j < array_length(line); j++) {
		                var bloc = line[j];
		                if (instance_exists(bloc) && bloc.bloc_owner == "J1" && bloc.bloc_taille == 3) {
		                    count_size3++;
		                }
		            }
		        }
		    }

		    return count_size3 >= 3;

		case rm_tuto_4:
		    var manager = instance_find(obj_grid_manager, 0);
		    if (!instance_exists(manager)) return false;

		    var grid = manager.player_grid;

		    for (var i = 0; i < array_length(grid); i++) {
		        var line = grid[i];
		        var count = array_length(line);
		        if (count == 0) continue;

		        var last_bloc = line[count - 1];
		        if (instance_exists(last_bloc) && last_bloc.bloc_owner == "J1" && last_bloc.bloc_taille == 3) {
		            return true;
		        }
		    }

			return false;
	
		case rm_tuto_5:
		    var manager = instance_find(obj_grid_manager, 0);
		    if (!instance_exists(manager)) return false;

		    var grid = manager.player_grid;

		    for (var i = 0; i < array_length(grid); i++) {
		        var line = grid[i];
		        for (var j = 0; j < array_length(line); j++) {
		            var bloc = line[j];
		            if (instance_exists(bloc) && bloc.bloc_taille == 3) {
		                return false; // un bloc de taille 3 est encore présent
		            }
		        }
		    }

		    return true; // tous les blocs de taille 3 ont disparu
			
		case rm_tuto_6:
		    // Vérifie que le bloc a bien atteint le camp adverse (i.e. dans une ligne de l’autre joueur)
		    var manager = instance_find(obj_grid_manager_p2, 0);
		    if (!instance_exists(manager)) return false;

		    var grid = manager.player_grid;

		    for (var i = 0; i < array_length(grid); i++) {
		        var line = grid[i];
		        for (var j = 0; j < array_length(line); j++) {
		            var bloc = line[j];
		            if (instance_exists(bloc) && bloc.bloc_owner == "J2") {
		                return true; // un bloc de J1 est arrivé chez J2
		            }
		        }
		    }

		    return false;
			
		case rm_tuto_7:
			return global.score_j1 >= 500;
		
		case rm_tuto_8:
			{
			    // On vérifie si le clash a eu lieu
			    var clash_triggered = variable_global_exists("clash_occurred") && global.clash_occurred;

			    // Comptage des blocs de taille 3 chez chaque joueur
			    var count_j1 = 0;
			    var count_j2 = 0;

			    var grid_j1 = instance_exists(obj_grid_manager) ? obj_grid_manager.player_grid : [];
			    var grid_j2 = instance_exists(obj_grid_manager_p2) ? obj_grid_manager_p2.player_grid : [];

			    for (var i = 0; i < array_length(grid_j1); i++) {
			        var line = grid_j1[i];
			        for (var b = 0; b < array_length(line); b++) {
			            var bloc = line[b];
			            if (bloc.bloc_taille == 3 && bloc.bloc_owner == "J1") count_j1++;
			        }
			    }

			    for (var i = 0; i < array_length(grid_j2); i++) {
			        var line = grid_j2[i];
			        for (var b = 0; b < array_length(line); b++) {
			            var bloc = line[b];
			            if (bloc.bloc_taille == 3 && bloc.bloc_owner == "J2") count_j2++;
			        }
			    }

			    // Victoire seulement si le clash a eu lieu ET que J2 a reçu les 2 blocs
			    if (clash_triggered && count_j2 >= 2) {
			        return true;
			    }

			    // Échec si J1 a récupéré les blocs OU si J2 a 2 blocs sans clash
			    if (count_j1 >= 2 || (count_j2 >= 2 && !clash_triggered)) {
			        room_restart();
			    }

			    return false;
			}
	
		case rm_tuto_9:
		    var score_j1 = global.score_j1;
		    var score_j2 = global.score_j2;

		    // Le jeu est déjà gagné ?
		    if (score_j1 >= 15000 && score_j1 > score_j2) return true;

		    // Obésité J2 détectée (zone de danger)
		    var manager = instance_find(obj_grid_manager_p2, 0);
		    if (instance_exists(manager)) {
		        var grid = manager.player_grid;
		        for (var i = 0; i < array_length(grid); i++) {
		            var line = grid[i];
		            var total = 0;
		            for (var j = 0; j < array_length(line); j++) {
		                if (instance_exists(line[j])) {
		                    total += line[j].bloc_taille;
		                }
		            }
		            if (total > 12) {
		                if (!variable_global_exists("tuto_timer_reset")) {
		                    global.tuto_timer_reset = game_get_speed(gamespeed_fps) * 10; // 10 sec
		                } else {
		                    global.tuto_timer_reset--;
		                    if (global.tuto_timer_reset <= 0) return true;
		                }
		            }
		        }
		    }

		    // Fin de temps : score supérieur
		    if (global.tuto_round_timer <= 0) {
		        return score_j1 > score_j2;
		    }

		    return false;

    }

    return false;
}
