// Valeur par défaut (à écraser à la création)
vainqueur = "J1";
alpha = 0;

if (!instance_exists(obj_menu_gameover)) {
    instance_create_layer(room_width/2, room_height/2, "GUI", obj_menu_gameover);
}

