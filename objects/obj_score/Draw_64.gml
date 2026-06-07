//draw score, timer
scribble("[fa_center][fa_top][fnt_bangers]Score J1: "+ string(global.score_j1)).draw(192, 16);
scribble("[fa_center][fa_top][fnt_bangers]Score J2: "+ string(global.score_j2)).draw(display_get_gui_width() - 192, 16);

// === Timer Bonus ===
if (variable_instance_exists(id, "bonus_timer")) {
    var _any_enabled = global.bonus_500pts_enabled || global.bonus_send2_enabled || global.bonus_quick_shot_enabled || global.bonus_shield_enabled;
    var _label = _any_enabled ? (string(max(0, bonus_timer div game_get_speed(gamespeed_fps))) + "s") : "00";
    scribble("[fa_center][fa_center][fnt_bangers_medium][c_yellow]Next Bonus In: " + _label).draw(display_get_gui_width() / 2, display_get_gui_height() - 100);
}
