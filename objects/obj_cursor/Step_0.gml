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
// 🎮 Contrôle vertical
// ==========================
if (!tuto_mechanic_enabled("cursor_move")) {
	if (keyboard_check_pressed(global.controls_j1.up) && ligne_index > 0 || gamepad_button_check_pressed(0, gp_padu) && ligne_index > 0) {
	    ligne_index -= 1;
		audio_play_sound(snd_cursor_move, 1, false);
	}
	if (keyboard_check_pressed(global.controls_j1.down) && ligne_index < 5 || gamepad_button_check_pressed(0, gp_padd) && ligne_index < 5) {
	    ligne_index += 1;
		audio_play_sound(snd_cursor_move, 1, false);
	}
}


// Position Y basée sur l’index
y = grid_manager.y_start+ ligne_index * ligne_spacing;

// Clignotement visuel
image_alpha = 0.5 + 0.5 * sin(current_time / 100);

// ==========================
// 🔍 Trouver le bloc sur la ligne actuelle
// ==========================
var grid = grid_manager.player_grid;
var current_line = grid[ligne_index];
var bloc = (array_length(current_line) > 0) 
    ? current_line[array_length(current_line) - 1] 
    : noone;

// ==========================
// 🧭 Déplacement vertical du bloc
// ==========================
if (!tuto_mechanic_enabled("bloc_move")) {
	if (keyboard_check_pressed(global.controls_j1.bloc_up) && bloc != noone && ligne_index > 0 || gamepad_button_check_pressed(0, gp_face4) && bloc != noone && ligne_index > 0) {
	    var target = find_next_available_line(ligne_index, bloc.bloc_taille, -1);
	    if (target != -1 && move_bloc_to_line(bloc, ligne_index, target)) {
	        ligne_index = target;
			audio_play_sound(snd_bloc_move, 1, false);

	    }
	}
	if (keyboard_check_pressed(global.controls_j1.bloc_down) && bloc != noone && ligne_index < 5 || gamepad_button_check_pressed(0, gp_face1) && bloc != noone && ligne_index < 5) {
	    var target = find_next_available_line(ligne_index, bloc.bloc_taille, 1);
	    if (target != -1 && move_bloc_to_line(bloc, ligne_index, target)) {
	        ligne_index = target;
			audio_play_sound(snd_bloc_move, 1, false);
	    }
	}
}


// ==========================
// 🧃 Envoi vers le corps (touche A)
// ==========================
if (!tuto_mechanic_enabled("shift")) {
	if (keyboard_check_pressed(global.controls_j1.shift) || gamepad_button_check_pressed(0, gp_face3)) {
	    var line = grid[ligne_index];
	    var count = array_length(line);

	    if (count > 1) {
	        var bloc_to_move = line[count - 1];
	        array_delete(line, count - 1, 1);
	        array_insert(line, 0, bloc_to_move);
	        bloc_to_move.y = ligne_index * grid_manager.ligne_spacing;
	        reposition_line(ligne_index);
			audio_play_sound(snd_bloc_shift, 1, false);
	    }
	}
}


// ==========================
// 🎯 Mise à jour visuelle du curseur
// ==========================
if (bloc != noone) {
    x = bloc.x;
    y = bloc.y;
    image_xscale = bloc.bloc_taille;
} else {
    x = grid_manager.x_start;
    image_xscale = 1;
}

// ==========================
// 🚀 Envoi du bloc (touche D)
// ==========================
if (!tuto_mechanic_enabled("send")) {
	if (keyboard_check(global.controls_j1.send) && bloc != noone || gamepad_button_check(0, gp_face2) && bloc != noone) {
	    send_hold_timer++;
	 if (global.sound_send_press_id == noone || !audio_is_playing(snd_bloc_send_press)) {
	        global.sound_send_press_id = audio_play_sound(snd_bloc_send_press, 1, false);
	    }

	    if (send_hold_timer == send_hold_threshold && bloc.bloc_taille == 3) {
	        var line = grid[ligne_index];
	        array_delete(line, array_length(line) - 1, 1);
			if (audio_is_playing(global.sound_send_press_id)) {
				audio_stop_sound(global.sound_send_press_id);
				global.sound_send_press_id = noone;
	        }
			audio_play_sound(snd_bloc_send_release, 1, false);

	        var clash = instance_create_layer(bloc.x, bloc.y, "Instances", obj_clash_bloc);
	        clash.image_xscale = bloc.bloc_taille;
	        clash.bloc_couleur = bloc.bloc_couleur;
	        clash.line_index = ligne_index;
	        clash.direction = 0; // vers la droite
	        clash.bloc_owner = "J1";
	        clash.handled = false;

	        clash.sprite_index = bloc.sprite_index;
	        clash.image_index = bloc.image_index;
	        clash.image_xscale = bloc.image_xscale;
	        clash.image_yscale = bloc.image_yscale;

	        with (bloc) instance_destroy();
	        reposition_line(ligne_index);
	    }
	} else {
	    send_hold_timer = 0;
		 if (audio_is_playing(global.sound_send_press_id)) {
	        audio_stop_sound(global.sound_send_press_id);
	        global.sound_send_press_id = noone;
	    }
	}
}



