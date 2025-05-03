play_music(mus_training_room);
// Define line spacing and left start position for blocks
ligne_spacing = 32; 
//x_start = 0;
bloc_spacing = 0;
//create 3 blocs of 1 red
for (var i = 0; i < 3; i++) {
		    var b = instance_create_layer(0, 0, "Instances", obj_bloc);
		    b.bloc_taille = 1;
		    b.bloc_couleur = "rouge";
			b.bloc_owner = "J1";
		    set_bloc_sprite(b);

		    add_bloc_to_line(i, b);
		}
// then 2 2bloc and 2 1blocs of different colors
for (var i = 0; i < 1; i++) {
		    var b = instance_create_layer(0, 0, "Instances", obj_bloc);
		    b.bloc_taille = 1;
		    b.bloc_couleur = "vert";
			b.bloc_owner = "J1";
		    set_bloc_sprite(b);

		    add_bloc_to_line(3, b);
		}
for (var i = 0; i < 1; i++) {
	var b = instance_create_layer(0, 0, "Instances", obj_bloc);
	b.bloc_taille = 1;
	b.bloc_couleur = "bleu";
	b.bloc_owner = "J1";
	set_bloc_sprite(b);

	add_bloc_to_line(4, b);
}
for (var i = 0; i < 1; i++) {
	var b = instance_create_layer(0, 0, "Instances", obj_bloc);
	b.bloc_taille = 2;
	b.bloc_couleur = "bleu";
	b.bloc_owner = "J1";
	set_bloc_sprite(b);

	add_bloc_to_line(5, b);
}
for (var i = 0; i < 1; i++) {
	var b = instance_create_layer(0, 0, "Instances", obj_bloc);
	b.bloc_taille = 2;
	b.bloc_couleur = "vert";
	b.bloc_owner = "J1";
	set_bloc_sprite(b);

	add_bloc_to_line(5, b);
}