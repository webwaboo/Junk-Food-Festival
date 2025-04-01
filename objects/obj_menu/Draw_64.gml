/*// Fond noir semi-transparent
draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

// Texte principal
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(display_get_gui_width() / 2, 60, "Game Over");

// Bouton "Rejouer"
var bx1 = button_rejouer_rect.x1;
var by1 = button_rejouer_rect.y1;
var bx2 = button_rejouer_rect.x2;
var by2 = button_rejouer_rect.y2;

draw_set_color(c_dkgray);
draw_rectangle(bx1, by1, bx2, by2, false);
draw_text((bx1 + bx2) / 2, (by1 + by2) / 2, "Rejouer");
