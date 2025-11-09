//create main menu tabs, options menu tabs, setup difficulty
// obj_menu_main → Refactored with state-based logic
// === Create Event ===
menu_state = "main";
menu_index = 0;
menu_y_offset = 450;
menu_spacing = 48;

menu_options_main = ["VS Mode", "Arcade", "Options", "Tutorial", "Credits", "Quit"];
menu_options_options = ["Controls J1", "Controls J2", "Difficulty: Easy", "Fullscreen: OFF", "Back"];


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
