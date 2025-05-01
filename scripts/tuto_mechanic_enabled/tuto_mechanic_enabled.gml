function tuto_mechanic_enabled(mechanic_name) {
    switch (mechanic_name) {

        // Bloc par bloc selon les rooms

        // Si la room est PAS sur liste, la mechanique est ACTIVEE
		//Mechanic is BLOCKED for room:
        case "cursor_move":
            return ;

        case "bloc_move":
            return room == rm_tuto_1 || room == rm_tuto_3;

        case "generation":
			return room == rm_tuto_2 || room == rm_tuto_3;
        case "digestion":
			return room == rm_tuto_1;
        case "clash":
			return room == rm_tuto_1;
        case "bonus":
			return room == rm_tuto_1;
        case "send":
			return room == rm_tuto_1;
        case "shift":
			return room == rm_tuto_1;
        case "game_timer":
            return false;

        case "consolidation":
            return room == rm_tuto_1;

        default:
            return true; // activé par défaut sinon
    }
}
