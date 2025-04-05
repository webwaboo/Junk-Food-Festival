function init_controls() {
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