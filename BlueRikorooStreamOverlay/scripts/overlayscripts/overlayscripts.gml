function load_overlay(ID){
	overlay_timer = 0
	chat_surface_x = 0
	chat_surface_y = 0
	switch(ID){
	case 1:
		overlay_step = empty_script
		overlay_draw = overlay_main_draw
		chat_surface_x = 30
		chat_surface_y = 35
		break
	case 2:
		overlay_step = empty_script
		overlay_draw = overlay_mainSpooky_draw
		chat_surface_x = 30
		chat_surface_y = 35
		break
	case 3:
		overlay_step = empty_script
		overlay_draw = overlay_mainCustom_draw
		chat_surface_x = 30
		chat_surface_y = 35
		break
	case 4:
		overlay_step = empty_script
		overlay_draw = overlay_secondary_draw
		chat_surface_x = 10
		chat_surface_y = 25
		break
	case 44:
		overlay_step = empty_script
		overlay_draw = overlay_secondary_thick_draw
		chat_surface_x = 22
		chat_surface_y = 37
		break
	case 444:
		overlay_step = empty_script
		overlay_draw = overlay_secondary_thicc_draw
		chat_surface_x = 46
		chat_surface_y = 61
		break
	case 4444:
		overlay_step = empty_script
		overlay_draw = overlay_secondary_thiccest_draw
		chat_surface_x = 94
		chat_surface_y = 109
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
		draw_set_color(make_color_hsv(0, 0, 115 - irandom(80)))
		overaly_main_draw_brushDown()
	}
	
	#endregion
	overlay_draw_surfaceCleanup()
	overlay_draw_empty_script()
}

function overlay_mainCustom_draw(){
	overlay_draw_surfaceSetup()
	#region Draw Code
	
	if overlay_timer > 120 and overlay_timer <= 480{
		var H = (mouse_x-camera_get_view_x(view_camera[0]))/obj_main.camera_width * 255
		var SV = (mouse_y-camera_get_view_y(view_camera[0]))/obj_main.camera_height * 255
		draw_set_color(make_color_hsv(H, SV, SV))
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

function overlay_secondary_draw(){
	overlay_draw_surfaceSetup()
	#region Draw Code
	
	if overlay_timer > 120 and overlay_timer <= 132{
		var H = (mouse_x-camera_get_view_x(view_camera[0]))/obj_main.camera_width * 255
		draw_set_color(make_color_hsv(H, 191, 50 + (overlay_timer-120)*15))
		overaly_secondary_draw_brushDown()
	}
	
	#endregion
	overlay_draw_surfaceCleanup()
	overlay_draw_empty_script()
}

function overlay_secondary_thick_draw(){
	overlay_draw_surfaceSetup()
	#region Draw Code
	
	if overlay_timer > 120 and overlay_timer <= 144{
		var H = (mouse_x-camera_get_view_x(view_camera[0]))/obj_main.camera_width * 255
		draw_set_color(make_color_hsv(H, 191, 50 + (overlay_timer-120)*7))
		overaly_secondary_draw_brushDown()
	}
	
	#endregion
	overlay_draw_surfaceCleanup()
	overlay_draw_empty_script()
}

function overlay_secondary_thicc_draw(){
	overlay_draw_surfaceSetup()
	#region Draw Code
	
	if overlay_timer > 120 and overlay_timer <= 168{
		var H = (mouse_x-camera_get_view_x(view_camera[0]))/obj_main.camera_width * 255
		draw_set_color(make_color_hsv(H, 191, 50 + (overlay_timer-120)*4))
		overaly_secondary_draw_brushDown()
	}
	
	#endregion
	overlay_draw_surfaceCleanup()
	overlay_draw_empty_script()
}

function overlay_secondary_thiccest_draw(){
	overlay_draw_surfaceSetup()
	#region Draw Code
	
	if overlay_timer > 120 and overlay_timer <= 216{
		var H = (mouse_x-camera_get_view_x(view_camera[0]))/obj_main.camera_width * 255
		draw_set_color(make_color_hsv(H, 191, 50 + (overlay_timer-120)*2))
		overaly_secondary_draw_brushDown()
	}
	
	#endregion
	overlay_draw_surfaceCleanup()
	overlay_draw_empty_script()
}

function overaly_secondary_draw_brushDown(){
	var oo = overlay_timer-121
	drawInwardRect(0, 0, 1575, 987, oo)
	drawInwardRect(1563, 0, 1920, 357, oo)
	drawInwardRect(1563, 345, 1920, 987, oo)
}

function drawInwardRect(X1, Y1, X2, Y2, oo){
	var X, Y
	X = X1+oo
	draw_line(X, Y1+oo, X, Y2-oo)
	X = X2-oo
	draw_line(X, Y1+oo, X, Y2-oo)
	Y = Y1+oo
	draw_line(X1+oo-1, Y, X2-oo, Y)
	Y = Y2-oo
	draw_line(X1+oo, Y, X2-oo, Y)
}