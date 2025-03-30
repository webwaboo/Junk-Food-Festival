function check_game_over(line_index, joueur) {
    // Ne rien faire si la partie est déjà finie
    if (instance_exists(obj_gameover)) return;

    var manager = (joueur == "J1") 
        ? instance_find(obj_grid_manager, 0) 
        : instance_find(obj_grid_manager_p2, 0);

    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;
    var line = grid[line_index];

    var total = 0;

    for (var i = 0; i < array_length(line); i++) {
        var bloc = line[i];

        if (!instance_exists(bloc)) continue;

        total += bloc.bloc_taille;

        if (total > 12) {
            // Init sécurité si nécessaire
            if (!variable_instance_exists(bloc, "danger_timer")) {
                bloc.danger_timer = -1;
            }

            if (bloc.danger_timer == -1) {
                bloc.danger_timer = 120; // 2 secondes
            } else {
                show_debug_message("Bloc en danger: " + string(bloc.bloc_owner) + " - line " + string(line_index));

				bloc.danger_timer--;

                if (bloc.danger_timer <= 0) {
                    var vainqueur = (joueur == "J1") ? "J2" : "J1";
                    show_debug_message("💀 GAME OVER " + joueur + " → " + vainqueur + " gagne !");
                    
                    var g = instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_gameover);
                    g.vainqueur = vainqueur;

                    return; // On stoppe après détection
                }
            }
        } else {
            // Bloc de retour en zone "safe" → on reset son timer
            if (variable_instance_exists(bloc, "danger_timer")) {
                bloc.danger_timer = -1;
            }
        }
    }
}
