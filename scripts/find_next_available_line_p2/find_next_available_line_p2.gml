function find_next_available_line_p2(from_line, bloc_size, direction) {
    var manager = instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(manager)) return -1;

    var grid = manager.player_grid;

    if (direction > 0) { // 🔽 Vers le bas
        for (var i = from_line + 1; i < array_length(grid); i++) {
            if (get_line_total_p2(i) + bloc_size <= 12) {
                return i;
            }
        }
    } else if (direction < 0) { // 🔼 Vers le haut
        for (var i = from_line - 1; i >= 0; i--) {
            if (get_line_total_p2(i) + bloc_size <= 12) {
                return i;
            }
        }
    }

    return -1; // ❌ Aucune ligne valide trouvée
}
