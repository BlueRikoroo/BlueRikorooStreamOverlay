#region Game

if allowGame{
	if !surface_exists(activeGameSurface){
		activeGameSurface = surface_create(activeGameSurfaceWidth, activeGameSurfaceHeight)
	}
	surface_set_target(activeGameSurface)
	draw_clear(c_purple)
	
	draw_text_setup(fnt_subStatueUsername_tier1, fa_center, fa_top, c_white, 1)
	var centerX = activeGameSurfaceWidth * 0.5
	draw_text(centerX, 40, "Click on a game to play!")
	
	// Korioro
	draw_setup()
	var s = "Korioro!"
	draw_rectangle(centerX-100,100,centerX+100, 150,false)
	draw_set_color(make_color_hsv(global.time*0.25 mod 255, 150, 255))
	draw_rectangle(centerX-95, 105, centerX+95, 145, false)
	draw_text_setup(fnt_chatText, fa_center, fa_middle, c_black)
	draw_text(centerX, 125, s)
	
	
	
	surface_reset_target()
		
	with(par_game){
		drawGameSurface()
	}
	draw_surface(activeGameSurface, camera_get_view_x(view_camera[0]) + activeGamePosX, camera_get_view_y(view_camera[0]) + activeGamePosY)
}


#endregion

overlay_draw()