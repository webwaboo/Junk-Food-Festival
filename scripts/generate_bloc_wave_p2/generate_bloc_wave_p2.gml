function generate_bloc_wave_p2() {
    var manager = instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;

    for (var i = 0; i < manager.grid_lines; i++) {
        var line = grid[i];

        // Vérifier si ajouter un bloc ne dépasse pas 12 points
        var total = get_line_total_p2(i);
        var taille = choose(1, 2, 3);

        if (total + taille <= 12) {
            // Créer le bloc
            var bloc = instance_create_layer(0, 0, "Instances", obj_bloc);
            bloc.bloc_taille = taille;
            bloc.bloc_couleur = choose("rouge", "vert", "bleu");
            set_bloc_sprite(bloc);

            // Ajouter en première position (à droite) de la ligne
            array_insert(line, array_length(line), bloc); // Ajoute à droite (vers le corps)

            bloc.y = i * manager.ligne_spacing;
            reposition_line_p2(i);
			check_consolidation_p2(i); // forcer la vérification après apparition
			check_digestion_p2(i);
        }
    }
}
