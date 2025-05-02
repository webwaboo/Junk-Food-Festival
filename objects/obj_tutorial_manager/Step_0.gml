//check if gameover or paused
if (global.game_paused) exit;
if (is_game_over()) exit;

if (success_check != undefined && success_check()) {
    if (!instance_exists(obj_tuto_success_menu)) {
        instance_create_layer(0, 0, "GUI", obj_tuto_success_menu);
    }
}


