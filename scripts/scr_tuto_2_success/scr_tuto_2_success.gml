function scr_tuto_2_success() {

var top_reached = false;
var bottom_reached = false;

var manager = instance_find(obj_grid_manager, 0);
if (instance_exists(manager)) {
    var grid = manager.player_grid;
    for (var i = 0; i < array_length(grid); i++) {
        var line = grid[i];
        for (var j = 0; j < array_length(line); j++) {
            var bloc = line[j];
            if (!instance_exists(bloc)) continue;
            if (bloc.bloc_owner == "J1") {
                if (i == 0) top_reached = true;
                if (i == array_length(grid) - 1) bottom_reached = true;
            }
        }
    }
}

return top_reached && bottom_reached;

}
