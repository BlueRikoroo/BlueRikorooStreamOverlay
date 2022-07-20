#region Save Stuff

if saveState > 0{
	draw_set_color(c_lime)
	draw_set_alpha(0.5)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_left)
	draw_rectangle(480,270,1440,400, false)
	draw_set_alpha(1)
	draw_set_font(fnt_blockEditor)
	draw_set_color(c_black)
	switch(saveState){
	case 1:  // Save
		draw_text(520, 300, "Save File")
		draw_text(520, 350, keyboard_string + ".ini")
		break
	case 2:  // Bind
		draw_text(520, 300, "Bind to what number")
		draw_text(520, 350, keyboard_string)
		break
	case 3:  // Load
		draw_text(520, 300, "Load File")
		draw_text(520, 350, keyboard_string + ".ini")
		break
	}
}

#endregion