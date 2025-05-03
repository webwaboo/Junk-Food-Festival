// Position de départ (ligne 0)
if(room = rm_tuto_1 || room = rm_tuto_8){
	ligne_index = 2;
} else {
	ligne_index = 0;
}

// Distance entre les lignes (en pixels)
ligne_spacing = 32;


// Find the grid manager once
grid_manager = instance_find(obj_grid_manager, 0);
global.game_paused = false;

//timer pour appui long
send_hold_timer = 0;
send_hold_threshold = 45; // 1 seconde à 60 FPS
// Create Event of a controller object or initialization script
global.sound_send_press_id = noone; // Initialize with noone (indicating no sound is playing)

arrow_hold_dir = 0;
arrow_hold_timer = 0;

press_time_up = -1;
press_time_down = -1;
