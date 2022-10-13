function load_overlay(ID){
	if transitionHoldOverlay{
		transitionOverlay = ID
		return
	}
	if !sideOverlay{
		previousOverlay = currentOverlay
	}
	currentOverlay = ID
	overlay_timer = 0
	chat_surface_x = 0
	chat_surface_y = 0
	allowGame = true
	activeGamePosX = 1563
	activeGamePosY = 345
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
	case 98:  // Startup Stream
		overlay_step = empty_script
		overlay_draw = overlay_startup_draw
		allowGame = false
		break
	case 99:  // End Stream
		overlay_step = empty_script
		overlay_draw = overlay_BRB_draw
		chat_surface_x = 20
		chat_surface_y= 20
		activeGamePosX = (1920-activeGameSurfaceWidth)*0.5
		activeGamePosY = 200
		overlay_variable1 = 100
		overlay_variable2 = 1
		overlay_variable3 = 0
		overlay_variable4 = 0
		break
	case 11:
		overlay_step = empty_script
		overlay_draw = overlay_mvt_draw
		chat_surface_x = 10
		chat_surface_y= 15
		allowGame = false
		break
	default:
		overlay_step = empty_script
		overlay_draw = overlay_draw_empty_script
		allowGame = false
		activeGamePosX = 0
		activeGamePosY = 0
	}
	
	if surface_exists(overlay_surface){
		surface_set_target(overlay_surface)
		draw_clear_alpha(c_black, 0)
		surface_reset_target()
	}
}

