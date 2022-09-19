#region Game

if allowGame{
	if !surface_exists(activeGameSurface){
		activeGameSurface = surface_create(activeGameSurfaceWidth, activeGameSurfaceHeight)
	}
	surface_set_target(activeGameSurface)
	draw_clear(c_purple)
	surface_reset_target()
	with(par_game){
		drawGameSurface()
	}
	draw_surface(activeGameSurface, camera_get_view_x(view_camera[0]) + activeGamePosX, camera_get_view_y(view_camera[0]) + activeGamePosY)
}


#endregion

overlay_draw()