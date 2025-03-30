function find_next_available_line_p2(from_line, bloc_size, direction) {
    var manager = instance_find(obj_grid_manager_p2, 0);
    var grid = manager.player_grid;

    if (direction > 0) { // Going DOWN
        for (var i = from_line + 1; i < array_length(grid); i++) {
            if (get_line_total(i) + bloc_size <= 12) {
                return i;
            }
        }
    } else if (direction < 0) { // Going UP
        for (var i = from_line - 1; i >= 0; i--) {
            if (get_line_total(i) + bloc_size <= 12) {
                return i;
            }
        }
    }

    return -1; // No available line found
}
