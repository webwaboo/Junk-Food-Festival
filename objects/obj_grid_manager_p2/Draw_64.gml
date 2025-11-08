/*draw_set_colour(c_lime);
draw_line(x_start,y_start,150,96);
draw_line_width(x_start,y_start,150,96,10)
draw_line(x_start*2,y_start*2,150*2,96*2);
draw_line_width(x_start*2,y_start*2,150*2,96*2,10);
draw_line(x_start*3,y_start*3,150*3,96*3);
draw_line(x_start*4,y_start*4,150*4,96*4);*/

// === Draw horizontal lines between grid rows ===

// Style settings
draw_set_color(c_maroon);
draw_set_alpha(0.4); // semi-transparent

// Horizontal grid lines
for (var i = 1; i < grid_lines; i++) {
    var yh = y_start + i * ligne_spacing;
    var x1 = x_start;
	var bloc_width = sprite_get_width(spr_bloc_bleu_3);
    var x2 = x_start + bloc_width * 11;
/*(bloc_width + bloc_spacing)*/
    draw_line(x1, yh, x2, yh);
	draw_line_width(x1, yh, x2, yh,10)
}

// Reset draw state
draw_set_alpha(1);
