var is_first_in_line = false;

// Vérifie si le bloc est à l'index 0 de n'importe quelle ligne
var manager = instance_find(obj_grid_manager, 0);
if (instance_exists(manager)) {
    var grid = manager.player_grid;

    for (var i = 0; i < array_length(grid); i++) {
        if (array_length(grid[i]) > 0 && grid[i][0] == id) {
            is_first_in_line = true;
            break;
        }
    }
}

// Vérifie si le bloc est à l'index 0 de n'importe quelle ligne
var manager_p2 = instance_find(obj_grid_manager_p2, 0);
if (instance_exists(manager_p2)) {
    var grid = manager_p2.player_grid;

    for (var i = 0; i < array_length(grid); i++) {
        if (array_length(grid[i]) > 0 && grid[i][0] == id) {
            is_first_in_line = true;
            break;
        }
    }
}

if (
    bloc_taille == 3 &&
    digestion_timer > 0 &&
    digestion_timer <= 180 &&
    is_first_in_line
) {
	// Clignotement lent
    image_alpha = 0.5 + 0.5 * sin(current_time / 150);
} else {
	// Opacité normale sinon
    image_alpha = 1;
}

//clignotement des blocs entrain d'etre digéré
/*if (bloc_taille == 3 && digestion_timer > 0) {
    // Clignotement lent
    image_alpha = 0.5 + 0.5 * sin(current_time / 150);
} else {
    // Opacité normale sinon
    image_alpha = 1;
}*/
//clignotement des blocs entrain d'etre digéré