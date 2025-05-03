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


		// Ajoute les autres niveaux ici (rm_tuto_3, etc.)
		

    }

    return false;
}
