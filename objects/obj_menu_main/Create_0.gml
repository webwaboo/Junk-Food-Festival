//create main menu tabs, options menu tabs, setup difficulty
// obj_menu_main → Refactored with state-based logic
// === Create Event ===
menu_state = "main";
menu_index = 0;
menu_y_offset = 450;
menu_spacing = 48;

menu_options_main = ["VS Mode", "Arcade", "Options", "Tutorial", "Credits", "Quit"];
menu_options_options = [
    "Controls J1",
    "Controls J2",
    "Difficulty: " + global.difficulty,
    "Fullscreen: " + (global.fullscreen ? "ON" : "OFF"),
    "Gameplay",
    "Back"
];

// Build gameplay submenu labels from current globals
var _dig_s = global.digestion_timer_duration / 60;
var _dig_lbl = (global.digestion_timer_duration == 0) ? "Instant" : (string(_dig_s) + "s");
var _bfreq_lbl;
switch (global.bonus_freq) {
    case "often": _bfreq_lbl = "Often (3-7s)";   break;
    case "rare":  _bfreq_lbl = "Rare (20-30s)";  break;
    default:      _bfreq_lbl = "Normal (10-15s)"; break;
}
menu_options_gameplay = [
    "Digestion: " + _dig_lbl,
    "Game Timer: " + string(global.game_timer_duration) + "s",
    "Lines: " + string(global.grid_lines_count),
    "Bonus Freq: " + _bfreq_lbl,
    "Bonuses",
    "Back"
];

// Build bonuses submenu (ON/OFF only — frequency is global)
menu_options_bonuses = [
    "[spr_bonus_500pts,0] 500 pts  " + (global.bonus_500pts_enabled ? "ON" : "OFF"),
    "[spr_bonus_send2,0] Send 2  "   + (global.bonus_send2_enabled  ? "ON" : "OFF"),
    "Back"
];


// === Variables nécessaires pour tutorial ===
tutorial_page = 0;
tutorial_images = [
    spr_tutorial_1,
    spr_tutorial_2,
    spr_tutorial_3
];

 waiting_for_key = false;
global.one_hand_mode = false;
if (gamepad_is_connected(0)) {
    show_debug_message("🎮 Manette connectée !");
} else {
    show_debug_message("❌ Pas de manette détectée.");
}
