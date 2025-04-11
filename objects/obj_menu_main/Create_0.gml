// obj_menu_main → Refactored with state-based logic

// === Create Event ===
menu_state = "main";
menu_index = 0;
menu_y_offset = 500;
menu_spacing = 48;

menu_options_main = ["Start", "Options", "Tutorial", "Quit"];
menu_options_options = ["Controls J1", "Controls J2", "Difficulty", "Back"];

// === Variables nécessaires pour tutorial ===
tutorial_page = 0;
tutorial_images = [
    spr_tutorial_1,
    spr_tutorial_2,
    spr_tutorial_3
];

 waiting_for_key = false;
