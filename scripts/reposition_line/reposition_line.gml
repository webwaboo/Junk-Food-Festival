// reposition a certain line
function reposition_line(line_index) {
    var manager = instance_find(obj_grid_manager, 0);
	var line = manager.player_grid[line_index];
    var xpos = manager.x_start;

    for (var i = 0; i < array_length(line); i++) {
        var bloc = line[i];
        var width = 16 * bloc.bloc_taille;
        
        bloc.x = xpos;
		bloc.y = manager.y_start+ line_index * manager.ligne_spacing;
        xpos += width + manager.bloc_spacing;
    }
}
