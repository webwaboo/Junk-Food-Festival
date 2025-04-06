// Position de départ (ligne 0)
ligne_index = 0;

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