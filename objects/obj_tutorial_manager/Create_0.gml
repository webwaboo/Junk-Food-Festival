global.bonus_was_created = false;

// Initialisation dynamique selon la room
switch (room) {
    case rm_tuto_1:
        consigne = "Move the cursor with [spr_pad_cross] or [spr_key_up]/[spr_key_down] to the first and last line.";
        explication = "The cursor is used to select the blocs.";
        controls_enabled = {
            cursor: true,
            bloc_move: false,
            send: false,
            shift: false
        };
        success_check = tuto_victory;
        break;

    case rm_tuto_2:
        consigne = "Move the bloc with [spr_pad_a]/[spr_pad_y] or [spr_key_s]/[spr_key_w] and put one on the first and the other on the last line.";
        explication = "Select a bloc with the cursor to move it.";
        controls_enabled = {
            cursor: true,
            bloc_move: true,
            send: false,
            shift: false
        };
        success_check = tuto_victory;
        break;

	case rm_tuto_3:
	    consigne = "Merge the blocs to create 3 blocs of size 3.";
	    explication = "Blocs of the same color and small size can fuse into bigger ones. Size 3 is the max!";
	    controls_enabled = {
	        cursor: true,
	        bloc_move: true,
	        send: false,
	        shift: false
	    };
	    success_check = tuto_victory;
	    break;

    // ... autres niveaux à venir
	case rm_tuto_4:
	    consigne = "Move the size 3 bloc to the end of the line using [spr_pad_a]/[spr_key_a].";
	    explication = "Shift changes the order of blocs in a line!";
	    controls_enabled = {
	        cursor: true,
	        bloc_move: false,
	        send: false,
	        shift: true
	    };
	    success_check = tuto_victory;
	    break;

	case rm_tuto_5:
	    consigne = "Move or shift a size 3 bloc to the start of a line to digest it.";
	    explication = "Only size 3 bloc can be digested! And new blocs appear on a regular so watch out!";
	    controls_enabled = {
	        cursor: true,
	        bloc_move: false,
	        send: false,
	        shift: true
	    };
	    success_check = tuto_victory;
	    break;

	case rm_tuto_6:
	    consigne = "Send a bloc to the opponent by [c_red]maintening[c_white] [spr_pad_b] or [spr_key_d]!";
	    explication = "Only blocs of size 3 can be sent. Use them to pressure or grab bonuses!";
	    controls_enabled = {
	        cursor: true,
	        bloc_move: false,
	        send: true,
	        shift: false
	    };
	    success_check = tuto_victory;
	    break;

	case rm_tuto_7:
	    consigne = "Catch the bonus using a size-3 block!";
	    explication = "Bonuses give +500 points.By the way: digestion = 300 pts, consolidation = 50 pts, clash win = 450 pts!";
	    controls_enabled = {
	        cursor: true,
	        bloc_move: false,
	        send: true,
	        shift: false
	    };
	    success_check = tuto_victory;
	    break;

}
