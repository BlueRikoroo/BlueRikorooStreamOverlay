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
#region Drawing Board

if drawOverlay{
	if !surface_exists(drawOverlaySurface){
		drawOverlaySurface = surface_create(1920, 1080)
	}
	var X = mouse_x - camera_get_view_x(view_camera[0])
	var Y = mouse_y - camera_get_view_y(view_camera[0])
	if mouse_check_button(mb_left){
		surface_set_target(drawOverlaySurface)
		if posInRegion(X, Y, 0, 0, 50, 50){
			draw_clear_alpha(c_white, 0)
		}else{
			draw_set_color(drawOverlayColor)
			draw_line_width(drawOverlayPrevX, drawOverlayPrevY, X, Y, 10)
			draw_circle(drawOverlayPrevX, drawOverlayPrevY, 5, false)
			draw_circle(X, Y, 5, false)
		}
		surface_reset_target()
	}else if mouse_check_button(mb_right){
		if posInRegion(X, Y, 0, 0, 50, 50){
			drawOverlayColor = c_white
		}else if posInRegion(X, Y, 50, 0, 100, 50){
			drawOverlayColor = c_black
		}else{
			drawOverlayColor = make_color_hsv(X mod 255, 200, 255)
		}
		draw_set_color(drawOverlayColor)
		draw_rectangle(0, 0, 50, 50, false)
	}
	drawOverlayPrevX = X
	drawOverlayPrevY = Y
	draw_surface(drawOverlaySurface, 0, 0)
}

#endregion
#region Overlay Text Wiggle

if overlayTextWiggle != ""{
	var sl = string_length(overlayTextWiggle)
	draw_text_setup(fnt_overlayMessage, fa_left, fa_middle, c_white, 1)
	var cp = 0
	for (var i = 1; i <= sl; i++){
		var c = string_char_at(overlayTextWiggle, i)
		draw_text_outline(100+cp, 900+50*sin(global.time*0.01 + 0.1*i), c, 5, c_white, c_black) 
		cp += string_width(c)+1
	}
}

#endregion
#region PushUps

if pushUpNum > 0{
	draw_text_setup(fnt_blockEditor, fa_left, fa_top)
	
	var s = "Push Up Counter: " + string(pushUpNum)
	var w = string_width(s)
	var newPos = 1920-w-40
	if abs(pushUpPos-newPos) < 1{
		pushUpPos = newPos
	}else{
		pushUpPos += (newPos - pushUpPos)*0.01
	}
	
	draw_set_color(make_color_rgb(200 + 50*sin(global.time*0.05),0,0))
	draw_rectangle(pushUpPos, 0, pushUpPos+w+40, 60, false)
	draw_text_outline(pushUpPos+20, 10, s, 2, c_white, c_black)
	
}

#endregion