if (is_game_over()) exit;

//pause timer if there is a clash
if (instance_exists(obj_clash_manager)) return; // clash actif → on ne fait rien

// ==========================
// 🎮 Contrôle vertical
// ==========================
if (keyboard_check_pressed(vk_numpad8) && ligne_index > 0) {
    ligne_index -= 1;
}
if (keyboard_check_pressed(vk_numpad5) && ligne_index < 5) {
    ligne_index += 1;
}

y = ligne_index * ligne_spacing;
image_alpha = 0.5 + 0.5 * sin(current_time / 100);

// ==========================
// 🔍 Trouver le bloc (J2 lit à l'envers → index 0)
// ==========================
var grid = grid_manager.player_grid;
var current_line = grid[ligne_index];
var bloc = (array_length(current_line) > 0) ? current_line[0] : noone;

// ==========================
// 🧭 Déplacement vertical du bloc
// ==========================
if (keyboard_check_pressed(ord("I")) && bloc != noone && ligne_index > 0) {
    var target = find_next_available_line_p2(ligne_index, bloc.bloc_taille, -1);
    if (target != -1 && move_bloc_to_line_p2(bloc, ligne_index, target)) {
        ligne_index = target;
    }
}
if (keyboard_check_pressed(ord("K")) && bloc != noone && ligne_index < 5) {
    var target = find_next_available_line_p2(ligne_index, bloc.bloc_taille, 1);
    if (target != -1 && move_bloc_to_line_p2(bloc, ligne_index, target)) {
        ligne_index = target;
    }
}

// ==========================
// 🧃 Envoyer un bloc vers le corps (touche L)
// ==========================
if (keyboard_check_pressed(ord("L"))) {
    var line = grid[ligne_index];
    var count = array_length(line);

    if (count > 1) {
        var bloc_to_move = line[0];
        array_delete(line, 0, 1);
        array_insert(line, array_length(line), bloc_to_move);
        bloc_to_move.y = ligne_index * grid_manager.ligne_spacing;
        reposition_line_p2(ligne_index);
    }
}

// ==========================
// 🎯 Mise à jour position et échelle du curseur
// ==========================
if (bloc != noone) {
    x = bloc.x;
    y = bloc.y;
    image_xscale = bloc.bloc_taille;
} else {
    x = 432; // côté droit du terrain
    image_xscale = 1;
}

// ==========================
// 🚀 Envoi de bloc (touche J)
// ==========================
if (keyboard_check(ord("J")) && bloc != noone) {
    send_hold_timer_p2++;

    if (send_hold_timer_p2 == send_hold_threshold_p2 && bloc.bloc_taille == 3) {
        var line = grid[ligne_index];
        array_delete(line, 0, 1);

        var clash = instance_create_layer(bloc.x, bloc.y, "Instances", obj_clash_bloc);
        clash.image_xscale = bloc.bloc_taille;
        clash.bloc_couleur = bloc.bloc_couleur;
        clash.line_index = ligne_index;
        clash.direction = 180; // vers la gauche
        clash.bloc_owner = "J2";
        clash.handled = false;

        clash.sprite_index = bloc.sprite_index;
        clash.image_index = bloc.image_index;
        clash.image_xscale = bloc.image_xscale;
        clash.image_yscale = bloc.image_yscale;

        with (bloc) instance_destroy();
        reposition_line_p2(ligne_index);
    }
} else {
    send_hold_timer_p2 = 0;
}


// ==========================
// 🧪 Génération d’un bloc aléatoire (touche H)
// ==========================
if (keyboard_check_pressed(ord("H"))) {
    var b = instance_create_layer(0, 0, "Instances", obj_bloc);
    b.bloc_taille = irandom_range(1, 3);
    b.bloc_couleur = choose("rouge", "vert", "bleu");
    b.bloc_owner = "J2";
    set_bloc_sprite(b);
    add_bloc_to_line_p2(irandom_range(0, 5), b);
}