function overlay_draw_surfaceSetup(){
	if !surface_exists(overlay_surface){
		overlay_surface = surface_create(camera_width, camera_height)
		overlay_timer = 0	
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
	overlay_timer++
}

function overlay_main_draw(){
	overlay_draw_surfaceSetup()
	#region Draw Code
	
	if overlay_timer == 0{
		draw_sprite_part_ext(spr_overlay_background, 0, 0, 300, 1156, 368, -400, 987, 2, 2, -1, 1)
	}
	if overlay_timer >= 0 and overlay_timer < 360{
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
	
	if overlay_timer == 0{
		draw_sprite_part_ext(spr_overlay_background, 0, 0, 300, 1156, 368, -400, 987, 2, 2, -1, 1)
	}
	if overlay_timer >= 0 and overlay_timer < 360{
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
	
	if overlay_timer == 0{
		draw_sprite_part_ext(spr_overlay_background, 0, 0, 300, 1156, 368, -400, 987, 2, 2, -1, 1)
	}
	if overlay_timer >= 0 and overlay_timer < 360{
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
	if overlay_timer < 42{
		X = 1566 + irandom(10)-5
		Y = 349 - lerp(0, 343, (overlay_timer)/42)
		draw_circle(X, Y, irandom(12)+15, false)
		X = 1566 + lerp(0, 343, (overlay_timer)/42)
		Y = 349  + irandom(10)-5
		draw_circle(X, Y, irandom(12)+15, false)
	}else{
		if overlay_timer < 84{
			X = 1566 + lerp(0, 343, (overlay_timer-42)/42)
			Y = 6 + irandom(10)-5
			draw_circle(X, Y, irandom(12)+15, false)
			X = 1908 + irandom(10)-5
			Y = 349  - lerp(0, 343, (overlay_timer-42)/42)
			draw_circle(X, Y, irandom(12)+15, false)
		}
		if overlay_timer < 119{
			X = 1908 + irandom(10)-5
			Y = 349  + lerp(0, 623, (overlay_timer-42)/77)
			draw_circle(X, Y, irandom(12)+15, false)
		}
		if overlay_timer < 237{
			X = 1566 - lerp(0, 1553, (overlay_timer-42)/195)
			Y = 6 + irandom(10)-5
			draw_circle(X, Y, irandom(12)+15, false)
		}
		else if overlay_timer < 360{
			X = 6 + irandom(10)-5
			Y = 6 + lerp(0, 590, (overlay_timer-237)/123)
			draw_circle(X, Y, irandom(12)+15, false)	
		}
	}
	if overlay_timer < 77{
		X = 1568 + irandom(10)-5
		Y = 349 + lerp(0, 623, (overlay_timer)/77)
		draw_circle(X, Y, irandom(12)+15, false)
	}else{
		if overlay_timer < 119{
			X = 1566 + lerp(0, 343, (overlay_timer-78)/42)
			Y = 980 + irandom(10)-5
			draw_circle(X, Y, irandom(12)+15, false)
		}
		if overlay_timer < 273{
			X = 1566 - lerp(0, 1553, (overlay_timer-78)/195)
			Y = 980 + irandom(10)-5
			draw_circle(X, Y, irandom(12)+15, false)
		}else if overlay_timer < 360{
			X = 6 + irandom(10)-5
			Y = 980 - lerp(0, 390, (overlay_timer-273)/87)
			draw_circle(X, Y, irandom(12)+15, false)
		}
	}	
}

function overlay_secondary_draw(){
	overlay_draw_surfaceSetup()
	#region Draw Code
	
	if overlay_timer == 0{
		draw_sprite_part_ext(spr_overlay_background, 0, 0, 300, 1156, 368, -400, 987, 2, 2, -1, 1)
	}
	if overlay_timer >= 0 and overlay_timer < 12{
		var H = (mouse_x-camera_get_view_x(view_camera[0]))/obj_main.camera_width * 255
		draw_set_color(make_color_hsv(H, 191, 50 + (overlay_timer)*15))
		overaly_secondary_draw_brushDown()
	}
	
	#endregion
	overlay_draw_surfaceCleanup()
	overlay_draw_empty_script()
}

function overlay_secondary_thick_draw(){
	overlay_draw_surfaceSetup()
	#region Draw Code
	
	if overlay_timer == 0{
		draw_sprite_part_ext(spr_overlay_background, 0, 0, 300, 1156, 368, -400, 987, 2, 2, -1, 1)
	}
	if overlay_timer >= 0 and overlay_timer < 24{
		var H = (mouse_x-camera_get_view_x(view_camera[0]))/obj_main.camera_width * 255
		draw_set_color(make_color_hsv(H, 191, 50 + (overlay_timer)*7))
		overaly_secondary_draw_brushDown()
	}
	
	#endregion
	overlay_draw_surfaceCleanup()
	overlay_draw_empty_script()
}

function overlay_secondary_thicc_draw(){
	overlay_draw_surfaceSetup()
	#region Draw Code
	
	if overlay_timer == 0{
		draw_sprite_part_ext(spr_overlay_background, 0, 0, 300, 1156, 368, -400, 987, 2, 2, -1, 1)
	}
	if overlay_timer >= 0 and overlay_timer < 48{
		var H = (mouse_x-camera_get_view_x(view_camera[0]))/obj_main.camera_width * 255
		draw_set_color(make_color_hsv(H, 191, 50 + (overlay_timer)*4))
		overaly_secondary_draw_brushDown()
	}
	
	#endregion
	overlay_draw_surfaceCleanup()
	overlay_draw_empty_script()
}

function overlay_secondary_thiccest_draw(){
	overlay_draw_surfaceSetup()
	#region Draw Code
	
	if overlay_timer == 0{
		draw_sprite_part_ext(spr_overlay_background, 0, 0, 300, 1156, 368, -400, 987, 2, 2, -1, 1)
	}
	if overlay_timer >= 0 and overlay_timer < 96{
		var H = (mouse_x-camera_get_view_x(view_camera[0]))/obj_main.camera_width * 255
		draw_set_color(make_color_hsv(H, 191, 50 + (overlay_timer)*2))
		overaly_secondary_draw_brushDown()
	}
	
	#endregion
	overlay_draw_surfaceCleanup()
	overlay_draw_empty_script()
}

function overaly_secondary_draw_brushDown(){
	var oo = overlay_timer
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

function overlay_BRB_draw(){
	overlay_draw_surfaceSetup()
	#region Draw Code
	
	var ot = overlay_timer mod 1000
	if ot == 0{
		overlay_variable1 = random(150) + 50	
		overlay_variable2 = random(2)
		overlay_variable3 = random(25)
		overlay_variable4 = random(25)
		if irandom(50) == 0{
			overlay_variable3 = random(200)
			overlay_variable4 = random(200)
		}
	}
	draw_set_color(make_color_hsv(((ot + current_minute*5)*overlay_variable2) mod 255, overlay_variable1, 255))
	drawInwardRect(782, 200, 1138, 842, -ot)
	
	if ot > 500 {
		draw_set_color(make_color_hsv(irandom(255), 200, 200))
		var X = random(1920)
		var Y = random(1080)
		draw_rectangle(X, Y, X + overlay_variable3, Y+overlay_variable4, false)
	}
	
	// Clean up anything in the way
	gpu_set_blendmode(bm_subtract);
	draw_set_color(c_white)
	draw_rectangle(782, 200, 1137, 841, false)
	gpu_set_blendmode(bm_normal);

	#endregion	
	overlay_draw_surfaceCleanup()
	overlay_draw_empty_script()
}

function overlay_mvt_draw(){
	overlay_draw_surfaceSetup()
	#region Draw Code
	
	if overlay_timer == 0{
		draw_sprite_part_ext(spr_overlay_MvTBackground, 0, 0, 525, 1680, 368, 0, 987, 1.5, 1.5, -1, 1)
		draw_text_setup(fnt_blockEditor, fa_center, fa_top, c_white, 1)
		draw_text(1790, 40, "!play\n!whitelist")
	}
	if overlay_timer >= 0 and overlay_timer < 12{
		draw_set_color(make_color_hsv(85, 191, 50 + (overlay_timer)*15))
		overaly_mvt_draw_brushDown()
	}
	
	#endregion
	overlay_draw_surfaceCleanup()
	overlay_draw_empty_script()
}

function overaly_mvt_draw_brushDown(){
	var oo = overlay_timer
	drawInwardRect(0, 0, 1660, 987, oo)
	drawInwardRect(1660, 0, 1920, 987, oo)
}
function overlay_startup_draw(){
	overlay_draw_surfaceSetup()
	#region Draw Code
	
	if overlay_timer == 0{
		draw_clear_alpha(0x755E37, 1)
		draw_sprite_ext(spr_overlay_amaranthAboveTheClouds, 0, 0, 0, 1.42, 1.42, 0, -1, 1)
		draw_sprite_ext(spr_overlay_natureSummerHillsBack, 0, 0, 144, 1.42, 1.42, 0, -1, 1)
		draw_sprite_ext(spr_overlay_natureSummerHillsMid, 0, 0, 144, 1.42, 1.42, 0, -1, 1)
		draw_sprite_ext(spr_overlay_natureSummerHillsFront, 0, 0, 144, 1.42, 1.42, 0, -1, 1)
		var ow = 4
		for (var X = -ow; X<=ow; X++){
			for (var Y = -ow; Y<=ow; Y++){
				draw_sprite_ext(spr_overlay_amaranthLogoNL, 0, 964+X, 473+Y, 0.47, 0.47, 0, c_black, 1)	
			}
		}
		
		draw_sprite_ext(spr_overlay_amaranthLogo, 0, 964, 473, 0.47, 0.47, 0, -1, 1)
		draw_text_setup(fnt_overlayMessage, fa_right, fa_top)
		draw_text_outline(1900, 20, "Click to Shoot", 3, c_white, c_black)
	}
	
	#endregion
	overlay_draw_surfaceCleanup()
	overlay_draw_empty_script()
}
