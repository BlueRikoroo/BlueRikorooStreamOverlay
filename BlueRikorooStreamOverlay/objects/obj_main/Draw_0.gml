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
	var l = centerX-100
	var r = centerX+100
	draw_startgame_button("Korioro!", l, 100, r, 150)
	draw_startgame_button("Riko Doodle!", l, 175, r, 225)
	
	surface_reset_target()
		
	with(par_game){
		drawGameSurface()
	}
	draw_surface(activeGameSurface, camera_get_view_x(view_camera[0]) + activeGamePosX, camera_get_view_y(view_camera[0]) + activeGamePosY)
}


#endregion

overlay_draw()