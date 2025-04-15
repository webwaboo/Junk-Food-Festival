function check_score_victory() {
    if (global.score_j1 >= 15000) {
        if (!global.game_paused) {
            instance_create_layer(0, 0, "Instances", obj_gameover).vainqueur = "J1";
            global.game_paused = true;
        }
    }
    else if (global.score_j2 >= 15000) {
        if (!global.game_paused) {
            instance_create_layer(0, 0, "Instances", obj_gameover).vainqueur = "J2";
            global.game_paused = true;
        }
    }
}
