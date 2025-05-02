// === Effet fondu noir semi-transparent ===
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1); // Reset alpha


scribble("[fa_center][fa_top][c_white][fnt_bangers][wave]Level Completed !").draw(display_get_gui_width() / 2, display_get_gui_height()/2 + array_length(menu_options)*-32);

for (var i = 0; i < array_length(menu_options); i++) {
    var txt = menu_options[i];
    if (i == menu_index) {
		scribble("[fnt_bangers][fa_center][fa_top][c_red][pulse]> " + string(txt) + " <").draw(display_get_gui_width() / 2, display_get_gui_height()/2 + i * 48);
    } else{
		scribble("[fnt_bangers][fa_center][fa_top][c_white]" + string(txt)).draw(display_get_gui_width() / 2, display_get_gui_height()/2 + i * 48);
	}
}
