//draw text placeholder
//draw_self();
draw_text(x, y - 10, bloc_couleur);

// Dessine le sprite exact du bloc source
draw_sprite_ext(
    sprite_index,
    image_index,
    x,
    y,
    image_xscale,
    image_yscale,
    0,
    c_white,
    1
);
	// Ajout d’un halo blanc derrière
	var halo = 0.5 + 0.5 * sin(current_time / 100);
	draw_set_alpha(halo);
	draw_set_color(c_white);
	draw_rectangle(x - 2, y - 2, x + sprite_width * image_xscale + 2, y + sprite_height + 2, false);
	draw_set_alpha(1);

	// DEBUG : affiche la zone de collision (bounding box)
	/*if (show_debug_overlay(true)) {
	    draw_set_alpha(0.4);
	    draw_set_color(c_red);
	    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	    draw_set_alpha(1);
	}*/

