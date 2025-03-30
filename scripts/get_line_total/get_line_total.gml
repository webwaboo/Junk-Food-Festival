function get_line_total(line_index) {
    var manager = instance_find(obj_grid_manager, 0);
    var grid = manager.player_grid;
    var total = 0;

    var line = grid[line_index];
    for (var i = 0; i < array_length(line); i++) {
        var bloc = line[i];
        total += bloc.bloc_taille; // taille = 1, 2 or 3
    }

    return total;
}
