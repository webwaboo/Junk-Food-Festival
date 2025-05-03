//check if gameover or paused
if (global.game_paused) exit;
if (is_game_over()) exit;

if (success_check != undefined && success_check()) {
    if (!instance_exists(obj_tuto_success_menu)) {
        instance_create_layer(0, 0, "GUI", obj_tuto_success_menu);
    }
}

if (room == rm_tuto_9 && global.tuto_round_timer > 0) {
    global.tuto_round_timer--;
}

if (room == rm_tuto_8 && !global.clash_occurred) {
    global.clash_auto_timer--;

    if (global.clash_auto_timer == 0) {
        // Envoi auto du bloc J2
        var manager = instance_find(obj_grid_manager_p2, 0);
        if (instance_exists(manager)) {
            var grid = manager.player_grid;
            var ligne_index = 2; // à adapter selon ta room
            var line = grid[ligne_index];

            // On suppose que le bloc est au début
            if (array_length(line) > 0) {
                var bloc = line[0];
                if (bloc.bloc_taille == 3) {
                    array_delete(line, 0, 1);

                    var clash = instance_create_layer(bloc.x, bloc.y, "Instances", obj_clash_bloc);
                    clash.bloc_couleur = bloc.bloc_couleur;
                    clash.line_index = ligne_index;
                    clash.direction = 180;
                    clash.bloc_owner = "J2";
                    clash.handled = false;

                    clash.sprite_index = bloc.sprite_index;
                    clash.image_index = bloc.image_index;
                    clash.image_xscale = bloc.image_xscale;
                    clash.image_yscale = bloc.image_yscale;

                    with (bloc) instance_destroy();

                    reposition_line_p2(ligne_index);
                }
            }
        }
    }
}
