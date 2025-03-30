function generate_bloc_wave() {
    var manager = instance_find(obj_grid_manager, 0);
    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;

    for (var i = 0; i < manager.grid_lines; i++) {
        var line = grid[i];

        // Nettoyage défensif pour éviter les erreurs
        clean_line(line);

        // Calcule la taille d’un nouveau bloc aléatoire
        var taille = choose(1, 2, 3);
        var total = get_line_total(i);

        // Vérifie la capacité maximale
        if (total + taille <= 12) {

            // Créer le bloc
            var bloc = instance_create_layer(0, 0, "Instances", obj_bloc);
            bloc.bloc_taille = taille;
            bloc.bloc_couleur = choose("rouge", "vert", "bleu");
            bloc.bloc_owner = "P1";
            bloc.digestion_timer = -1;
            set_bloc_sprite(bloc);

            // Ajoute le bloc à gauche (côté clash)
            array_insert(line, 0, bloc);

            bloc.y = i * manager.ligne_spacing;

            reposition_line(i);
            check_consolidation(i);
            check_digestion(i);
        }
    }
}
