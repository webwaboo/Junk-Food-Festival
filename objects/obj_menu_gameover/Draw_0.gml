draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(room_width / 2, menu_y_offset, menu_title);

// Affichage des options
for (var i = 0; i < array_length(menu_options); i++) {
    var text = menu_options[i];
    var ypos = menu_y_offset + 48 + i * menu_spacing;
    
    if (i == menu_index) {
        draw_text(room_width / 2, ypos, "> " + text + " <");
    } else {
        draw_text(room_width / 2, ypos, text);
    }
}
