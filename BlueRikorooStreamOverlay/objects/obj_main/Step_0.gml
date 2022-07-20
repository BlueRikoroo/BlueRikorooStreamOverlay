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
			num = real(keyboard_string)
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

#endregion