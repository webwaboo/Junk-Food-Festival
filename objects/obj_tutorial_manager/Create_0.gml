// Initialisation dynamique selon la room
switch (room) {
    case rm_tuto_1:
        consigne    = "Déplace le curseur jusqu'à la première et dernière ligne.";
        explication = "Le curseur permet de sélectionner les blocs.";
        controls_enabled = {
            cursor: true,
            bloc_move: false,
            send: false,
            shift: false
        };
        success_check = scr_tuto_1_success;
        break;

    case rm_tuto_2:
        consigne = "Déplace un bloc vers le haut et vers le bas.";
        explication = "Maintiens le curseur sur une ligne pour déplacer le bloc.";
        controls_enabled = {
            cursor: true,
            bloc_move: true,
            send: false,
            shift: false
        };
        success_check = scr_tuto_2_success;
        break;

    // ... autres niveaux à venir
}
