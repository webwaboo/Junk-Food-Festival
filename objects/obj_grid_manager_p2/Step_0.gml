//check if some block should be consolidated
for (var i = 0; i < grid_lines; i++) {
    check_consolidation_p2(i);
	//check if some block are ready to be digested
	check_digestion_p2(i);
}

/*old timer
bloc_timer--;
if (bloc_timer <= 0) {
    generate_bloc_wave();
    bloc_timer = bloc_timer_max;
}*/

//timer stops if a bloc is digesting
if (!is_digesting_p2()) {
    bloc_timer--;
}

if (bloc_timer <= 0) {
    generate_bloc_wave_p2();
    bloc_timer = bloc_timer_max;
}
