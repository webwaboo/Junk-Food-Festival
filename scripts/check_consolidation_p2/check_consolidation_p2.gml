function check_consolidation_p2(line_index) {
    var manager = instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;
    var line = grid[line_index];

    var count = array_length(line);
    if (count < 2) return;

	

// On parcourt la ligne de droite à gauche
    for (var i = 0; i < count - 1; i++) {

		var bloc1 = line[i];
		var bloc2 = line[i + 1];




        if (bloc1.bloc_couleur == bloc2.bloc_couleur) {
			//var pour la taille totale des 2 blocs
			var total_taille = bloc1.bloc_taille + bloc2.bloc_taille;
			
            if (total_taille <= 3) {
                var bloc_couleur = bloc1.bloc_couleur;

                with (bloc1) instance_destroy();
                with (bloc2) instance_destroy();

                array_delete(line, i, 1);
                array_delete(line, i - 1, 1);

                var new_bloc = instance_create_layer(0, 0, "Instances", obj_bloc);
                new_bloc.bloc_taille = total_taille;
                new_bloc.bloc_couleur = bloc_couleur;
                set_bloc_sprite(new_bloc);

                // On l'insère à la place du bloc2 (qui était plus à gauche)
                array_insert(line, i-1, new_bloc);
                new_bloc.y = line_index * manager.ligne_spacing;

                reposition_line_p2(line_index);

                return; // Une seule consolidation par frame
            }
        }
    }
	
	
}
