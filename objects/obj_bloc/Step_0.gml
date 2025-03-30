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
// Clignotement si bloc de taille 3, en digestion, en 1ère position
if (
    bloc_taille == 3 &&
    digestion_timer > 0 &&
    digestion_timer <= 180 &&
    is_first_in_line
) {
    image_alpha = 0.5 + 0.5 * sin(current_time / 150);
} else {
    image_alpha = 1;
}

// ==========================
// 💀 ZONE DE CLASH → GAME OVER
// ==========================

// Init sécurité si pas défini
if (!variable_instance_exists(id, "bloc_owner")) bloc_owner = "none";
if (!variable_instance_exists(id, "danger_timer")) danger_timer = -1;

// Zone de danger pour joueur 1
if (bloc_owner == "P1" && x > 432) {
    if (danger_timer == -1) danger_timer = 120;
    else {
        danger_timer--;
        if (danger_timer <= 0) {
            show_debug_message("💀 GAME OVER J1 !");
            // instance_create_layer(...); // Tu peux ici ajouter un objet de fin
        }
    }
}
// Zone de danger pour joueur 2
else if (bloc_owner == "P2" && x < 16) {
    if (danger_timer == -1) danger_timer = 120;
    else {
        danger_timer--;
        if (danger_timer <= 0) {
            show_debug_message("💀 GAME OVER J2 !");
        }
    }
}
else {
    // Bloc hors de la zone de danger → reset du timer
    danger_timer = -1;
}
