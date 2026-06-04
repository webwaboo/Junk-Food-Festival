//set up controls, cursor alignement/blinking
//check if gameover or paused
if (global.game_paused) exit;
if (is_game_over()) exit;

//pause timer if there is a clash
if (instance_exists(obj_clash_manager)) return; // clash actif → on ne fait rien


if (!instance_exists(grid_manager)) {
    grid_manager = instance_find(obj_grid_manager_p2, 0);
}

var manager = grid_manager;
if (!instance_exists(manager)) return;

if (variable_global_exists("p2_ai_enabled")) {
    ai_enabled = global.p2_ai_enabled;
}

var using_ai = ai_enabled && !string_starts_with(room_get_name(room), "rm_tuto_");
var grid = manager.player_grid;

if (!using_ai) {
    if (!tuto_mechanic_enabled("cursor_move")) {
        if ((keyboard_check_pressed(global.controls_j2.up) || gamepad_button_check_pressed(1, gp_padu)) && ligne_index > 0) {
            ligne_index -= 1;
            audio_play_sound(snd_cursor_move, 1, false);
        }

        if ((keyboard_check_pressed(global.controls_j2.down) || gamepad_button_check_pressed(1, gp_padd)) && ligne_index < manager.grid_lines - 1) {
            ligne_index += 1;
            audio_play_sound(snd_cursor_move, 1, false);
        }
    }
}

ligne_index = clamp(ligne_index, 0, manager.grid_lines - 1);
y = manager.y_start + ligne_index * ligne_spacing;
image_alpha = 0.5 + 0.5 * sin(current_time / 100);


var current_line = grid[ligne_index];
clean_line(current_line);
var bloc = (array_length(current_line) > 0) ? current_line[0] : noone;


if (!using_ai) {
    if (!tuto_mechanic_enabled("bloc_move")) {
        if ((keyboard_check_pressed(global.controls_j2.bloc_up) || gamepad_button_check_pressed(1, gp_face4)) && bloc != noone && ligne_index > 0) {
            var target_up = find_next_available_line_p2(ligne_index, bloc.bloc_taille, -1);
            if (target_up != -1 && move_bloc_to_line_p2(bloc, ligne_index, target_up)) {
                ligne_index = target_up;
                audio_play_sound(snd_bloc_move, 1, false);
            }
        }


        if ((keyboard_check_pressed(global.controls_j2.bloc_down) || gamepad_button_check_pressed(1, gp_face1)) && bloc != noone && ligne_index < manager.grid_lines - 1) {
            var target_down = find_next_available_line_p2(ligne_index, bloc.bloc_taille, 1);
            if (target_down != -1 && move_bloc_to_line_p2(bloc, ligne_index, target_down)) {
                ligne_index = target_down;
                audio_play_sound(snd_bloc_move, 1, false);
            }
        }
    }

    ligne_index = clamp(ligne_index, 0, manager.grid_lines - 1);
    y = manager.y_start + ligne_index * ligne_spacing;

    current_line = grid[ligne_index];
    clean_line(current_line);
    bloc = (array_length(current_line) > 0) ? current_line[0] : noone;

    if (keyboard_check_pressed(global.controls_j2.shift) || gamepad_button_check_pressed(1, gp_face2)) {
        var line_shift = current_line;
        var count_shift = array_length(line_shift);


        if (count_shift > 1) {
            var bloc_to_move = line_shift[0];
            array_delete(line_shift, 0, 1);
            array_insert(line_shift, array_length(line_shift), bloc_to_move);
            bloc_to_move.y = manager.y_start + ligne_index * manager.ligne_spacing;
            reposition_line_p2(ligne_index);
            audio_play_sound(snd_bloc_shift, 1, false);
        }
    }

    if ((keyboard_check(global.controls_j2.send) || gamepad_button_check(1, gp_face3)) && bloc != noone && instance_exists(bloc)) {
        send_hold_timer_p2++;

        if (global.sound_send_press_id2 == noone || !audio_is_playing(global.sound_send_press_id2)) {
            global.sound_send_press_id2 = audio_play_sound(snd_bloc_send_press, 1, false);
        }

        var _min_send_p2 = (global.send2_j2_timer > 0) ? 2 : 3;
        if (send_hold_timer_p2 >= send_hold_threshold_p2 && bloc.bloc_taille >= _min_send_p2) {
            var line_send = current_line;
            array_delete(line_send, 0, 1);

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

            send_hold_timer_p2 = 0;
            bloc = noone;
        }
    } else {
        send_hold_timer_p2 = 0;

        if (audio_is_playing(global.sound_send_press_id2)) {
            audio_stop_sound(global.sound_send_press_id2);
            global.sound_send_press_id2 = noone;
        }

    }

    if (keyboard_check_pressed(ord("H"))) {
        var b = instance_create_layer(0, 0, "Instances", obj_bloc);
        b.bloc_taille = irandom_range(1, 3);
        b.bloc_couleur = choose("rouge", "vert", "bleu");
        b.bloc_owner = "J2";
        set_bloc_sprite(b);
        add_bloc_to_line_p2(irandom_range(0, manager.grid_lines - 1), b);
    }
} else {
    send_hold_timer_p2 = 0;


    if (audio_is_playing(global.sound_send_press_id2)) {
        audio_stop_sound(global.sound_send_press_id2);
        global.sound_send_press_id2 = noone;
    }
}


if (using_ai) {
    current_line = grid[ligne_index];
    clean_line(current_line);
    bloc = (array_length(current_line) > 0) ? current_line[0] : noone;
}

if (bloc != noone && instance_exists(bloc)) {
    x = bloc.x;
    y = bloc.y;
    image_xscale = bloc.bloc_taille;
} else {
    x = manager.x_start - 16; // côté droit du terrain
    image_xscale = 1;
}