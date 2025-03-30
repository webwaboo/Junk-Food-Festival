function find_next_available_line(from_line, bloc_size, direction) {
    var manager = instance_find(obj_grid_manager, 0);
    if (!instance_exists(manager)) return -1;

    var grid = manager.player_grid;

    if (direction > 0) { // 🔽 Vers le bas
        for (var i = from_line + 1; i < array_length(grid); i++) {
            if (get_line_total(i) + bloc_size <= 12) {
                return i;
            }
        }
    } else if (direction < 0) { // 🔼 Vers le haut
        for (var i = from_line - 1; i >= 0; i--) {
            if (get_line_total(i) + bloc_size <= 12) {
                return i;
            }
        }
    }

    return -1; // ❌ Aucune ligne disponible
}
