function reposition_line_p2(line_index) {
    var manager = instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;
    var line = grid[line_index];

    var xpos = manager.x_start;

    // Parcourt la ligne à l'envers : de droite à gauche
    for (var i = array_length(line) - 1; i >= 0; i--) {
        var bloc = line[i];
        var width = 16 * bloc.bloc_taille;

        xpos -= width;
        bloc.x = xpos;

        xpos -= manager.bloc_spacing;
    }
}
//array_length(line) - 1