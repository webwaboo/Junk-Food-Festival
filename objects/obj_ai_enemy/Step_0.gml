// @desc Control player two blocs when the AI is enabled
if (!variable_global_exists("p2_ai_enabled") || !global.p2_ai_enabled) {
    cursor = noone;
    grid_manager = noone;
    exit;
}

if (string_starts_with(room_get_name(room), "rm_tuto_")) exit;
if (global.game_paused) exit;
if (is_game_over()) exit;
if (instance_exists(obj_clash_manager)) exit;

if (!instance_exists(cursor)) {
    cursor = instance_find(obj_cursor_p2, 0);
}

if (!instance_exists(grid_manager)) {
    grid_manager = instance_find(obj_grid_manager_p2, 0);
}

var cursor_ref = cursor;
var manager = grid_manager;

if (!instance_exists(cursor_ref) || !instance_exists(manager)) exit;

if (cursor_ref.ai_shift_timer > 0) {
    cursor_ref.ai_shift_timer -= 1;
}

if (cursor_ref.ai_send_cooldown > 0) {
    cursor_ref.ai_send_cooldown -= 1;
}

var grid = manager.player_grid;
var best_line = -1;
var best_priority = -1;
var best_index = -1;

for (var i = 0; i < manager.grid_lines; ++i) {
    var line = grid[i];
    clean_line(line);

    var count = array_length(line);
    if (count <= 0) continue;

    var largest_size = 0;
    var largest_index = -1;

    for (var j = 0; j < count; ++j) {
        var candidate = line[j];
        if (!instance_exists(candidate)) continue;

        var size = candidate.bloc_taille;
        if (size > largest_size) {
            largest_size = size;
            largest_index = j;
        }
    }

    if (largest_index == -1) continue;

    var priority = largest_size * 100 + get_line_total_p2(i);
    if (largest_size == 3) priority += 500;
    if (largest_index == 0) priority += 25;

    if (priority > best_priority) {
        best_priority = priority;
        best_line = i;
        best_index = largest_index;
    }
}

if (best_line == -1) exit;

cursor_ref.ligne_index = clamp(best_line, 0, manager.grid_lines - 1);
var current_line = grid[cursor_ref.ligne_index];
clean_line(current_line);

if (array_length(current_line) <= 0) exit;

var bloc = current_line[0];
if (!instance_exists(bloc)) exit;

if (best_index > 0 && array_length(current_line) > 1 && cursor_ref.ai_shift_timer <= 0) {
    var rotate_line = current_line;
    var moved_bloc = rotate_line[0];
    array_delete(rotate_line, 0, 1);
    array_insert(rotate_line, array_length(rotate_line), moved_bloc);
    moved_bloc.y = manager.y_start + cursor_ref.ligne_index * manager.ligne_spacing;
    reposition_line_p2(cursor_ref.ligne_index);
    audio_play_sound(snd_bloc_shift, 1, false);
    cursor_ref.ai_shift_timer = cursor_ref.ai_shift_interval;

    current_line = grid[cursor_ref.ligne_index];
    clean_line(current_line);
    if (array_length(current_line) <= 0) exit;
    bloc = current_line[0];
    if (!instance_exists(bloc)) exit;
}

if (bloc.bloc_taille == 3 && cursor_ref.ai_send_cooldown <= 0) {
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
    clash.line_index = cursor_ref.ligne_index;
    clash.direction = 180;
    clash.bloc_owner = "J2";
    clash.handled = false;

    clash.sprite_index = bloc.sprite_index;
    clash.image_index = bloc.image_index;
    clash.image_xscale = bloc.image_xscale;
    clash.image_yscale = bloc.image_yscale;

    with (bloc) instance_destroy();
    reposition_line_p2(cursor_ref.ligne_index);

    cursor_ref.ai_send_cooldown = cursor_ref.ai_send_interval;
    cursor_ref.send_hold_timer_p2 = 0;
} else if (bloc.bloc_taille != 3) {
    cursor_ref.ai_send_cooldown = 0;
}