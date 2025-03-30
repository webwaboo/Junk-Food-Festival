// === Analyse des lignes ===
for (var i = 0; i < grid_lines; i++) {
    check_consolidation(i);
    check_digestion(i);
}

// === Gestion du timer de vague de blocs ===
if (!is_digesting()) {
    bloc_timer--;
}

if (bloc_timer <= 0) {
    generate_bloc_wave();
    bloc_timer = bloc_timer_max;
}
