//display explication + consigne
var y_pos = 48
var height = scribble("[fa_center][fnt_bangers][c_white]Objective : " + string(consigne)).wrap(display_get_gui_width()).get_height();
scribble("[fa_center][fnt_bangers][c_red]Objective[c_white] : " + string(consigne)).wrap(display_get_gui_width()).draw(display_get_gui_width() / 2, 32);
y_pos += height
scribble("[fa_center][fnt_bangers][c_green]Explication[c_white] : " + string(explication)).wrap(display_get_gui_width()).draw(display_get_gui_width() / 2, y_pos);
