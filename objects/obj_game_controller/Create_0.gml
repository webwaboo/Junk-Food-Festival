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
init_controls();
room_goto_next(); // Move to the next room after initialization
