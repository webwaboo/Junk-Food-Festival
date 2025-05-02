//check if gameover or paused
if (global.game_paused) exit;
if (is_game_over()) exit;

//check if in tutorial
if (global.tutorial_mode) {
    var t = instance_find(obj_tutorial_manager, 0);
    if (instance_exists(t) && !t.controls_enabled.cursor) {
        exit;
    }
}


//pause timer if there is a clash
if (instance_exists(obj_clash_manager)) return; // clash actif → on ne fait rien


// ==========================
// 🔁 CLIGNOTEMENT DIGESTION
// ==========================
var is_first_in_line = false;

// Vérifie si le bloc est en 1ère position sur une ligne du joueur 1
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


var manager_p2 = instance_find(obj_grid_manager_p2, 0);
if (instance_exists(manager_p2)) {
    var grid = manager_p2.player_grid;
    for (var i = 0; i < array_length(grid); i++) {
        var l = grid[i];
        if (array_length(l) > 0 && l[array_length(l) - 1] == id) {
            is_first_in_line = true;
            break;
        }
    }
}

// Clignotement digestion (prioritaire)
if (
    bloc_taille == 3 &&
    digestion_timer > 0 &&
    digestion_timer <= 180 &&
    is_first_in_line
) {
    image_alpha = 0.5 + 0.5 * sin(current_time / 150); // digestion clignote lentement
}
// Sinon, clignotement danger
else if (danger_timer > 0) {
    image_alpha = 0.5 + 0.5 * sin(current_time / 100); // danger clignote plus vite
}
// Sinon, opacité normale
else {
    image_alpha = 1;
}