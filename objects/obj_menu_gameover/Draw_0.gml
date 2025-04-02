// Empêche toute influence de l'alpha global
draw_set_alpha(1);

// Centrage du texte
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Dessin du bouton "Rejouer"
var bx1 = x - 100;
var by1 = y + 50;
var bx2 = x + 100;
var by2 = y + 90;

draw_set_color(c_white); // Couleur de texte/bouton
draw_set_font(-1)

// Affiche le titre du menu (facultatif)
draw_text(room_width / 2, menu_y_offset, menu_title);

// Affiche les options du menu (facultatif si tu utilises que "Rejouer")
for (var i = 0; i < array_length(menu_options); i++) {
    var text = menu_options[i];
    var ypos = menu_y_offset + 48 + i * menu_spacing;
    
    if (i == menu_index) {
        draw_text(room_width / 2, ypos, "> " + text + " <");
    } else {
        draw_text(room_width / 2, ypos, text);
    }
}

