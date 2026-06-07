function save_controls() {
    var path = "controls.ini";

    // Sauvegarde Joueur 1
    ini_open(path);
    ini_write_string("controls_j1", "up", string(global.controls_j1.up));
    ini_write_string("controls_j1", "down", string(global.controls_j1.down));
    ini_write_string("controls_j1", "bloc_up", string(global.controls_j1.bloc_up));
    ini_write_string("controls_j1", "bloc_down", string(global.controls_j1.bloc_down));
    ini_write_string("controls_j1", "send", string(global.controls_j1.send));
    ini_write_string("controls_j1", "shift", string(global.controls_j1.shift));

    // Sauvegarde Joueur 2
    ini_write_string("controls_j2", "up", string(global.controls_j2.up));
    ini_write_string("controls_j2", "down", string(global.controls_j2.down));
    ini_write_string("controls_j2", "bloc_up", string(global.controls_j2.bloc_up));
    ini_write_string("controls_j2", "bloc_down", string(global.controls_j2.bloc_down));
    ini_write_string("controls_j2", "send", string(global.controls_j2.send));
    ini_write_string("controls_j2", "shift", string(global.controls_j2.shift));

    // Gameplay settings
    ini_write_string("gameplay", "difficulty",             global.difficulty);
    ini_write_real("gameplay",   "fullscreen",             global.fullscreen ? 1 : 0);
    ini_write_real("gameplay",   "digestion_timer",        global.digestion_timer_duration);
    ini_write_real("gameplay",   "game_timer",             global.game_timer_duration);
    ini_write_real("gameplay",   "bonus_500pts_enabled",       global.bonus_500pts_enabled     ? 1 : 0);
    ini_write_real("gameplay",   "bonus_send2_enabled",        global.bonus_send2_enabled      ? 1 : 0);
    ini_write_real("gameplay",   "bonus_quick_shot_enabled",   global.bonus_quick_shot_enabled ? 1 : 0);
    ini_write_real("gameplay",   "bonus_shield_enabled",       global.bonus_shield_enabled     ? 1 : 0);
    ini_write_string("gameplay", "bonus_freq",                 global.bonus_freq);
    ini_write_real("gameplay",   "grid_lines",             global.grid_lines_count);

    ini_close();
}
