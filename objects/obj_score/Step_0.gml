if (!global.game_paused) {
    check_score_victory();
}
//check bonus timer
if (!instance_exists(obj_bonus)) {
    bonus_timer--;

    if (bonus_timer <= 0) {
        instance_create_layer(room_width / 2-30, 0, "Instances", obj_bonus);
        bonus_timer = irandom_range(10 * game_get_speed(gamespeed_fps), 15 * game_get_speed(gamespeed_fps));
    }
}
