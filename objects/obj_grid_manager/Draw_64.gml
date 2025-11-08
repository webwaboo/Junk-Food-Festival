// Assumes you already have these values:
var start_x = x_start;
var start_y = y_start + 6 * ligne_spacing;
var row_count = grid_lines;
var row_height = ligne_spacing;
var grid_width = sprite_get_width(spr_bloc_bleu_3) * 11;

draw_set_color(c_dkgray);
draw_set_alpha(0.5); // Slight transparency

for (var i = 1; i < row_count; i++) {
    var y_height = start_y + i * row_height;
    draw_line(start_x, y_height, start_x + grid_width, y_height);
}

draw_set_alpha(1); // Reset alpha
