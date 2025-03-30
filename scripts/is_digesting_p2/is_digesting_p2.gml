function is_digesting_p2() {
    var manager = instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(manager)) return false;

    var grid = manager.player_grid;

    for (var i = 0; i < array_length(grid); i++) {
        var line = grid[i];

        if (array_length(line) > 0) {
            var last_bloc = line[array_length(line) - 1];

            if (instance_exists(last_bloc) &&
                last_bloc.bloc_taille == 3 &&
                last_bloc.digestion_timer > 0) {
                return true; // ✅ Un bloc est en cours de digestion
            }
        }
    }

    return false; // ❌ Aucun bloc en digestion
}
