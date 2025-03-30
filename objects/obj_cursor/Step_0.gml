///Moving cursor
// Monter
if (keyboard_check_pressed(vk_up)) {
    if (ligne_index > 0) {
        ligne_index -= 1;
    }
}

// Descendre
if (keyboard_check_pressed(vk_down)) {
    if (ligne_index < 5) {
        ligne_index += 1;
    }
}

// Mettre à jour la position Y
y = (ligne_index * ligne_spacing);

// Met à jour la position verticale du curseur (Y)
y = ligne_index * ligne_spacing;

// Clignotement
image_alpha = 0.5 + 0.5 * sin(current_time / 100);

///finding block OLD
/*// Cherche le bloc le plus à droite sur la ligne courante
var bloc = noone;
var max_x = -1;

// Parcourt toutes les instances de obj_bloc
with (obj_bloc) {
    // Vérifie si le bloc est sur la même ligne (Y)
    if (y == other.y) {
        if (x > max_x) {
            max_x = x;
            bloc = id;
        }
    }
}

// Ajuste la position du curseur en fonction du bloc trouvé
if (bloc != noone) {
    var taille = bloc.bloc_taille;
    x = bloc.x; // align the cursor’s origin with the block

} else {
    // Aucun bloc ? Position par défaut
    x = 0;
}

//Match cursor with block size
if (bloc != noone) {
    var taille = bloc.bloc_taille;

    // Match position
    x = bloc.x;
    y = bloc.y;

    // Match size (scale factor)
    switch (taille) {
        case 1:
            image_xscale = 1; // assuming base sprite is 16px wide
            break;
        case 2:
            image_xscale = 2; // doubles width to 32px
            break;
        case 3:
            image_xscale = 3; // triples width to 48px
            break;
    }
}*/

/// Moving block NEW
var grid = grid_manager.player_grid;
var current_line = grid[ligne_index];
var bloc = (array_length(current_line) > 0) ? current_line[array_length(current_line) - 1] : noone;

// Move UP
if (keyboard_check_pressed(ord("W")) && bloc != noone && ligne_index > 0) {
	//check if there is avalaible line above before moving
	var target = find_next_available_line(ligne_index, bloc.bloc_taille, -1);
    if (target != -1 && move_bloc_to_line(bloc, ligne_index, target)) {
        ligne_index = target;
    }
}

// Move DOWN
if (keyboard_check_pressed(ord("S")) && bloc != noone && ligne_index < 5) {
	//check if there is avalaible line below before moving
    var target = find_next_available_line(ligne_index, bloc.bloc_taille, 1);
    if (target != -1 && move_bloc_to_line(bloc, ligne_index, target)) {
        ligne_index = target;
    }
}

// Moving block to the body
// Envoyer le dernier bloc en tête de ligne (touche A)
if (keyboard_check_pressed(ord("A"))) {
    var line = grid[ligne_index];
    var count = array_length(line);

    if (count > 1) {

        // Retirer le bloc
        array_delete(line, count - 1, 1);

        // L'ajouter en tête
        array_insert(line, 0, bloc);

        // Mettre à jour la position Y
        bloc.y = ligne_index * grid_manager.ligne_spacing;

        // Repositionner visuellement
        reposition_line(ligne_index);
    }
}


///Finding block new
var line = grid_manager.player_grid[ligne_index];
var bloc_count = array_length(line);


if (bloc != noone) {
    //var bloc = line[bloc_count - 1]; // Get last bloc in the line

    // Align with the block
    x = bloc.x;
    y = bloc.y;

    // Adjust cursor size to match bloc width
    image_xscale = bloc.bloc_taille; // assuming base sprite is 16px wide

} else {
    // No bloc on this line
    x = grid_manager.x_start;
    image_xscale = 1;
}


///Moving block OLD
/*// Move block to line above
if (keyboard_check_pressed(ord("W"))) {
    if (bloc != noone && ligne_index > 0) {
        bloc.y -= ligne_spacing;
    }
}

// Move block to line below
if (keyboard_check_pressed(ord("S"))) {
    if (bloc != noone && ligne_index < 5) {
        bloc.y += ligne_spacing;
    }
}*/

//add random block
if (keyboard_check_pressed(ord("G"))) {
	var b = instance_create_layer(0, 0, "Instances", obj_bloc);
    b.bloc_taille = irandom_range(1, 3);
    b.bloc_couleur = choose("rouge", "vert", "bleu");
    set_bloc_sprite(b);

    add_bloc_to_line(irandom_range(0, 5), b);
}