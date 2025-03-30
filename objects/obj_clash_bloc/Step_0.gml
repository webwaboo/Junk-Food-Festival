//x += lengthdir_x(speed, direction);

//// Recherche d’un autre bloc de clash sur la même ligne
//with (obj_clash_bloc) {
//    if (id != other.id && line_index == other.line_index && !other.handled) {

//        // Vérifie s’il y a une collision réelle
//        if (bbox_right > other.bbox_left && bbox_left < other.bbox_right) {  // marge de collision horizontale
//            var avg_x = (x + other.x) / 2;

//            // Marquer comme traités pour éviter double logique
//            handled = true;
//            other.handled = true;

//            if (avg_x < 192) {
//                transfer_both_to("J1");
//            } else if (avg_x > 256) {
//                transfer_both_to("J2");
//            } else {
//                // Dans la zone de clash — combat plus tard
//                show_debug_message("⚔️ Déclencher un mini-jeu de clash !");
//                // start_clash_combat(id, other.id); // à faire plus tard
//                with (id) instance_destroy();
//                with (other.id) instance_destroy();
//            }
//        }
//    }
//}


//// ==========================
//// ✅ Si aucun bloc en face : envoyer au joueur adverse
//// ==========================

//// J1 → J2
//if (direction == 0 && x >= 432) {
//    send_to_enemy_line("J2", line_index, bloc_couleur);
//    instance_destroy();
//}

//// J2 → J1
//if (direction == 180 && x <= 16) {
//    send_to_enemy_line("J1", line_index, bloc_couleur);
//    instance_destroy();
//}
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

            if (clash_point < 192) {
                transfer_both_to("J1");
            } else if (clash_point > 256) {
                transfer_both_to("J2");
            } else {
                // Zone centrale = clash
                show_debug_message("⚔️ Déclencher un mini-jeu de clash !");
                with (id) instance_destroy();
                with (other.id) instance_destroy();
            }
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
