draw_set_alpha(alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_width(), display_get_height(), false);

// Texte "Vainqueur J1 / J2"
draw_set_color(c_red);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnt_large);
draw_text(room_width / 2, room_height/10, "Vainqueur " + string(vainqueur));