function transfer_both_to(joueur, line_index, color1, color2) {
    var grid_manager = (joueur == "J1") 
        ? instance_find(obj_grid_manager, 0)
        : instance_find(obj_grid_manager_p2, 0);

    if (!instance_exists(grid_manager)) return;

    var grid = grid_manager.player_grid;
    var line = grid[line_index];

    // Nettoyage préventif
    clean_line(line);

    // Crée deux blocs classiques à partir des 2 clash blocs
    var bloc1 = instance_create_layer(x, y, "Instances", obj_bloc);
    bloc1.bloc_owner = joueur;
    bloc1.bloc_couleur = color1;
    bloc1.bloc_taille = 3;
    set_bloc_sprite(bloc1);

    var bloc2 = instance_create_layer(other.x, other.y, "Instances", obj_bloc);
    bloc2.bloc_owner = joueur;
    bloc2.bloc_couleur = color2;
    bloc2.bloc_taille = 3;
    set_bloc_sprite(bloc2);

    // Insertion dans l'array selon le sens du joueur
    if (joueur == "J1") {
        array_insert(line, 0, bloc2);
        array_insert(line, 0, bloc1);
    } else {
        array_insert(line, array_length(line), bloc1);
        array_insert(line, array_length(line), bloc2);
    }

    bloc1.y = line_index * grid_manager.ligne_spacing;
    bloc2.y = line_index * grid_manager.ligne_spacing;

    // Repositionnement de la ligne
    if (joueur == "J1") {
        reposition_line(line_index);
    } else {
        reposition_line_p2(line_index);
    }

    // Destruction des blocs clash
    with (id) instance_destroy();
    with (other.id) instance_destroy();
}
