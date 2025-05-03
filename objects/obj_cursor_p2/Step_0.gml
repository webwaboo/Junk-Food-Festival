//check if gameover or paused
if (global.game_paused) exit;
if (is_game_over()) exit;

//pause timer if there is a clash
if (instance_exists(obj_clash_manager)) return; // clash actif → on ne fait rien
var manager = instance_find(obj_grid_manager_p2, 0);
// ==========================
// 🎮 Contrôle vertical
// ==========================
if (!tuto_mechanic_enabled("cursor_move")) {
	if (keyboard_check_pressed(global.controls_j2.up) && ligne_index > 0 || gamepad_button_check_pressed(1, gp_padu) && ligne_index > 0) {
	    ligne_index -= 1;
		audio_play_sound(snd_cursor_move, 1, false);

	}
	if (keyboard_check_pressed(global.controls_j2.down) && ligne_index < 5 && ligne_index < 5 || gamepad_button_check_pressed(1, gp_padd) && ligne_index < 5) {
	    ligne_index += 1;
		audio_play_sound(snd_cursor_move, 1, false);

	}
}

y = manager.y_start + ligne_index * ligne_spacing;
image_alpha = 0.5 + 0.5 * sin(current_time / 100);

// ==========================
// 🔍 Trouver le bloc (J2 lit à l'envers → index 0)
// ==========================
var grid = grid_manager.player_grid;
var current_line = grid[ligne_index];
var bloc = (array_length(current_line) > 0) ? current_line[0] : noone;

// ==========================
// 🧭 Déplacement vertical du bloc
// ==========================
if (!tuto_mechanic_enabled("bloc_move")) {
	if (keyboard_check_pressed(global.controls_j2.bloc_up) && bloc != noone && ligne_index > 0 || gamepad_button_check_pressed(1, gp_face4) && bloc != noone && ligne_index > 0) {
	    var target = find_next_available_line_p2(ligne_index, bloc.bloc_taille, -1);
	    if (target != -1 && move_bloc_to_line_p2(bloc, ligne_index, target)) {
	        ligne_index = target;
			audio_play_sound(snd_bloc_move, 1, false);
	    }
	}
	if (keyboard_check_pressed(global.controls_j2.bloc_down) && bloc != noone && ligne_index < 5 || gamepad_button_check_pressed(1, gp_face1) && bloc != noone && ligne_index < 5) {
	    var target = find_next_available_line_p2(ligne_index, bloc.bloc_taille, 1);
	    if (target != -1 && move_bloc_to_line_p2(bloc, ligne_index, target)) {
	        ligne_index = target;
			audio_play_sound(snd_bloc_move, 1, false);
	    }
	}
}

// ==========================
// 🧃 Envoyer un bloc vers le corps (touche L)
// ==========================
if (keyboard_check_pressed(global.controls_j2.shift) || gamepad_button_check_pressed(1, gp_face2)) {
    var line = grid[ligne_index];
    var count = array_length(line);

    if (count > 1) {
        var bloc_to_move = line[0];
        array_delete(line, 0, 1);
        array_insert(line, array_length(line), bloc_to_move);
        bloc_to_move.y = ligne_index * grid_manager.ligne_spacing;
        reposition_line_p2(ligne_index);
		audio_play_sound(snd_bloc_shift, 1, false);
    }
}

// ==========================
// 🎯 Mise à jour position et échelle du curseur
// ==========================
if (bloc != noone) {
    x = bloc.x;
    y = bloc.y;
    image_xscale = bloc.bloc_taille;
} else {
    x = manager.x_start - 16; // côté droit du terrain
    image_xscale = 1;
}

// ==========================
// 🚀 Envoi de bloc (touche J4
// ==========================
if (keyboard_check(global.controls_j2.send) && bloc != noone || gamepad_button_check(1, gp_face3) && bloc != noone) {
    send_hold_timer_p2++;
	 if (global.sound_send_press_id2 == noone || !audio_is_playing(snd_bloc_send_press)) {
        global.sound_send_press_id2 = audio_play_sound(snd_bloc_send_press, 1, false);
    }


    if (send_hold_timer_p2 == send_hold_threshold_p2 && bloc.bloc_taille == 3) {
        var line = grid[ligne_index];
        array_delete(line, 0, 1);
		if (audio_is_playing(global.sound_send_press_id2)) {
			audio_stop_sound(global.sound_send_press_id2);
			global.sound_send_press_id2 = noone;
        }
		audio_play_sound(snd_bloc_send_release, 1, false);

        var clash = instance_create_layer(bloc.x, bloc.y, "Instances", obj_clash_bloc);
        clash.image_xscale = bloc.bloc_taille;
        clash.bloc_couleur = bloc.bloc_couleur;
        clash.line_index = ligne_index;
        clash.direction = 180; // vers la gauche
        clash.bloc_owner = "J2";
        clash.handled = false;

        clash.sprite_index = bloc.sprite_index;
        clash.image_index = bloc.image_index;
        clash.image_xscale = bloc.image_xscale;
        clash.image_yscale = bloc.image_yscale;

        with (bloc) instance_destroy();
        reposition_line_p2(ligne_index);
    }
} else {
    send_hold_timer_p2 = 0;
	if (audio_is_playing(global.sound_send_press_id2)) {
	        audio_stop_sound(global.sound_send_press_id2);
	        global.sound_send_press_id2 = noone;
	    }
}


// ==========================
// 🧪 Génération d’un bloc aléatoire (touche H)
// ==========================
if (keyboard_check_pressed(ord("H"))) {
    var b = instance_create_layer(0, 0, "Instances", obj_bloc);
    b.bloc_taille = irandom_range(1, 3);
    b.bloc_couleur = choose("rouge", "vert", "bleu");
    b.bloc_owner = "J2";
    set_bloc_sprite(b);
    add_bloc_to_line_p2(irandom_range(0, 5), b);
}

