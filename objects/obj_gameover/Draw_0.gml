draw_set_alpha(alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_width(), display_get_height(), false);

// Event Draw de obj_gameover
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_large); // Remplace par la bonne font si elle existe
draw_text(room_width / 2, room_height / 2, "Vainqueur " + string(vainqueur));
