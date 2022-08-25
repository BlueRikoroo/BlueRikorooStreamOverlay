#region Mode Switching

if keyboard_check(vk_anykey) and mode == "normal"{
	switch(keyboard_string){
	case "blocks":
		mode = "editBlocks" 
		unload_map()
		instance_create_layer(0, 0, layer, obj_blockEditor)
		
		break
	case "test":
		testing = !testing
		keyboard_string = ""
		break
	case "window":
		window_toggle = !window_toggle
		if window_toggle
			window_set_size(camera_width*0.5, camera_height*0.5)
		else
			window_set_size(camera_width, camera_height)
		keyboard_string = ""
		break
	case "player":
		if testing{
			keyboard_string = ""
			var e = [Element.neutral, Element.fire, Element.earth,
			  Element.metal, Element.nature, Element.storm, Element.water,
			  Element.ice, Element.light, Element.shadow, Element.time, Element.ai]
			for (var i = 0; i < array_length(e); i++){
				createPlayer(camera_get_view_x(view_camera[0])+480 + 64*i,camera_get_view_y(view_camera[0])+540,e[i],"BlueRikorooTest")
			}
		}
	}
}

#endregion
#region Map Loading

if keyboard_check_pressed(vk_lshift){
	if mode == "normal"{
		keyboard_string = ""
		mode = "mapLoading"
	}else if mode == "mapLoading"{
		try{
			var num = real(keyboard_string)
			keyboard_string = ""
			ini_open("MapBinds.ini")
			currentMap = ini_read_string("MapBinds", string(num), "")
			ini_close()
			unload_map()
			load_map(currentMap)
		}
		catch(error){
			show_debug_message(error)
		}
		mode = "normal"
	}
}
if mode == "mapLoading" and keyboard_check_pressed(vk_backspace){
	mode = "normal"	
}

#endregion
#region Overlay Loading

overlay_step()

if keyboard_check_pressed(vk_rshift){
	if mode == "normal"{
		keyboard_string = ""
		mode = "overlayLoading"
	}else if mode == "overlayLoading"{
		try{
			var num = real(keyboard_string)
			keyboard_string = ""
			load_overlay(num)
			currentOverlay = num
		}
		catch(error){
			show_debug_message(error)
		}
		mode = "normal"	
	}
	
}
if mode == "overlayLoading" and keyboard_check_pressed(vk_backspace){
	mode = "normal"	
}

#endregion
#region Camera Movement

if cameraMoving{
	var X = camera_get_view_x(view_camera[0])
	var Y = camera_get_view_y(view_camera[0])
	X += (cameraMoveToX-X)*0.1
	Y += (cameraMoveToY-Y)*0.1
	if point_distance(X, Y, cameraMoveToX, cameraMoveToY) < 0.1{
		cameraMoving = false
		X = cameraMoveToX
		Y = cameraMoveToY
	}
	camera_set_view_pos(view_camera[0], X, Y)
}

if mode == "normal"{
	if keyboard_check_pressed(vk_numpad1){
		cameraMoving = true
		cameraMoveToX = 1920
		cameraMoveToY = 1080
	}
	if keyboard_check_pressed(vk_numpad2){
		cameraMoving = true
		cameraMoveToX = 1920
		cameraMoveToY = 1032
	}
	if keyboard_check_pressed(vk_numpad3){
		cameraMoving = true
		cameraMoveToX = 0
		cameraMoveToY = 1080
	}
	if keyboard_check_pressed(vk_numpad4){
		cameraMoving = true
		cameraMoveToX = 3840
		cameraMoveToY = 1080
	}
}

#endregion
#region Global Keys

if keyboard_check_direct(ord("O")){
	if !globalKeyDown{
		if keyboard_check_direct(ord("1")){
			globalKeyDown = true
		}
	}
}else{
	globalKeyDown = false	
}

#endregion
#region Mouse

if keyboard_string == "mouse"{
	var mouseObj = getUserMouse("BlueRikoroo")
	mouseObj.x = device_mouse_x_to_gui(0)
	mouseObj.y = device_mouse_y_to_gui(0)
	with(mouseObj){
		mouse_event("mousemove")
	}
}

#endregion