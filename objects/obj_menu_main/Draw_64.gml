// obj_menu_main → Draw GUI

draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnt_bangers);

// === TUTORIAL MENU ===
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
    
    draw_text(display_get_gui_width() / 2, display_get_gui_height() - 770, "< " + string(tutorial_page + 1) + "/3 >");
    draw_text(display_get_gui_width() / 2, display_get_gui_height() - 56, "Appuie sur Entree ou Echap pour revenir");
    return;
}

// === CONTROLS MENU ===
else if (menu_state == "controls") {
    draw_set_color(c_green);
    draw_text(display_get_gui_width() / 2, 48, "Reconfiguration des touches (Joueur 1)");

    var keys_array = variable_struct_get_names(global.controls_j1);

    for (var i = 0; i < array_length(keys_array); i++) {
        var key = keys_array[i];
        var keycode = global.controls_j1[$ key];
        var val = chr(keycode);

        var txt = string(key) + ": " + val;
        if (i == menu_index) txt = "> " + txt + " <";

        draw_text(display_get_gui_width() / 2, 100 + i * 48, txt);
    }

    if (waiting_for_key) {
        draw_text(display_get_gui_width() / 2, display_get_gui_height() - 64, "Appuie sur une touche...");
    } else {
        draw_text(display_get_gui_width() / 2, display_get_gui_height() - 64, "Maintenir Entree: changer / Echap: retour");
    }
    return;
}

else if (menu_state == "controls_p2") {
    draw_set_color(c_orange);
    draw_text(display_get_gui_width() / 2, 48, "Reconfiguration des touches (Joueur 2)");

    var keys_array = variable_struct_get_names(global.controls_j2);

    for (var i = 0; i < array_length(keys_array); i++) {
        var key = keys_array[i];
        var keycode = global.controls_j2[$ key];
        var val = chr(keycode);

        var txt = string(key) + ": " + val;
        if (i == menu_index) txt = "> " + txt + " <";

        draw_text(display_get_gui_width() / 2, 100 + i * 48, txt);
    }

    if (waiting_for_key) {
        draw_text(display_get_gui_width() / 2, display_get_gui_height() - 64, "Appuie sur une touche...");
    } else {
        draw_text(display_get_gui_width() / 2, display_get_gui_height() - 64, "Maintenir Entree: changer / Echap: retour");
    }
    return;
}


// === MAIN & OPTIONS MENU ===
draw_set_color(c_green);

var title = (menu_state == "main") ? "Junk Food Festival" : "Options";
scribble("[fnt_bangers][fa_center][fa_top][spr_bonus,0][c_green][wave]"+string(title)+"[][spr_bonus,0]").draw(display_get_gui_width() / 2, 425); //draw_text(display_get_gui_width() / 2, 425, title);

var options = (menu_state == "main") ? menu_options_main : menu_options_options;

for (var i = 0; i < array_length(options); i++) {
    var txt = options[i];
    var y_pos = menu_y_offset + i * menu_spacing;

    if (i == menu_index) {
        scribble( "[fnt_bangers][fa_center][fa_top][c_red][pulse]> " + string(txt) + " <").draw(display_get_gui_width() / 2, y_pos); //draw_text(display_get_gui_width() / 2, y_pos, "> " + txt + " <");
    } else {
        scribble( "[fnt_bangers][fa_center][fa_top][c_green]" + string(txt)).draw(display_get_gui_width() / 2, y_pos);//draw_text(display_get_gui_width() / 2, y_pos, txt);
    }
}
