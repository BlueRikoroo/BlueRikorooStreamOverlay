if !collision_point(mouse_x, mouse_y, obj_block, false, false){
	var obj = instance_create_layer(snap(mouse_x-16, 32),snap(mouse_y-16, 32),getLayer(Layer.blocks),obj_block)
	obj.blockShape = blockShape
	obj.visible = true
	switch(blockType){
	case BlockType.grass:
		obj.spr = spr_tile_wall_grass_summer
		obj.tile = tile_wall_grass_summer
		break
	}
	with(obj){
		if place_meeting(x, y, obj_block){
			instance_destroy()	
		}
	}
}