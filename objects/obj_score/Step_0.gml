//create bonus object depending on bonus timer
//check if gameover or paused
if (global.game_paused) exit;
if (is_game_over()) exit;

if (!global.game_paused) {
    check_score_victory();
}
// Decrement active bonus effect timers
if (global.send2_j1_timer > 0) global.send2_j1_timer--;
if (global.send2_j2_timer > 0) global.send2_j2_timer--;

// Shared bonus spawn lottery
var _any_bonus = instance_exists(obj_bonus_500pts) || instance_exists(obj_bonus_send2);
if (!_any_bonus) {
    bonus_timer--;

    if (bonus_timer <= 0) {
        // Build pool of enabled bonuses
        var _pool = [];
        if (global.bonus_500pts_enabled) array_push(_pool, "bonus_500pts");
        if (global.bonus_send2_enabled)  array_push(_pool, "bonus_send2");

        if (array_length(_pool) > 0) {
            // Remove last bonus type to avoid consecutive repeats
            if (array_length(_pool) > 1 && last_bonus_type != "") {
                var _filtered = [];
                for (var _i = 0; _i < array_length(_pool); _i++) {
                    if (_pool[_i] != last_bonus_type) array_push(_filtered, _pool[_i]);
                }
                _pool = _filtered;
            }

            var _chosen = _pool[irandom(array_length(_pool) - 1)];
            last_bonus_type = _chosen;

            switch (_chosen) {
                case "bonus_500pts": instance_create_layer(room_width / 2 - 30, 0, "Instances", obj_bonus_500pts); break;
                case "bonus_send2":  instance_create_layer(room_width / 2 - 30, 0, "Instances", obj_bonus_send2);  break;
            }
        }

        // Reset shared timer
        var _fps = game_get_speed(gamespeed_fps);
        switch (global.bonus_freq) {
            case "often": bonus_timer = irandom_range(3  * _fps, 7  * _fps); break;
            case "rare":  bonus_timer = irandom_range(20 * _fps, 30 * _fps); break;
            default:      bonus_timer = irandom_range(10 * _fps, 15 * _fps); break;
        }
    }
}
