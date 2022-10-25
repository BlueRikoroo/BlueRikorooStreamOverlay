draw_sprite_ext(sprite_index, frame, x, y, image_xscale, image_yscale, image_angle, -1, 1)
for (var i = 0; i < astheticAmount; i++){
	draw_sprite_ext(asthetics[i], frame, x, y, image_xscale, image_yscale, image_angle, -1, 1)	
}

draw_text_setup(fnt_playerName, fa_center, fa_middle)
draw_text_outline(x, y-200-nameOffset, username, 2, c_white, c_black)