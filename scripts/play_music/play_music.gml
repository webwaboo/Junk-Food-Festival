function play_music(new_track) {
	music_current= noone;
    if (music_current != new_track) {
        audio_stop_all();
        audio_play_sound(new_track, 1, true);
        music_current = new_track;
    }
}
