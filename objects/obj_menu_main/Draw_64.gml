// Draw the background image
/*draw_sprite_stretched(
    spr_menu_background,
	-1,
    0,
    0,
    room_width,
    room_height
);*/

// obj_menu_main → Draw GUI
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_green)
draw_set_font(fnt_large); // Replace if needed

// Title
draw_text(room_width / 2, 425, "🍔 Junk Food Festival 🍟");

// Menu options
for (var i = 0; i < array_length(menu_options); i++) {
    var text = menu_options[i];
    var ypos = menu_y_offset + i * menu_spacing;

    if (i == menu_index) {
        draw_text(room_width / 2, ypos, "> " + text + " <");
    } else {
        draw_text(room_width / 2, ypos, text);
    }
}
