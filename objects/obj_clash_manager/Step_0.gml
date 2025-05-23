//check if gameover or paused
if (global.game_paused) exit;
if (is_game_over()) exit;

// Compte les inputs
//if (keyboard_check_pressed(global.controls_j1.send)) {
if (input_check_pressed("bloc_send")){
	mash_j1++;
	audio_play_sound(snd_clash_mash, 1, false);
}
if (keyboard_check_pressed(global.controls_j2.send)) {
	mash_j2++;
	audio_play_sound(snd_clash_mash, 1, false);
}


clash_timer--;

/*if (keyboard_check_pressed(ord("D"))) mash_j1++;
if (keyboard_check_pressed(vk_numpad4)) mash_j2++;

clash_timer--;*/

if (clash_timer <= 0) {
    game_paused = false;

    if (mash_j1 > mash_j2) {
        transfer_both_to("J2", line_index, bloc_couleur_j1, bloc_couleur_j2);
		//ajoute score
		if (!tuto_mechanic_enabled("score")) {
			global.score_j1 += 450;
		}
    } else if (mash_j2 > mash_j1) {
        transfer_both_to("J1", line_index, bloc_couleur_j2, bloc_couleur_j1);
		//ajoute score
		if (!tuto_mechanic_enabled("score")) {
			global.score_j2 += 450;
		}
    } else {
        // égalité → random
        var winner = choose("J1", "J2");
        var main_color = (winner == "J1") ? bloc_couleur_j1 : bloc_couleur_j2;
        var sec_color = (winner == "J1") ? bloc_couleur_j2 : bloc_couleur_j1;
        transfer_both_to(winner, line_index, main_color, sec_color);
    }

    instance_destroy();
}

