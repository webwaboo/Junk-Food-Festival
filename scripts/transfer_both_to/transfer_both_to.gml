function transfer_both_to(joueur) {
    var grid_manager = (joueur == "J1") ? instance_find(obj_grid_manager, 0)
                                        : instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(grid_manager)) return;

    var grid = grid_manager.player_grid;
    var line = grid[line_index];

    // Crée deux nouveaux blocs "classiques"
    var bloc1 = instance_create_layer(x, y, "Instances", obj_bloc);
	bloc1.bloc_owner = joueur;
    bloc1.bloc_couleur = bloc_couleur;
    bloc1.bloc_taille = 3;
    set_bloc_sprite(bloc1);

    var bloc2 = instance_create_layer(x, y, "Instances", obj_bloc);
	bloc2.bloc_owner = joueur;
    bloc2.bloc_couleur = other.bloc_couleur;
    bloc2.bloc_taille = 3;
    set_bloc_sprite(bloc2);
	clean_line(line);

    // Insertion selon sens du joueur
    if (joueur == "J1") {
        array_insert(line, 0, bloc2);
        array_insert(line, 0, bloc1);
    } else {
        array_insert(line, array_length(line), bloc1);
        array_insert(line, array_length(line), bloc2);
    }

    bloc1.y = line_index * grid_manager.ligne_spacing;
    bloc2.y = line_index * grid_manager.ligne_spacing;

    reposition_line(line_index);
	reposition_line_p2(line_index);


    with (id) instance_destroy();
    with (other.id) instance_destroy();
}
