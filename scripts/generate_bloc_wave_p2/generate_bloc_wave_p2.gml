function generate_bloc_wave_p2() {
    var manager = instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;

    for (var i = 0; i < manager.grid_lines; i++) {
        var line = grid[i];

        // 🔒 Nettoyage défensif
        clean_line(line);

        // Bloc aléatoire
        var taille = choose(1, 2);
        var total = get_line_total_p2(i);

        if (total + taille <= 13) {

            // Création du bloc
            var bloc = instance_create_layer(0, 0, "Instances", obj_bloc);
            bloc.bloc_taille = taille;
            bloc.bloc_couleur = choose("rouge", "vert", "bleu");
            bloc.bloc_owner = "J2";
            bloc.digestion_timer = -1;
            set_bloc_sprite(bloc);

            // Ajout côté corps (droite chez J2 = fin de ligne)
            array_insert(line, array_length(line), bloc);

            bloc.y = manager.y_start + i * manager.ligne_spacing;

            reposition_line_p2(i);
            check_consolidation_p2(i);
            check_digestion_p2(i);
        }
    }
}
