// choose on which line and which block you wish to add it
function add_bloc_to_line_p2(line_index, bloc) {
    // Add the bloc instance to the grid
	var manager = instance_find(obj_grid_manager_p2, 0);
    array_push(manager.player_grid[line_index], bloc);

    // Update Y
    bloc.y = line_index * ligne_spacing;

    // Reposition the entire line
    reposition_line_p2(line_index);
}
