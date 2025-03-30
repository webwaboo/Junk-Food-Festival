function move_bloc_to_line_p2(bloc, from_line, to_line) {
    if (bloc == noone) return; // Block is invalid, stop here

    var manager = instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;

    // Check array bounds
    if (from_line < 0 || from_line >= array_length(grid)) return;
    if (to_line < 0 || to_line >= array_length(grid)) return;
	
	// Capacity check
	var current_total = get_line_total_p2(to_line);
	if (current_total + bloc.bloc_taille > 12) {
	    return false; // Not enough room
	}
		
    // Defensive: check if the bloc is actually in the from_line
    var index = -1;
    var line = grid[from_line];
    for (var i = 0; i < array_length(line); i++) {
        if (line[i] == bloc) {
            index = i;
            break;
        }
    }

    if (index == -1) return false; // bloc not found, don't do anything

    // Remove from old line
    array_delete(grid[from_line], index, 1);
	
	// Check if the destination line has enough room
	if (current_total + bloc.bloc_taille > 12) {
		return; // Not enough space → cancel move
	}


    // Add to new line
	array_insert(grid[to_line], 0, bloc); // ✅ ajoute au début (vers [0])


    // Move visually
    bloc.y = to_line * manager.ligne_spacing;

    // Reposition lines
    reposition_line_p2(from_line);
    reposition_line_p2(to_line);
	
	return true; //success
}
