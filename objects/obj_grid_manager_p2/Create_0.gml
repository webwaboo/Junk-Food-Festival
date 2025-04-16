grid_lines = 6; // number of horizontal lines
player_grid = array_create(grid_lines); // 1 array per line
switch (global.difficulty) {
    case "Easy":    bloc_timer_max = game_get_speed(gamespeed_fps) * 7; break;
    case "Normal":  bloc_timer_max = game_get_speed(gamespeed_fps) * 4; break;
    case "Hard":    bloc_timer_max = game_get_speed(gamespeed_fps) * 2; break;
}
bloc_timer = bloc_timer_max

// offset des elements on-screen
y_start = 96;

// Create empty arrays for each line
for (var i = 0; i < grid_lines; i++) {
    player_grid[i] = [];
}

// Define line spacing and left start position for blocks
ligne_spacing = 32; 
x_start = 544;
bloc_spacing = 0;

for (var i = 0; i < 6; i++) {
    var b = instance_create_layer(0, 0, "Instances", obj_bloc);
    b.bloc_taille = irandom_range(1, 3);
    b.bloc_couleur = choose("rouge", "vert", "bleu");
	b.bloc_owner = "J2";
    set_bloc_sprite(b);

    add_bloc_to_line_p2(i, b);
}
global.game_paused = false;
