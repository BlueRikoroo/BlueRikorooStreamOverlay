#region Testing

if testing{
	draw_set_color(c_black)
	draw_set_alpha(1)
	draw_set_font(fnt_blockEditor)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	draw_text(10,10,"Mode: " + mode)
	draw_text(10,60,"Key: " + keyboard_string)
}

#endregion
#region Chat Surface

if !surface_exists(chat_surface){
	chat_surface = surface_create(chat_surface_width, chat_surface_height)	
}
surface_set_target(chat_surface)
draw_clear_alpha(c_white, 0)
with(obj_chatMessage){
	event_perform(ev_draw, 0)	
}
surface_reset_target()

draw_surface(chat_surface, chat_surface_x, chat_surface_y)

#endregion
#region Juke Pos

if jukePos < 2920{
	if jukeTimer == 0{
		jukePos += (2920 - jukePos)*0.1
		if abs(jukePos - 2920) <= 1{
			jukePos = 2920	
		}
	}
	draw_text_setup(fnt_subStatueUsername_tier1, fa_right, fa_bottom)
	draw_text_outline(jukePos, 1080, jukeCredit, 1, c_yellow, c_black)
}
if jukeTimer > 0{
	jukePos += (1920 - jukePos)*0.1
	jukeTimer--
}

#endregion