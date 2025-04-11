function check_consolidation_p2(line_index) {
    var manager = instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;
    var line = grid[line_index];

    clean_line(line); // 🔒 Sécurité contre blocs détruits

    var count = array_length(line);
    if (count < 2) return;

    // 🔁 Parcours de gauche à droite (logique miroir P2)
    for (var i = 0; i < count - 1; i++) {
        var bloc1 = line[i];
        var bloc2 = line[i + 1];

        if (!instance_exists(bloc1) || !instance_exists(bloc2)) continue;

        if (bloc1.bloc_couleur == bloc2.bloc_couleur) {
            var total_taille = bloc1.bloc_taille + bloc2.bloc_taille;

            if (total_taille <= 3) {
                var bloc_couleur = bloc1.bloc_couleur;

                // Supprime les deux blocs
                array_delete(line, i + 1, 1);
                array_delete(line, i, 1);

                with (bloc1) instance_destroy();
                with (bloc2) instance_destroy();

                // Crée le bloc consolidé
                var new_bloc = instance_create_layer(0, 0, "Instances", obj_bloc);
                new_bloc.bloc_taille = total_taille;
                new_bloc.bloc_couleur = bloc_couleur;
                new_bloc.bloc_owner = "J2";
                new_bloc.digestion_timer = -1;

                set_bloc_sprite(new_bloc);
                new_bloc.y = line_index * manager.ligne_spacing;
				audio_play_sound(snd_bloc_consolidate, 1, false)

                // ➕ Insert à la place de bloc1 (gauche)
                array_insert(line, i, new_bloc);

                reposition_line_p2(line_index);

                return; // ✅ Une seule consolidation par appel
            }
        }
    }
}
