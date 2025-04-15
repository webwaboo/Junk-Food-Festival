grid_lines = 6; // number of horizontal lines
player_grid = array_create(grid_lines); // 1 array per line
bloc_timer = 420; // 7 secondes à 60 fps
bloc_timer_max = 420; // pour réutiliser
// offset des elements on-screen
x_start = 96; // ou n’importe où tu veux placer le plateau
y_start = 96;



// Create empty arrays for each line
for (var i = 0; i < grid_lines; i++) {
    player_grid[i] = [];
}

// Define line spacing and left start position for blocks
ligne_spacing = 32; 
//x_start = 0;
bloc_spacing = 0;

for (var i = 0; i < 6; i++) {
    var b = instance_create_layer(0, 0, "Instances", obj_bloc);
    b.bloc_taille = irandom_range(1, 3);
    b.bloc_couleur = choose("rouge", "vert", "bleu");
	b.bloc_owner = "J1";
    set_bloc_sprite(b);

    add_bloc_to_line(i, b);
}
global.game_paused = false;
