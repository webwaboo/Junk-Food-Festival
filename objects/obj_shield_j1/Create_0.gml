var _manager = instance_find(obj_grid_manager, 0);
var _cursor  = instance_find(obj_cursor, 0);
shield_timer = 15 * game_get_speed(gamespeed_fps);
y = instance_exists(_cursor)
    ? (_manager.y_start + _cursor.ligne_index * _manager.ligne_spacing)
    : _manager.y_start;
// x is set each Step; seed with a safe position
x = _manager.x_start + 32;
depth = -100;
