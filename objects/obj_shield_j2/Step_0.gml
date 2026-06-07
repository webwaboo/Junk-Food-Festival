if (global.game_paused) exit;
if (is_game_over()) exit;

shield_timer--;
if (shield_timer <= 0) { instance_destroy(); exit; }

var _manager   = instance_find(obj_grid_manager, 0);
var _manager_p2 = instance_find(obj_grid_manager_p2, 0);
var _cursor    = instance_find(obj_cursor_p2, 0);
if (!instance_exists(_manager) || !instance_exists(_manager_p2) || !instance_exists(_cursor)) exit;

// Follow cursor line y
y = _manager_p2.y_start + _cursor.ligne_index * _manager_p2.ligne_spacing;

// Position x at the leftmost block of the cursor's line - offset (J2's sending side faces left)
var _line = _manager_p2.player_grid[_cursor.ligne_index];
if (array_length(_line) > 0) {
    var _first = _line[0];
    if (instance_exists(_first)) x = _first.x - 10;
} else {
    x = _manager.x_start + 400; // fallback when line is empty (stays ahead of landing threshold)
}

// Reflect incoming J1 blocks on the cursor's current line
var _line_idx = _cursor.ligne_index;
with (obj_clash_bloc) {
    if (direction == 0 && !handled && line_index == _line_idx && x <= other.x + 16 && x >= other.x - 48) {
        direction  = 180;
        bloc_owner = "J2";
        audio_play_sound(snd_bloc_send_release, 1, false);
        break;
    }
}
