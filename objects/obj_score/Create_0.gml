//setup starting score for P1/P2
global.score_j1 = 0;
global.score_j2 = 0;

if (room == rm_tuto_7) {
    bonus_timer = irandom_range(2 * game_get_speed(gamespeed_fps), 4 * game_get_speed(gamespeed_fps));
} else {
    var _fps = game_get_speed(gamespeed_fps);
    switch (global.bonus_freq) {
        case "often": bonus_timer = irandom_range(3  * _fps, 7  * _fps); break;
        case "rare":  bonus_timer = irandom_range(20 * _fps, 30 * _fps); break;
        default:      bonus_timer = irandom_range(10 * _fps, 15 * _fps); break;
    }
}
last_bonus_type = "";