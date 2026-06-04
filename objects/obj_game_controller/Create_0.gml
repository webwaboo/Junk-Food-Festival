//set up fullscreen, load controls, global paused status

// Génère 3 blocs de différentes tailles et couleurs pour tester
/*for (var i = 0; i < 6; i++) {
    var b = instance_create_layer(0, i * 32, "Instances", obj_bloc);
    b.bloc_taille = irandom_range(1, 3); // taille entre 1 et 3
    b.bloc_couleur = choose("rouge", "vert", "bleu");
	set_bloc_sprite(b);
	
	add_bloc_to_line(i, b);
}*/


//show_debug_overlay(false); // Enable the debug overlay

// Create Event of obj_controller
// init_controls() sets all persistent globals (controls, difficulty, fullscreen, gameplay settings)
init_controls();
room_goto_next();

global.game_paused  = false;
global.p2_ai_enabled = false;
window_set_fullscreen(global.fullscreen);

// Pin Input plugin player 0 (J1 + menus) to gamepad slot 0 so hotswap
// doesn't steal it when a second controller is plugged in
if (gamepad_is_connected(0)) {
    input_source_set(input_gamepad(0), 0);
}