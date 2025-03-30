//transforme un bloc normal en bloc clash
direction = 0; // 0 = vers la droite, 180 = vers la gauche
speed = 4;

#macro CLASH_CENTER 224
#macro CLASH_ZONE_HALF 32
#macro CLASH_LEFT (CLASH_CENTER - CLASH_ZONE_HALF)
#macro CLASH_RIGHT (CLASH_CENTER + CLASH_ZONE_HALF)

handled = false; // Empêche la double collision croisée
