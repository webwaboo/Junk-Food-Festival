cursor = noone;
grid_manager = noone;
var game_fps = game_get_speed(gamespeed_fps);
action_interval_min = game_fps;      // ~1 second between AI actions
action_interval_max = game_fps * 2;  // allow small variation up to 2 seconds
action_timer = irandom_range(action_interval_min, action_interval_max);