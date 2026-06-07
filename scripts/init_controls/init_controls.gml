function init_controls() {
	
	var path = "controls.ini";

    if (file_exists(path)) {
        ini_open(path);

        global.controls_j1 = {
            up: ini_read_real("controls_j1", "up", ord("W")),
            down: ini_read_real("controls_j1", "down", ord("S")),
            bloc_up: ini_read_real("controls_j1", "bloc_up", ord("E")),
            bloc_down: ini_read_real("controls_j1", "bloc_down", ord("Q")),
            send: ini_read_real("controls_j1", "send", ord("D")),
            shift: ini_read_real("controls_j1", "shift", ord("A"))
        };

        global.controls_j2 = {
            up: ini_read_real("controls_j2", "up", vk_numpad8),
            down: ini_read_real("controls_j2", "down", vk_numpad5),
            bloc_up: ini_read_real("controls_j2", "bloc_up", vk_numpad7),
            bloc_down: ini_read_real("controls_j2", "bloc_down", vk_numpad9),
            send: ini_read_real("controls_j2", "send", vk_numpad4),
            shift: ini_read_real("controls_j2", "shift", vk_numpad6)
        };

        global.difficulty               = ini_read_string("gameplay", "difficulty",           "Easy");
        global.fullscreen               = (ini_read_real("gameplay",  "fullscreen",                0) == 1);
        global.digestion_timer_duration = ini_read_real("gameplay",   "digestion_timer",         180);
        global.game_timer_duration      = ini_read_real("gameplay",   "game_timer",               99);
        global.bonus_500pts_enabled       = (ini_read_real("gameplay",  "bonus_500pts_enabled",      1) == 1);
        global.bonus_send2_enabled        = (ini_read_real("gameplay",  "bonus_send2_enabled",       1) == 1);
        global.bonus_quick_shot_enabled   = (ini_read_real("gameplay",  "bonus_quick_shot_enabled",  1) == 1);
        global.bonus_shield_enabled       = (ini_read_real("gameplay",  "bonus_shield_enabled",       1) == 1);
        global.bonus_freq               = ini_read_string("gameplay", "bonus_freq",          "normal");
        global.grid_lines_count         = ini_read_real("gameplay",   "grid_lines",                6);
        global.send2_j1_timer           = 0;
        global.send2_j2_timer           = 0;
        global.quick_shot_j1_timer      = 0;
        global.quick_shot_j2_timer      = 0;

        ini_close();
    } else {
		global.controls_j1 = {
		    up: ord("W"),
		    down: ord("S"),
		    bloc_up: ord("E"),
		    bloc_down: ord("Q"),
		    send: ord("D"),
		    shift: ord("A")
		};

		global.controls_j2 = {
		    up: vk_numpad8,
		    down: vk_numpad5,
		    bloc_up: vk_numpad7,
		    bloc_down: vk_numpad9,
		    send: vk_numpad4,
		    shift: vk_numpad6
		};

        global.difficulty               = "Easy";
        global.fullscreen               = false;
        global.digestion_timer_duration = 180;
        global.game_timer_duration      = 99;
        global.bonus_500pts_enabled     = true;
        global.bonus_send2_enabled      = true;
        global.bonus_quick_shot_enabled = true;
        global.bonus_shield_enabled     = true;
        global.bonus_freq               = "normal";
        global.grid_lines_count         = 6;
        global.send2_j1_timer           = 0;
        global.send2_j2_timer           = 0;
        global.quick_shot_j1_timer      = 0;
        global.quick_shot_j2_timer      = 0;
	}
}