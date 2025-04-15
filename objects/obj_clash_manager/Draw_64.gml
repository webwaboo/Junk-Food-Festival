draw_set_color(c_red);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_bangers)
var offset = 100; // Distance between the two elements
draw_text(display_get_gui_width()/2, display_get_gui_height()/3, "CLASH ! Mash D (J1) vs J (J2)");
draw_text(display_get_gui_width()/2 - offset, display_get_gui_height()/2, "J1: " + string(mash_j1));
draw_text(display_get_gui_width()/2 + offset, display_get_gui_height()/2, "J2: " + string(mash_j2));

