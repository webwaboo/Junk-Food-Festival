

// obj_menu_main → Draw GUI
/*draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_green)
draw_set_font(fnt_large); // Replace if needed

// Title
draw_text(room_width / 2, 425, "🍔 Junk Food Festival 🍟");

// Menu options
for (var i = 0; i < array_length(menu_options); i++) {
    var text = menu_options[i];
    var ypos = menu_y_offset + i * menu_spacing;

    if (i == menu_index) {
        draw_text(room_width / 2, ypos, "> " + text + " <");
    } else {
        draw_text(room_width / 2, ypos, text);
    }
}*/
// === Draw GUI Event ===
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_green)
draw_set_font(fnt_large);

// Title
var title = (menu_state == "main") ? "🍔 Junk Food Festival 🍟" : "Options";
draw_text(display_get_gui_width() / 2, 425, title);

// Draw options
var options = (menu_state == "main") ? menu_options_main : menu_options_options;
for (var i = 0; i < array_length(options); i++) {
    var txt = options[i];
    var y_pos = menu_y_offset + i * menu_spacing;

    if (i == menu_index) draw_text(display_get_gui_width() / 2, y_pos, "> " + txt + " <");
    else draw_text(display_get_gui_width() / 2, y_pos, txt);
}
// === Draw Event (ajout dans le switch/menu_state) ===
if (menu_state == "tutorial") {
    draw_set_alpha(1);
    draw_set_color(c_blue);
    draw_sprite_stretched(
        tutorial_images[tutorial_page],
        0,
        0,
        0,
        display_get_gui_width(),
        display_get_gui_height()
    );
    draw_set_halign(fa_center);
    draw_set_font(fnt_large);
    draw_text(display_get_gui_width() / 2, display_get_gui_height() - 770, "< " + string(tutorial_page + 1) + "/3 >");
    draw_text(display_get_gui_width() / 2, display_get_gui_height() - 56, "Appuie sur Entree ou Echap pour revenir");
    return;
}

// Tu peux maintenant gérer le reste normalement (menu principal, options, etc.)

if (menu_state == "controls") {
    draw_text(display_get_gui_width() / 2, 48, "Reconfiguration des touches (Joueur 1)");

    var keys_array = ["up", "down", "bloc_up", "bloc_down", "send", "shift"];

    for (var i = 0; i < array_length(keys_array); i++) {
        var key = keys_array[i];
        var keycode = global.controls_j1[$ key];
        var val = chr(keycode);

        var txt = string(key) + ": " + val;
        if (i == menu_index) txt = "> " + txt + " <";

        draw_text(display_get_gui_width() / 2, 100 + i * 32, txt);
    }

    if (waiting_for_key) {
        draw_text(display_get_gui_width() / 2, display_get_gui_height() - 64, "Appuie sur une touche...");
    } else {
        draw_text(display_get_gui_width() / 2, display_get_gui_height() - 64, "Entrée: changer / Echap: retour");
    }
}


/*if (menu_state == "controls") {
    draw_text(display_get_gui_width() / 2, 48, "Reconfiguration des touches (Joueur 1)");

    var control_keys = global.controls_j1;
    for (var i = 0; i < array_length(control_keys); i++) {
		var key = control_keys[i];
        var label = string(key);
        //var val = chr(global.controls_j1[key]); // conversion du code vers une lettre

        var txt = label //+ ": " + val;
        if (i == menu_index) txt = "> " + txt + " <";

        draw_text(display_get_gui_width() / 2, 100 + i * 32, txt);
        i++;
    }

    if (waiting_for_key=true) {
        draw_text(display_get_gui_width() / 2, display_get_gui_height() - 64, "Appuie sur une touche...");
    } else {
        draw_text(display_get_gui_width() / 2, display_get_gui_height() - 64, "Entrée: changer / Echap: retour");
    }
}
