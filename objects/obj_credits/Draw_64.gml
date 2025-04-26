draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(fnt_large);

var center_x = display_get_gui_width() / 2;
var y_current = credits_y;

// Parcourt tous les crédits
for (var i = 0; i < array_length(credits_list); i++) {
	var domain = credits_list[i][0];
    var names_array = credits_list[i][1];
	
    //draw title
	scribble("[fa_center][fa_top][fnt_bangers][pulse]"+string(domain)).draw(center_x, y_current);
	y_current += 48;
	//draw names
	for (var j = 0; j < array_length(names_array); j++) {
		scribble("[fa_center][fa_top][fnt_bangers]"+string(names_array[j])).draw(center_x, y_current);
        y_current += 48;
    }
	
	y_current += 48;
}
