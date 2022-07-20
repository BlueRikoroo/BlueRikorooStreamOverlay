switch(saveState){
case 0:
	keyboard_string = ""
	break
case 1:
	mapName = keyboard_string + ".ini"
	ini_open("Maps/" + mapName)
	ini_write_real("Data", "BlockAmount", instance_number(obj_block))
	var blockNum = 0
	with(obj_block){
		ini_write_real("Blocks", string(blockNum) + ":X", x)
		ini_write_real("Blocks", string(blockNum) + ":Y", y)
		ini_write_string("Blocks", string(blockNum) + ":tile", tileset_get_name(tile))
		ini_write_string("Blocks", string(blockNum) + ":spr", sprite_get_name(spr))
		ini_write_real("Blocks", string(blockNum) + ":tileData", tileData)
		ini_write_real("Blocks", string(blockNum) + ":blockShape", blockShape)
		blockNum++
	}
	ini_close()
	break
case 2:
	try{
		num = real(keyboard_string)
		ini_open("MapBinds.ini")
		ini_write_string("MapBinds", string(num), mapName)
		ini_close()
	}catch(error){
		show_debug_message(error)
	}
	break
case 3:
	with(obj_block){
		instance_destroy()	
	}
	mapName = keyboard_string + ".ini"
	ini_open("Maps/" + mapName)
	var totalBlocks = ini_read_real("Data", "BlockAmount", 0)
	var blockLayer = getLayer(Layer.blocks)
	for (var i = 0; i < totalBlocks; i++){
		var X = ini_read_real("Blocks", string(i) + ":X", 0)
		var Y = ini_read_real("Blocks", string(i) + ":Y", 0)
		var obj = instance_create_layer(X, Y, blockLayer, obj_block)
		obj.tile = asset_get_index(ini_read_string("Blocks", string(i) + ":tile", ""))
		obj.spr = asset_get_index(ini_read_string("Blocks", string(i) + ":spr", ""))
		obj.tileData = ini_read_real("Blocks", string(i) + ":tileData", 0)
		obj.blockShape = ini_read_real("Blocks", string(i) + ":blockShape", 0)
		obj.visible = true
	}
	ini_close()
	break
}
keyboard_string = ""
saveState += 1
if saveState > 2
	saveState = 0