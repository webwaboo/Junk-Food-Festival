//check if gameover or paused
if (global.game_paused) exit;
if (is_game_over()) exit;

if (!global.game_paused) {
    timer_frame++;

    if (timer_frame >= room_speed) {
        timer_frame = 0;
        global.timer_seconds--;

        if (global.timer_seconds <= 0) {
            // Fin du temps → déterminer le gagnant
            global.timer_seconds = 0;
            global.game_paused = true;

            var winner = "J1";
            if (global.score_j2 > global.score_j1) {
                winner = "J2";
            }

            instance_create_layer(0, 0, "Instances", obj_gameover).vainqueur = winner;
        }
    }
}
