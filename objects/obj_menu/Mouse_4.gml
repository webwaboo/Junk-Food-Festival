// obj_menu → Mouse Left Pressed
if (point_in_rectangle(mouse_x, mouse_y, button_rejouer_rect.x1, button_rejouer_rect.y1, button_rejouer_rect.x2, button_rejouer_rect.y2)) {
    restart_game();
}
