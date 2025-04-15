// choose on which line and which block you wish to add it
function add_bloc_to_line(line_index, bloc) {
    // Add the bloc instance to the grid
	var manager = instance_find(obj_grid_manager, 0);
    array_push(manager.player_grid[line_index], bloc);

    // Update Y
    bloc.y = manager.y_start + line_index * ligne_spacing;

    // Reposition the entire line
    reposition_line(line_index);
}
