if (is_game_over()) exit;

//pause timer if there is a clash
if (instance_exists(obj_clash_manager)) return; // clash actif → on ne fait rien

// === Mouvement ===
x += lengthdir_x(speed, direction);

// === Collision avec un autre bloc de clash ===
with (obj_clash_bloc) {
    if (id != other.id && !other.handled && line_index == other.line_index) {
        
        // Collision de bounding box
        if (bbox_right > other.bbox_left && bbox_left < other.bbox_right) {

            // Marquer les 2 comme déjà traités
            handled = true;
            other.handled = true;

            // Calcul du point de contact
            var clash_point = (max(bbox_left, other.bbox_left) + min(bbox_right, other.bbox_right)) / 2;

            /*if (clash_point < 192) {
                transfer_both_to("J1");
            } else if (clash_point > 256) {
                transfer_both_to("J2");
            } else {
                // Zone centrale = clash
				var clash = instance_create_layer(224, 96, "Instances", obj_clash_manager);
				clash.line_index = line_index;
				clash.bloc_couleur_j1 = bloc_couleur;
				clash.bloc_couleur_j2 = other.bloc_couleur;
				
				with (id) instance_destroy();
				with (other.id) instance_destroy();
            }*/
        }
    }
}

// === Envoi vers l’adversaire terminé ===
if (direction == 0 && x >= 432) { // J1 → J2
    send_to_enemy_line("J2", line_index, bloc_couleur);
    instance_destroy();
}

if (direction == 180 && x <= 16) { // J2 → J1
    send_to_enemy_line("J1", line_index, bloc_couleur);
    instance_destroy();
}
