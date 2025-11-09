function set_bloc_sprite(b) {
    if (b.bloc_couleur == "rouge") {
        if (b.bloc_taille == 1) b.sprite_index = spr_meatball_1;
        else if (b.bloc_taille == 2) b.sprite_index = spr_meatball_2;
        else if (b.bloc_taille == 3) b.sprite_index = spr_meatball_3;
    }
    else if (b.bloc_couleur == "vert") {
        if (b.bloc_taille == 1) b.sprite_index = spr_pizza_1;
        else if (b.bloc_taille == 2) b.sprite_index = spr_pizza_2;
        else if (b.bloc_taille == 3) b.sprite_index = spr_pizza_3;
    }
    else if (b.bloc_couleur == "bleu") {
        if (b.bloc_taille == 1) b.sprite_index = spr_icecream_1;
        else if (b.bloc_taille == 2) b.sprite_index = spr_icecream_2;
        else if (b.bloc_taille == 3) b.sprite_index = spr_icecream_3;
    }
}
