//create bonus object depending on bonus timer
//check if gameover or paused
if (global.game_paused) exit;
if (is_game_over()) exit;

if (!global.game_paused) {
    check_score_victory();
}
//check bonus timer
if (global.bonus_500pts_enabled && !instance_exists(obj_bonus_500pts)) {
    bonus_timer--;

    if (bonus_timer <= 0) {
        instance_create_layer(room_width / 2-30, 0, "Instances", obj_bonus_500pts);
        var _fps = game_get_speed(gamespeed_fps);
        switch (global.bonus_500pts_freq) {
            case "often": bonus_timer = irandom_range(3  * _fps, 7  * _fps); break;
            case "rare":  bonus_timer = irandom_range(20 * _fps, 30 * _fps); break;
            default:      bonus_timer = irandom_range(10 * _fps, 15 * _fps); break;
        }
    }
}
