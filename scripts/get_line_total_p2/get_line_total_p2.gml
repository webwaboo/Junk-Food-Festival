function get_line_total_p2(line_index) {
    var manager = instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(manager)) return 0;

    var grid = manager.player_grid;
    if (line_index < 0 || line_index >= array_length(grid)) return 0;

    var total = 0;
    var line = grid[line_index];

    for (var i = 0; i < array_length(line); i++) {
        var bloc = line[i];

        if (instance_exists(bloc)) {
            total += bloc.bloc_taille;
        }
    }

    return total;
}
