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