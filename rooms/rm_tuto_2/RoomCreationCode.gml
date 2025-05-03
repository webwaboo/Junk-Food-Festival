
play_music(mus_training_room);
// Define line spacing and left start position for blocks
ligne_spacing = 32; 
//x_start = 0;
bloc_spacing = 0;
//create blocs
for (var i = 0; i < 2; i++) {
		    var b = instance_create_layer(0, 0, "Instances", obj_bloc);
		    b.bloc_taille = irandom_range(1, 3);
		    b.bloc_couleur = choose("rouge", "vert", "bleu");
			b.bloc_owner = "J1";
		    set_bloc_sprite(b);

		    add_bloc_to_line(2, b);
		}