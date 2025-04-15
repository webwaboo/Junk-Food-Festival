function move_bloc_to_line(bloc, from_line, to_line) {
    if (bloc == noone || !instance_exists(bloc)) return false;

    var manager = instance_find(obj_grid_manager, 0);
    if (!instance_exists(manager)) return false;

    var grid = manager.player_grid;

    // Vérifie que les indices de ligne sont valides
    if (from_line < 0 || from_line >= array_length(grid)) return false;
    if (to_line < 0 || to_line >= array_length(grid)) return false;

    var from_array = grid[from_line];
    var to_array   = grid[to_line];

    clean_line(from_array);
    clean_line(to_array);

    // Vérifie si le bloc est bien dans la ligne de départ
    var index = array_index_of(from_array, bloc);
    if (index == -1) return false;

    // Vérifie la capacité de la ligne d’arrivée
    var total = get_line_total(to_line);
    if (total + bloc.bloc_taille > 12) return false;

    // Retirer le bloc
    array_delete(from_array, index, 1);

    // Ajouter à la fin de la nouvelle ligne (côté "droit")
    array_push(to_array, bloc);

    // Mettre à jour la position Y
    bloc.y = manager.y_start + to_line * manager.ligne_spacing;

    // Réalignement visuel
    reposition_line(from_line);
    reposition_line(to_line);

    return true;
}
