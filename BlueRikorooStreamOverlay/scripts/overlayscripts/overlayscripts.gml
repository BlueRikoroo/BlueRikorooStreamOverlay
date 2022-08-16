function load_overlay(ID){
	overlay_timer = 0
	switch(ID){
	case 1:
		overlay_step = overlay_main_step
		overlay_draw = overlay_main_draw
		break
	case 2:
		overlay_step = overlay_main_step
		overlay_draw = overlay_mainSpooky_draw
		break
	default:
		overlay_step = empty_script
		overlay_draw = overlay_draw_empty_script
	}
}

function overlay_draw_surfaceSetup(){
	if !surface_exists(overlay_surface){
		overlay_surface = surface_create(camera_width, camera_height)
		overlay_timer = 120	
	}
	surface_set_target(overlay_surface)
}

function overlay_draw_surfaceCleanup(){
	draw_set_alpha(1)
	surface_reset_target()
	if window_toggle 
		draw_surface_ext(overlay_surface, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_width/1920, camera_height/1080, 0, -1, 1)
	else
		draw_surface(overlay_surface, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]))
}

function overlay_draw_empty_script(){

	if overlay_timer >= 0 and overlay_timer <= 120 and surface_exists(overlay_surface){
		if overlay_timer == 120{
			surface_set_target(overlay_surface)
			draw_clear_alpha(c_black, 0)
			surface_reset_target()
		}else{
			surface_set_target(overlay_surface)
			
			gpu_set_blendmode_ext(bm_dest_colour, bm_zero)
			draw_setup(c_white, 0.98)
			draw_rectangle(0,0,camera_width,camera_height,false)
			gpu_set_blendmode(bm_normal)
			
			overlay_draw_surfaceCleanup()
		}
	}
	overlay_timer++
}

function overlay_main_step(){
	
}

function overlay_main_draw(){
	overlay_draw_surfaceSetup()
	#region Draw Code
	
	if overlay_timer > 120 and overlay_timer <= 480{
		draw_set_color(make_color_hsv((overlay_timer*2 + current_second * 4.25 + irandom(30)) mod 255, 191, 191))
		overaly_main_draw_brushDown()
	}
	
	#endregion
	overlay_draw_surfaceCleanup()
	overlay_draw_empty_script()
}

function overlay_mainSpooky_draw(){
	overlay_draw_surfaceSetup()
	#region Draw Code
	
	if overlay_timer > 120 and overlay_timer <= 480{
		draw_set_color(make_color_hsv(0, 0, 125 - irandom(120)))
		overaly_main_draw_brushDown()
	}
	
	#endregion
	overlay_draw_surfaceCleanup()
	overlay_draw_empty_script()
}

function overaly_main_draw_brushDown(){
	var X, Y
	if overlay_timer <= 162{
		X = 1566 + irandom(10)-5
		Y = 349 - lerp(0, 343, (overlay_timer-120)/42)
		draw_circle(X, Y, irandom(12)+15, false)
		X = 1566 + lerp(0, 343, (overlay_timer-120)/42)
		Y = 349  + irandom(10)-5
		draw_circle(X, Y, irandom(12)+15, false)
	}else{
		if overlay_timer <= 204{
			X = 1566 + lerp(0, 343, (overlay_timer-162)/42)
			Y = 6 + irandom(10)-5
			draw_circle(X, Y, irandom(12)+15, false)
			X = 1908 + irandom(10)-5
			Y = 349  - lerp(0, 343, (overlay_timer-162)/42)
			draw_circle(X, Y, irandom(12)+15, false)
		}
		if overlay_timer <= 239{
			X = 1908 + irandom(10)-5
			Y = 349  + lerp(0, 623, (overlay_timer-162)/77)
			draw_circle(X, Y, irandom(12)+15, false)
		}
		if overlay_timer <= 357{
			X = 1566 - lerp(0, 1553, (overlay_timer-162)/195)
			Y = 6 + irandom(10)-5
			draw_circle(X, Y, irandom(12)+15, false)
		}
		else if overlay_timer <= 480{
			X = 6 + irandom(10)-5
			Y = 6 + lerp(0, 590, (overlay_timer-357)/123)
			draw_circle(X, Y, irandom(12)+15, false)	
		}
	}
	if overlay_timer <= 197{
		X = 1568 + irandom(10)-5
		Y = 349 + lerp(0, 623, (overlay_timer-120)/77)
		draw_circle(X, Y, irandom(12)+15, false)
	}else{
		if overlay_timer <= 239{
			X = 1566 + lerp(0, 343, (overlay_timer-198)/42)
			Y = 980 + irandom(10)-5
			draw_circle(X, Y, irandom(12)+15, false)
		}
		if overlay_timer <= 393{
			X = 1566 - lerp(0, 1553, (overlay_timer-198)/195)
			Y = 980 + irandom(10)-5
			draw_circle(X, Y, irandom(12)+15, false)
		}else if overlay_timer <= 480{
			X = 6 + irandom(10)-5
			Y = 980 - lerp(0, 390, (overlay_timer-393)/87)
			draw_circle(X, Y, irandom(12)+15, false)
		}
	}	
}