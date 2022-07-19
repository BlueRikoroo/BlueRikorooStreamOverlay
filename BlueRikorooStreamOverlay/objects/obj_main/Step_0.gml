#region Mode Switching

if keyboard_check(vk_anykey) and mode == "normal"{
	switch(keyboard_string){
	case "blocks":
		mode = "editBlocks" 
		layer_destroy(Layer.blocks)
		instance_create_layer(0, 0, layer, obj_blockEditor)
		
		break
	}
	if keyboard_check(vk_backspace){
		mode = "normal"	
	}
}

#endregion