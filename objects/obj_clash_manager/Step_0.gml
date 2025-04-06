if (is_game_over()) exit;
// Compte les inputs
if (keyboard_check_pressed(ord("D"))) mash_j1++;
if (keyboard_check_pressed(vk_numpad4)) mash_j2++;

clash_timer--;

if (keyboard_check_pressed(ord("D"))) mash_j1++;
if (keyboard_check_pressed(vk_numpad4)) mash_j2++;

clash_timer--;

if (clash_timer <= 0) {
    game_paused = false;

    if (mash_j1 > mash_j2) {
        transfer_both_to("J2", line_index, bloc_couleur_j1, bloc_couleur_j2);
    } else if (mash_j2 > mash_j1) {
        transfer_both_to("J1", line_index, bloc_couleur_j2, bloc_couleur_j1);
    } else {
        // égalité → random
        var winner = choose("J1", "J2");
        var main_color = (winner == "J1") ? bloc_couleur_j1 : bloc_couleur_j2;
        var sec_color = (winner == "J1") ? bloc_couleur_j2 : bloc_couleur_j1;
        transfer_both_to(winner, line_index, main_color, sec_color);
    }

    instance_destroy();
}

