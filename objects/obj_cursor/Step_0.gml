// ==========================
// 🎮 Contrôle vertical
// ==========================
if (keyboard_check_pressed(vk_up) && ligne_index > 0) {
    ligne_index -= 1;
}
if (keyboard_check_pressed(vk_down) && ligne_index < 5) {
    ligne_index += 1;
}

// Position Y basée sur l’index
y = ligne_index * ligne_spacing;

// Clignotement visuel
image_alpha = 0.5 + 0.5 * sin(current_time / 100);

// ==========================
// 🔍 Trouver le bloc sur la ligne actuelle
// ==========================
var grid = grid_manager.player_grid;
var current_line = grid[ligne_index];
var bloc = (array_length(current_line) > 0) 
    ? current_line[array_length(current_line) - 1] 
    : noone;

// ==========================
// 🧭 Déplacement vertical du bloc
// ==========================
if (keyboard_check_pressed(ord("W")) && bloc != noone && ligne_index > 0) {
    var target = find_next_available_line(ligne_index, bloc.bloc_taille, -1);
    if (target != -1 && move_bloc_to_line(bloc, ligne_index, target)) {
        ligne_index = target;
    }
}
if (keyboard_check_pressed(ord("S")) && bloc != noone && ligne_index < 5) {
    var target = find_next_available_line(ligne_index, bloc.bloc_taille, 1);
    if (target != -1 && move_bloc_to_line(bloc, ligne_index, target)) {
        ligne_index = target;
    }
}

// ==========================
// 🧃 Envoi vers le corps (touche A)
// ==========================
if (keyboard_check_pressed(ord("A"))) {
    var line = grid[ligne_index];
    var count = array_length(line);

    if (count > 1) {
        var bloc_to_move = line[count - 1];
        array_delete(line, count - 1, 1);
        array_insert(line, 0, bloc_to_move);
        bloc_to_move.y = ligne_index * grid_manager.ligne_spacing;
        reposition_line(ligne_index);
    }
}

// ==========================
// 🎯 Mise à jour visuelle du curseur
// ==========================
if (bloc != noone) {
    x = bloc.x;
    y = bloc.y;
    image_xscale = bloc.bloc_taille;
} else {
    x = grid_manager.x_start;
    image_xscale = 1;
}

// ==========================
// 🚀 Envoi du bloc (touche D)
// ==========================
if (keyboard_check_pressed(ord("D")) && bloc != noone) {
    if (bloc.bloc_taille == 3) {
        var line = grid[ligne_index];

        array_delete(line, array_length(line) - 1, 1);

        var clash = instance_create_layer(bloc.x, bloc.y, "Instances", obj_clash_bloc);
        clash.image_xscale = bloc.bloc_taille;
        clash.bloc_couleur = bloc.bloc_couleur;
        clash.line_index = ligne_index;
        clash.direction = 0; // vers la droite
        clash.bloc_owner = "P1";
        clash.handled = false;

        with (bloc) instance_destroy();

        reposition_line(ligne_index);
    }
}

// ==========================
// 🧪 Génération d’un bloc aléatoire (touche G)
// ==========================
if (keyboard_check_pressed(ord("G"))) {
    var b = instance_create_layer(0, 0, "Instances", obj_bloc);
    b.bloc_taille = irandom_range(1, 3);
    b.bloc_couleur = choose("rouge", "vert", "bleu");
    b.bloc_owner = "P1";
    set_bloc_sprite(b);

    add_bloc_to_line(irandom_range(0, 5), b);
}

