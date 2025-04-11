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

    ini_close();
}
