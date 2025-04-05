// obj_menu_tutorial – Create Event
current_page = 0;
tutorial_pages = [
    spr_tutorial_1, // sprite de "Tutorial JFF - 1"
    spr_tutorial_2, // sprite de "Tutorial JFF - 2"
    spr_tutorial_3  // sprite de "Tutorial JFF - 3"
];

page_count = array_length(tutorial_pages);
menu_state = "tutorial"; // ou appeler une fonction/menu reset
