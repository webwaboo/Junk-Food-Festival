scribble("[fa_center][fa_top][fnt_bangers]Score J1: "+ string(global.score_j1)).draw(192, 16);
scribble("[fa_center][fa_top][fnt_bangers]Score J2: "+ string(global.score_j2)).draw(display_get_gui_width() - 192, 16);

// === Timer Bonus (affichage simple) ===
if (variable_instance_exists(id, "bonus_timer")) {
    var time_left = max(0, bonus_timer div game_get_speed(gamespeed_fps)); // secondes restantes
    
	scribble("[fa_center][fa_center][fnt_bangers_medium][c_yellow]Next Bonus In: " + string(time_left) + "s").draw(display_get_gui_width() / 2, display_get_gui_height() - 100);
}
