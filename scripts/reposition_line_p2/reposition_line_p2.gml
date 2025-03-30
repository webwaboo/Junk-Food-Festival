function reposition_line_p2(line_index) {
    var manager = instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;
    var line = grid[line_index];

    // 🔒 Nettoyage défensif (supprime les blocs détruits)
    clean_line(line);

    var xpos = manager.x_start;

    // 🔁 Parcourt la ligne en sens inverse (de droite à gauche)
    for (var i = array_length(line) - 1; i >= 0; i--) {
        var bloc = line[i];
        if (!instance_exists(bloc)) continue;

        var width = 16 * bloc.bloc_taille;

        xpos -= width;
        bloc.x = xpos;
        bloc.y = line_index * manager.ligne_spacing;

        xpos -= manager.bloc_spacing;
    }
}
