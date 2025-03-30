function is_digesting() {
    var manager = instance_find(obj_grid_manager, 0);
    if (!instance_exists(manager)) return false;

    var grid = manager.player_grid;

    for (var i = 0; i < array_length(grid); i++) {
        var line = grid[i];

        if (array_length(line) > 0) {
            var first_bloc = line[0];

            if (instance_exists(first_bloc) &&
                first_bloc.bloc_taille == 3 &&
                first_bloc.digestion_timer > 0) {
                return true; // ✅ Digestion détectée
            }
        }
    }

    return false; // ❌ Aucun bloc en digestion
}
