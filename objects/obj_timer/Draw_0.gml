/*draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_bangers);
draw_set_color(c_red);

draw_text(room_width / 2, 32, string(global.timer_seconds));*/
scribble("[fa_center][fa_middle][fnt_bangers][c_red]" + string(global.timer_seconds)).draw(room_width / 2, 32)