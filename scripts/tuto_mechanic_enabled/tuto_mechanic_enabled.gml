function tuto_mechanic_enabled(mechanic_name) {
    switch (mechanic_name) {

        // Bloc par bloc selon les rooms
		//Mechanic is BLOCKED for room:
        case "cursor_move":
            return room == rm_tuto_4 || room == rm_tuto_8;

        case "bloc_move":
            return room == rm_tuto_1 || room == rm_tuto_4 || room == rm_tuto_6 || room == rm_tuto_8;
        case "generation":
			return room == rm_tuto_1 || room == rm_tuto_2 || room == rm_tuto_3 || room == rm_tuto_4 || room == rm_tuto_6 || room == rm_tuto_7 || room == rm_tuto_8;
        case "digestion":
			return room == rm_tuto_1 || room == rm_tuto_2 || room == rm_tuto_3 || room == rm_tuto_4 || room == rm_tuto_6 || room == rm_tuto_7 || room == rm_tuto_8;
        case "clash":
			return room == rm_tuto_1 || room == rm_tuto_2 || room == rm_tuto_3 || room == rm_tuto_4 || room == rm_tuto_5 || room == rm_tuto_6 || room == rm_tuto_7;
        case "bonus":
			return room == rm_tuto_1 || room == rm_tuto_2 || room == rm_tuto_3 || room == rm_tuto_4 || room == rm_tuto_5 || room == rm_tuto_6 || room == rm_tuto_8;
        case "send":
			return room == rm_tuto_1 || room == rm_tuto_2 || room == rm_tuto_3 || room == rm_tuto_4 || room == rm_tuto_5;
        case "shift":
			return room == rm_tuto_1 || room == rm_tuto_2 || room == rm_tuto_3 || room == rm_tuto_6 || room == rm_tuto_7 || room == rm_tuto_8;
        case "game_timer":
            return false;
        case "consolidation":
            return room == rm_tuto_1 || room == rm_tuto_2 || room == rm_tuto_4 || room == rm_tuto_6 || room == rm_tuto_7 || room == rm_tuto_8;
		case "score":
            return room == rm_tuto_1 || room == rm_tuto_2 || room == rm_tuto_3 || room == rm_tuto_4 || room == rm_tuto_5 || room == rm_tuto_6 || room == rm_tuto_8;

        default:
            return true; // activé par défaut sinon
    }
}
