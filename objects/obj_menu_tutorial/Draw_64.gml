draw_set_alpha(1);
draw_sprite_stretched(
    tutorial_pages[current_page],
    -1,
    0,
    0,
    display_get_width(),
    display_get_height()
);

// Affichage numéro de page
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
draw_text(display_get_width() / 2, display_get_height() - 32, "Page " + string(current_page + 1) + " / " + string(page_count));
