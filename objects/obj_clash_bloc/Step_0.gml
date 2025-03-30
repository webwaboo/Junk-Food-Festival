x += lengthdir_x(speed, direction);

// Recherche d’un autre bloc de clash sur la même ligne
with (obj_clash_bloc) {
    if (id != other.id && line_index == other.line_index && !other.handled) {

        // Vérifie s’il y a une collision réelle
        if (abs(x - other.x) < 4) { // marge de collision horizontale
            var avg_x = (x + other.x) / 2;

            // Marquer comme traités pour éviter double logique
            handled = true;
            other.handled = true;

            if (avg_x < 192) {
                transfer_both_to("J1");
            } else if (avg_x > 256) {
                transfer_both_to("J2");
            } else {
                // Dans la zone de clash — combat plus tard
                show_debug_message("⚔️ Déclencher un mini-jeu de clash !");
                // start_clash_combat(id, other.id); // à faire plus tard
                with (id) instance_destroy();
                with (other.id) instance_destroy();
            }
        }
    }
}


// ==========================
// ✅ Si aucun bloc en face : envoyer au joueur adverse
// ==========================

// J1 → J2
if (direction == 0 && x >= 432) {
    send_to_enemy_line("J2", line_index, bloc_couleur);
    instance_destroy();
}

// J2 → J1
if (direction == 180 && x <= 16) {
    send_to_enemy_line("J1", line_index, bloc_couleur);
    instance_destroy();
}
