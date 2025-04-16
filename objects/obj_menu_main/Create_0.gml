// obj_menu_main → Refactored with state-based logic

// === Create Event ===
menu_state = "main";
menu_index = 0;
menu_y_offset = 500;
menu_spacing = 48;

menu_options_main = ["Start", "Options", "Tutorial", "Quit"];
menu_options_options = ["Controls J1", "Controls J2","One-Hand Mode: OFF", "Difficulty: Easy", "Back"];


// === Variables nécessaires pour tutorial ===
tutorial_page = 0;
tutorial_images = [
    spr_tutorial_1,
    spr_tutorial_2,
    spr_tutorial_3
];

 waiting_for_key = false;
global.one_hand_mode = false;

global.difficulty = "Easy"; // valeurs possibles : "Easy", "Normal", "Hard"
if (gamepad_is_connected(0)) {
    show_debug_message("🎮 Manette connectée !");
} else {
    show_debug_message("❌ Pas de manette détectée.");
}