// ==========================
// 🧪 Génération d’un bloc aléatoire (touche G)
// ==========================
if (keyboard_check_pressed(ord("G"))) {
    var b = instance_create_layer(0, 0, "Instances", obj_bloc);
    b.bloc_taille = irandom_range(1, 3);
    b.bloc_couleur = choose("rouge", "vert", "bleu");
    b.bloc_owner = "J1";
    set_bloc_sprite(b);

    add_bloc_to_line(irandom_range(0, 5), b);
}


// ==========================
// One-hand Mode
// ==========================

/*var now = current_time;
var grid_lines = array_length(grid_manager.player_grid)


if (global.one_hand_mode) {
    // Gestion du curseur J1 avec une main
	// Haut
    if (keyboard_check_pressed(vk_up)) {
        press_time_up = now;
    }
    if (keyboard_check_released(vk_up)) {
        var duration = (now - press_time_up) / 1000;
        if (duration < 0.5) {
            ligne_index = max(0, ligne_index - 1); // déplacement curseur
        } else {
             var target = find_next_available_line(ligne_index, bloc.bloc_taille, -1);
		    if (target != -1 && move_bloc_to_line(bloc, ligne_index, target)) {
		        ligne_index = target;
				audio_play_sound(snd_bloc_move, 1, false);
			}
        }
    }
	
	// Bas
    if (keyboard_check_pressed(vk_down)) {
        press_time_down = now;
    }
    if (keyboard_check_released(vk_down)) {
        var duration = (now - press_time_down) / 1000;
        if (duration < 0.5) {
            ligne_index = min(grid_lines - 1, ligne_index + 1); // déplacement curseur
        } else {
            var target = find_next_available_line(ligne_index, bloc.bloc_taille, 1);
		    if (target != -1 && move_bloc_to_line(bloc, ligne_index, target)) {
		        ligne_index = target;
				audio_play_sound(snd_bloc_move, 1, false);
		    }
        }
    }
	
    

    // Shift (flèche gauche)
	if (keyboard_check_pressed(vk_left)) {
	    var line = grid[ligne_index];
	    var count = array_length(line);

	    if (count > 1) {
	        var bloc_to_move = line[count - 1];
	        array_delete(line, count - 1, 1);
	        array_insert(line, 0, bloc_to_move);
	        bloc_to_move.y = ligne_index * grid_manager.ligne_spacing;
	        reposition_line(ligne_index);
			audio_play_sound(snd_bloc_shift, 1, false);
	    }
	}

    // Envoi (flèche droite)
	if (keyboard_check(vk_right) && bloc != noone) {
    send_hold_timer++;
    
    // Son de charge
    if (send_hold_timer == 1) {
        if (global.sound_send_press_id == noone || !audio_is_playing(global.sound_send_press_id)) {
            global.sound_send_press_id = audio_play_sound(snd_bloc_send_press, 1, true);
        }
    }

    // Envoi du bloc
    if (send_hold_timer == send_hold_threshold && bloc.bloc_taille == 3) {
        var line = grid[ligne_index];
        array_delete(line, array_length(line) - 1, 1);

        if (audio_is_playing(global.sound_send_press_id)) {
            audio_stop_sound(global.sound_send_press_id);
            global.sound_send_press_id = noone;
        }
        audio_play_sound(snd_bloc_send_release, 1, false);

        var clash = instance_create_layer(bloc.x, bloc.y, "Instances", obj_clash_bloc);
        clash.image_xscale = bloc.bloc_taille;
        clash.bloc_couleur = bloc.bloc_couleur;
        clash.line_index = ligne_index;
        clash.direction = 0;
        clash.bloc_owner = "J1";
        clash.handled = false;

        clash.sprite_index = bloc.sprite_index;
        clash.image_index = bloc.image_index;
        clash.image_xscale = bloc.image_xscale;
        clash.image_yscale = bloc.image_yscale;

        with (bloc) instance_destroy();
        reposition_line(ligne_index);
    }
	}
} else {
    send_hold_timer = 0;
    if (audio_is_playing(global.sound_send_press_id)) {
        audio_stop_sound(global.sound_send_press_id);
        global.sound_send_press_id = noone;
    }
}
*/

// debug game over
if (keyboard_check_pressed(ord("B"))) {
	instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_gameover);
}

//This shall display a pause menu
if (keyboard_check_pressed(vk_escape)) {
    room_goto(rm_menu)
}