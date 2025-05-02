//check if gameover or paused
if (global.game_paused) exit;
if (is_game_over()) exit;

// Descente lente
y += vspeed;

// Si le bonus sort de la zone de clash sans être touché → destroy
if (y > room_height) {
    instance_destroy();
}
// Check for collision with any clash block
var clash = instance_place(x, y, obj_clash_bloc);

if (clash != noone &&  !clash.handled) {
	clash.handled = true;

	if (clash.bloc_owner == "J1") global.score_j1 += 500;
	else if (clash.bloc_owner == "J2") global.score_j2 += 500;
	audio_play_sound(snd_option_select,1,false)

	instance_destroy(); // destroy the bonus
	with (clash) instance_destroy(); // destroy the block
}
/*//check collision bloc clash
with (obj_clash_bloc) {
    if (bbox_bottom > other.bbox_top &&
        bbox_top < other.bbox_bottom &&
        bbox_right > other.bbox_left &&
        bbox_left < other.bbox_right) {
			
		
       
    }
}
