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
	}
}