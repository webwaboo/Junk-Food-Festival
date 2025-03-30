// Draw the sprite normally
draw_self();

// Debug: show digestion timer above bloc
if (digestion_timer > -1) {
    draw_text(x, y - 10, string(digestion_timer));
}
