if show{
	draw_text_setup(fnt_chatText, fa_center, fa_middle, c_white, 1)
	draw_sprite(spr_mouse, image_index, x, y)
	draw_text(x, y+50, username)

	if timer > 0{
		timer--
		if timer == 0{
			image_index = 0
		}
	}
}