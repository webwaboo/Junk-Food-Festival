function restart_game() {
    // Reset des variables globales
    global.game_paused = false;

    // Réinitialise la room actuelle (relance complètement le jeu)
    room_restart();
}
