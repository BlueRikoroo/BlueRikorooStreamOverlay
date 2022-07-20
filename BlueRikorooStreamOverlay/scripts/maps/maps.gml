function load_map(mapName){
	ini_open("Maps/" + mapName)
	var totalBlocks = ini_read_real("Data", "BlockAmount", 0)
	var blockLayer = getLayer(Layer.blocks)
	for (var i = 0; i < totalBlocks; i++){
		var X = ini_read_real("Blocks", string(i) + ":X", 0)
		var Y = ini_read_real("Blocks", string(i) + ":Y", 0)
		if X > 0 and X < room_width and Y > 0 and Y < room_height{
			var obj = instance_create_layer(X, Y, blockLayer, obj_block)
			obj.tile = asset_get_index(ini_read_string("Blocks", string(i) + ":tile", ""))
			obj.tileData = ini_read_real("Blocks", string(i) + ":tileData", 0)
			obj.blockShape = ini_read_real("Blocks", string(i) + ":blockShape", 0)
		}
	}
	ini_close()
	re_tile()
}
function unload_map(){
	instance_destroy(obj_block)
	while ds_map_size(global.tileMap) > 0{
		var key = ds_map_find_first(global.tileMap)
		var tm = global.tileMap[? key]
		// show_debug_message("Deleting Tilemap " + string(tm))
		layer_tilemap_destroy(tm)
		ds_map_delete(global.tileMap, key)
	}
}