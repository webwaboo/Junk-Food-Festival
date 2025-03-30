function send_to_enemy_line(joueur, line_index, bloc_couleur) {
    var manager = (joueur == "J1") 
        ? instance_find(obj_grid_manager, 0)
        : instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;
    var line = grid[line_index];

    // 🔹 Nettoyage préventif pour éviter les blocs détruits encore référencés
    clean_line(line);

    // 🔹 Création d'un nouveau bloc
    var new_bloc = instance_create_layer(0, 0, "Instances", obj_bloc);
    new_bloc.bloc_taille = 3;
    new_bloc.bloc_couleur = bloc_couleur;
    new_bloc.bloc_owner = joueur;
    new_bloc.digestion_timer = -1;
    set_bloc_sprite(new_bloc);

    new_bloc.y = line_index * manager.ligne_spacing;

    // 🔹 Insertion côté clash :
    // J1 → droite = fin de l’array
    // J2 → gauche = début de l’array
    if (joueur == "J1") {
        array_insert(line, 0, new_bloc);
    } else {
        array_insert(line, array_length(line), new_bloc);
    }

    // 🔹 Mise à jour visuelle
    if (joueur == "J1") {
        reposition_line(line_index);
    } else {
        reposition_line_p2(line_index);
    }
}
