function scr_tuto_1_success() {
    var cursor = instance_find(obj_cursor, 0);
    if (!instance_exists(cursor)) return false;

    if (!variable_instance_exists(cursor, "visited_top")) {
        cursor.visited_top = false;
        cursor.visited_bottom = false;
    }

    if (cursor.ligne_index == 0) cursor.visited_top = true;
    if (cursor.ligne_index == 5) cursor.visited_bottom = true;

    return cursor.visited_top && cursor.visited_bottom;
}
