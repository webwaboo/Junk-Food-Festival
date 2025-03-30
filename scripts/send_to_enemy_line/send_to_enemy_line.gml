function send_to_enemy_line(joueur) {
    var manager = (joueur == "J1") ? instance_find(obj_grid_manager, 0)
                                   : instance_find(obj_grid_manager_p2, 0);
    if (!instance_exists(manager)) return;

    var grid = manager.player_grid;
    var line = grid[line_index];

    // Créer un nouveau bloc dans le bon sens
    var new_bloc = instance_create_layer(0, 0, "Instances", obj_bloc);
	new_bloc.bloc_owner = joueur; // "J1" ou "J2"

    new_bloc.bloc_taille = 3;
    new_bloc.bloc_couleur = bloc_couleur;
    set_bloc_sprite(new_bloc);
    new_bloc.y = line_index * manager.ligne_spacing;

    // Ajouter côté “corps” de l’adversaire
    if (joueur == "J1") {
        array_insert(line, 0, new_bloc);
    } else {
        array_insert(line, array_length(line), new_bloc);
    }
	
	/*// ✅ Insertion côté clash (pour éviter digestion)
    if (joueur == "J1") {
        array_insert(line, array_length(line), new_bloc); // à droite
    } else {
        array_insert(line, 0, new_bloc); // à gauche
    }*/

    // Réajuste visuellement
    if (joueur == "J1") {
        reposition_line(line_index);
    } else {
        reposition_line_p2(line_index);
    }
}
