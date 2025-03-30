// Par défaut, tu peux initialiser des valeurs (elles pourront être modifiées après création)
bloc_taille = 3; // 1 = 16x32, 2 = 32x32, 3 = 48x32
bloc_couleur = "vert"; // "rouge", "vert", "bleu"

// Choisir le sprite en fonction de la couleur et de la taille
if (bloc_couleur == "rouge") {
    if (bloc_taille == 1) sprite_index = spr_bloc_rouge_1;
    else if (bloc_taille == 2) sprite_index = spr_bloc_rouge_2;
    else if (bloc_taille == 3) sprite_index = spr_bloc_rouge_3;
}
else if (bloc_couleur == "vert") {
    if (bloc_taille == 1) sprite_index = spr_bloc_vert_1;
    else if (bloc_taille == 2) sprite_index = spr_bloc_vert_2;
    else if (bloc_taille == 3) sprite_index = spr_bloc_vert_3;
}
else if (bloc_couleur == "bleu") {
    if (bloc_taille == 1) sprite_index = spr_bloc_bleu_1;
    else if (bloc_taille == 2) sprite_index = spr_bloc_bleu_2;
    else if (bloc_taille == 3) sprite_index = spr_bloc_bleu_3;
}

//var pour la digestion
digestion_timer = -1; // -1 = non actif
