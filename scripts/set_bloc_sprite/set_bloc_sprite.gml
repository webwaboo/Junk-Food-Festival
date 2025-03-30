function set_bloc_sprite(b) {
    if (b.bloc_couleur == "rouge") {
        if (b.bloc_taille == 1) b.sprite_index = spr_bloc_rouge_1;
        else if (b.bloc_taille == 2) b.sprite_index = spr_bloc_rouge_2;
        else if (b.bloc_taille == 3) b.sprite_index = spr_bloc_rouge_3;
    }
    else if (b.bloc_couleur == "vert") {
        if (b.bloc_taille == 1) b.sprite_index = spr_bloc_vert_1;
        else if (b.bloc_taille == 2) b.sprite_index = spr_bloc_vert_2;
        else if (b.bloc_taille == 3) b.sprite_index = spr_bloc_vert_3;
    }
    else if (b.bloc_couleur == "bleu") {
        if (b.bloc_taille == 1) b.sprite_index = spr_bloc_bleu_1;
        else if (b.bloc_taille == 2) b.sprite_index = spr_bloc_bleu_2;
        else if (b.bloc_taille == 3) b.sprite_index = spr_bloc_bleu_3;
    }
}
