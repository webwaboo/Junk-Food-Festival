function move_bloc_to_line_p2(bloc, from_line, to_line) {
    if (bloc == noone || !instance_exists(bloc)) return false;

    var manager = instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(manager)) return false;

    var grid = manager.player_grid;

    if (from_line < 0 || from_line >= array_length(grid)) return false;
    if (to_line < 0 || to_line >= array_length(grid)) return false;

    var from_array = grid[from_line];
    var to_array   = grid[to_line];

    clean_line(from_array);
    clean_line(to_array);

    // Vérifie que le bloc appartient bien à la ligne source
    var index = array_index_of(from_array, bloc);
    if (index == -1) return false;

    // Vérifie capacité de la ligne cible
    var total = get_line_total_p2(to_line);
    if (total + bloc.bloc_taille > 12) return false;

    // Retirer le bloc de la ligne d’origine
    array_delete(from_array, index, 1);

    // Ajouter au début de la ligne cible (vers le corps)
    array_insert(to_array, 0, bloc);

    // Mise à jour visuelle
    bloc.y = manager.y_start + to_line * manager.ligne_spacing;

    // Réalignement visuel
    reposition_line_p2(from_line);
    reposition_line_p2(to_line);

    return true;
}
