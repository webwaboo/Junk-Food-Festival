/// @desc Draw grid separators aligned to the bloc rows
var view_index = 0;
var camera = view_camera[view_index];

var view_x = 0;
var view_y = 0;
var scale_x = 1;
var scale_y = 1;
var port_x = 0;
var port_y = 0;

if (!is_undefined(camera)) {
    view_x = camera_get_view_x(camera);
    view_y = camera_get_view_y(camera);
    var view_w = max(1, camera_get_view_width(camera));
    var view_h = max(1, camera_get_view_height(camera));

    port_x = view_get_xport(view_index);
    port_y = view_get_yport(view_index);
    var port_w = max(1, view_get_wport(view_index));
    var port_h = max(1, view_get_hport(view_index));

    scale_x = port_w / view_w;
    scale_y = port_h / view_h;
}

var left = port_x + (x_start - view_x) * scale_x;
var top = port_y + (y_start - view_y) * scale_y;
var unit_width = sprite_get_width(spr_meatball_1);
var max_units = 13;
var target_width = max_units * unit_width + max(0, max_units - 1) * bloc_spacing;

var actual_width = 0;
for (var row = 0; row < grid_lines; ++row) {
    var line = player_grid[row];
    var row_width = 0;
    var count = array_length(line);

    for (var i = 0; i < count; ++i) {
        var bloc = line[i];
        if (!instance_exists(bloc)) {
            continue;
        }

        row_width += bloc.bloc_taille * unit_width;
        if (i < count - 1) {
            row_width += bloc_spacing;
        }
    }

    actual_width = max(actual_width, row_width);
}

var grid_width = max(target_width, actual_width);
var right = left + grid_width * scale_x;

var original_alpha = draw_get_alpha();
var original_color = draw_get_color();

draw_set_color(c_lime);
draw_set_alpha(0.35);

for (var row = 0; row <= grid_lines; ++row) {
    var y_line = top + row * ligne_spacing * scale_y;
    draw_line(left, y_line, right, y_line);
	draw_line_width(left, y_line, right, y_line,10);
}

draw_set_alpha(original_alpha);
draw_set_color(original_color);