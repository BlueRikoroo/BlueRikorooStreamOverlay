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
		ini_write_string("Blocks", string(blockNum) + ":tile", tileset_get_name(tile))
		ini_write_string("Blocks", string(blockNum) + ":spr", sprite_get_name(spr))
		ini_write_real("Blocks", string(blockNum) + ":tileData", tileData)
		ini_write_real("Blocks", string(blockNum) + ":blockShape", blockShape)
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
}
saveState += 1
if saveState > 2
	saveState = 0