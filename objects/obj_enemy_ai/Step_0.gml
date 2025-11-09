/// Step Event of obj_enemy_ai
if (!variable_global_exists("p2_ai_enabled") || !global.p2_ai_enabled) exit;
if (string_starts_with(room_get_name(room), "rm_tuto_")) exit;
if (global.game_paused) exit;
if (is_game_over()) exit;
if (instance_exists(obj_clash_manager)) exit;

// === Find refs ===
if (!instance_exists(cursor)) cursor = instance_find(obj_cursor_p2, 0);
if (!instance_exists(grid_manager)) grid_manager = instance_find(obj_grid_manager_p2, 0);
if (!instance_exists(cursor) || !instance_exists(grid_manager)) exit;

var cursor_ref = cursor;
var manager = grid_manager;
var grid = manager.player_grid;

// === Mode timers ===
if (!variable_instance_exists(self, "ai_mode")) ai_mode = "random";
if (!variable_instance_exists(self, "ai_mode_timer")) ai_mode_timer = 0;
if (!variable_instance_exists(self, "ai_next_mode_time")) ai_next_mode_time = irandom_range(180, 300); // 3–5s @60fps
if (!variable_instance_exists(self, "ai_action_timer")) ai_action_timer = 0;
if (!variable_instance_exists(self, "ai_next_action_time")) ai_next_action_time = irandom_range(10, 60); // 1–3s

ai_action_timer++;
ai_mode_timer++;

// === Switch mode every few seconds ===
if (ai_mode_timer >= ai_next_mode_time) {
    ai_mode_timer = 0;
    ai_next_mode_time = irandom_range(18, 30);
    if (irandom_range(1, 3) == 3) {
        ai_mode = "focused";
		 show_debug_message("AI is focused !");
        ai_focus_timer = irandom_range(500, 800); //150 210 focus lasts ~2.5–3.5s
    } else {
        ai_mode = "random";
		show_debug_message("AI is random...");
    }
}

// === Focus mode duration ===
if (ai_mode == "focused") {
    ai_focus_timer--;
    if (ai_focus_timer <= 0) ai_mode = "random";
}

// === Send bloc if ready ===
var line_i = cursor_ref.ligne_index;
var current_line = grid[line_i];
clean_line(current_line);

if (array_length(current_line) > 0) {
    var top_bloc = current_line[0];
    if (instance_exists(top_bloc) && top_bloc.bloc_taille == 3 && cursor_ref.ai_send_cooldown <= 0) {
        var line_send = current_line;
        array_delete(line_send, 0, 1);
        audio_play_sound(snd_bloc_send_release, 1, false);

        var clash = instance_create_layer(top_bloc.x, top_bloc.y, "Instances", obj_clash_bloc);
        clash.image_xscale = top_bloc.bloc_taille;
        clash.bloc_couleur = top_bloc.bloc_couleur;
        clash.line_index = line_i;
        clash.direction = 180;
        clash.bloc_owner = "J2";
        clash.handled = false;
        clash.sprite_index = top_bloc.sprite_index;
        clash.image_index = top_bloc.image_index;
        clash.image_xscale = top_bloc.image_xscale;
        clash.image_yscale = top_bloc.image_yscale;

        with (top_bloc) instance_destroy();
        reposition_line_p2(line_i);

        cursor_ref.ai_send_cooldown = cursor_ref.ai_send_interval;
        cursor_ref.send_hold_timer_p2 = 0;
        exit;
    }
}

// === Action timing ===
if (ai_action_timer < ai_next_action_time) exit; // wait
ai_action_timer = 0;
ai_next_action_time = irandom_range(10, 30);

// === Mode-specific behavior ===
switch (ai_mode) {

    // ————————————————————————————
    case "random":
        var action = choose("move_cursor", "shift_line", "move_bloc");
        switch (action) {
            case "move_cursor":
                var dir = choose(-1, 1);
                cursor_ref.ligne_index = clamp(cursor_ref.ligne_index + dir, 0, manager.grid_lines - 1);
                audio_play_sound(snd_cursor_move, 1, false);
                break;

            case "shift_line":
                var line = grid[cursor_ref.ligne_index];
                clean_line(line);
                if (array_length(line) > 1) {
                    var bloc_to_move = line[0];
                    array_delete(line, 0, 1);
                    array_insert(line, array_length(line), bloc_to_move);
                    bloc_to_move.y = manager.y_start + cursor_ref.ligne_index * manager.ligne_spacing;
                    reposition_line_p2(cursor_ref.ligne_index);
                    audio_play_sound(snd_bloc_shift, 1, false);
                }
                break;

            case "move_bloc":
                var line_idx = cursor_ref.ligne_index;
                var line_arr = grid[line_idx];
                clean_line(line_arr);
                if (array_length(line_arr) > 0) {
                    var bloc_ref = line_arr[0];
                    if (instance_exists(bloc_ref)) {
                        var dir = choose(-1, 1);
                        var target = find_next_available_line_p2(line_idx, bloc_ref.bloc_taille, dir);
                        if (target != -1 && move_bloc_to_line_p2(bloc_ref, line_idx, target)) {
                            cursor_ref.ligne_index = target;
                            audio_play_sound(snd_bloc_move, 1, false);
                        }
                    }
                }
                break;
        }
    break;

    // ————————————————————————————
    case "focused":
        // Scan all lines to find best bloc to act on
        var best_line = -1;
        var best_score = -999;
        for (var i = 0; i < manager.grid_lines; i++) {
            var line = grid[i];
            clean_line(line);
            if (array_length(line) == 0) continue;
            var first_bloc = line[0];
            if (!instance_exists(first_bloc)) continue;
            var size = first_bloc.bloc_taille;
            var score_ai = size * 100;
            if (size == 3) score_ai += 500;
            score_ai += get_line_total_p2(i);
            if (score_ai > best_score) {
                best_score = score_ai;
                best_line = i;
            }
        }

        if (best_line != -1) {
            cursor_ref.ligne_index = clamp(best_line, 0, manager.grid_lines - 1);
            audio_play_sound(snd_cursor_move, 1, false);
        }
    break;
}

/*// === Update cursor visuals ===
cursor_ref.ligne_index = clamp(cursor_ref.ligne_index, 0, manager.grid_lines - 1);
cursor_ref.y = lerp(cursor_ref.y, manager.y_start + cursor_ref.ligne_index * manager.ligne_spacing, 0.25);
cursor_ref.image_alpha = 0.5 + 0.5 * sin(current_time / 100);
