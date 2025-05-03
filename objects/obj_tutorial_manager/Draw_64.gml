//display explication + consigne
var y_pos = 48
var height = scribble("[fa_center][fnt_bangers][c_white]Objective : " + string(consigne)).wrap(display_get_gui_width()).get_height();
scribble("[fa_center][fnt_bangers][c_red]Objective[c_white] : " + string(consigne)).wrap(display_get_gui_width()).draw(display_get_gui_width() / 2, 32);
y_pos += height
scribble("[fa_center][fnt_bangers][c_green]Explication[c_white] : " + string(explication)).wrap(display_get_gui_width()).draw(display_get_gui_width() / 2, y_pos);

//display timer for auto-send room 8
if (room == rm_tuto_8 && !global.clash_occurred && global.clash_auto_timer > 0) {
    var sec = ceil(global.clash_auto_timer / game_get_speed(gamespeed_fps));
	scribble("[fa_center][fnt_bangers_medium][c_yellow]J2 attacks in: " + string(sec)).draw(display_get_gui_width() / 2,  display_get_gui_height() - 100);
}
