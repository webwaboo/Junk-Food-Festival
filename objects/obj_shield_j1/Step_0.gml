if (global.game_paused) exit;
if (is_game_over()) exit;

shield_timer--;
if (shield_timer <= 0) { instance_destroy(); exit; }

var _manager = instance_find(obj_grid_manager, 0);
var _cursor  = instance_find(obj_cursor, 0);
if (!instance_exists(_manager) || !instance_exists(_cursor)) exit;

// Follow cursor line y
y = _manager.y_start + _cursor.ligne_index * _manager.ligne_spacing;

// Position x at the rightmost block of the cursor's line + offset
var _line = _manager.player_grid[_cursor.ligne_index];
if (array_length(_line) > 0) {
    var _last = _line[array_length(_line) - 1];
    if (instance_exists(_last)) x = _last.x + 10;
} else {
    x = _manager.x_start + 32; // fallback when line is empty (stays ahead of landing threshold)
}

// Reflect incoming J2 blocks on the cursor's current line
var _line_idx = _cursor.ligne_index;
with (obj_clash_bloc) {
    if (direction == 180 && !handled && line_index == _line_idx && x >= other.x - 16 && x <= other.x + 48) {
        direction  = 0;
        bloc_owner = "J1";
        audio_play_sound(snd_bloc_send_release, 1, false);
        break;
    }
}
