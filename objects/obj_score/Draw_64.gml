draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnt_bangers);
draw_set_color(c_black);

draw_text(192, 16, "Score J1: " + string(global.score_j1));
draw_text(display_get_gui_width() - 192, 16, "Score J2: " + string(global.score_j2));
