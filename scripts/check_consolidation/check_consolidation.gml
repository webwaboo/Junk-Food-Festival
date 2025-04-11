function check_consolidation(line_index) {
    var manager = instance_find(obj_grid_manager, 0);
    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;
    var line = grid[line_index];

    clean_line(line); // 🔒 Supprime les références invalides

    var count = array_length(line);
    if (count < 2) return;

    // 🔁 Parcours de droite à gauche (logique J1)
    for (var i = count - 1; i > 0; i--) {
        var bloc1 = line[i];
        var bloc2 = line[i - 1];

        if (!instance_exists(bloc1) || !instance_exists(bloc2)) continue;

        if (bloc1.bloc_couleur == bloc2.bloc_couleur) {
            var total_taille = bloc1.bloc_taille + bloc2.bloc_taille;

            if (total_taille <= 3) {
                var bloc_couleur = bloc1.bloc_couleur;

                array_delete(line, i, 1);
                array_delete(line, i - 1, 1);

                with (bloc1) instance_destroy();
                with (bloc2) instance_destroy();

                var new_bloc = instance_create_layer(0, 0, "Instances", obj_bloc);
                new_bloc.bloc_taille = total_taille;
                new_bloc.bloc_couleur = bloc_couleur;
                new_bloc.bloc_owner = "J1";
                new_bloc.digestion_timer = -1;

                set_bloc_sprite(new_bloc);
                new_bloc.y = line_index * manager.ligne_spacing;
				audio_play_sound(snd_bloc_consolidate, 1, false)

                // 🔁 Insère à la position d'origine du bloc2
                array_insert(line, i - 1, new_bloc);

                reposition_line(line_index);

                return; // ✅ Une seule consolidation par appel
            }
        }
    }
}
