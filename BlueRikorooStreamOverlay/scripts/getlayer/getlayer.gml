// Returns a layer based on the depth you want to use

function getLayer(Depth) {
	if ds_map_exists(global.layerMap,Depth){
		var l = ds_map_find_value(global.layerMap,Depth)
		if layer_exists(l)
			return l
		else{
			l = layer_create(Depth)
			ds_map_set(global.layerMap, Depth, l)
		}
	}else{
		var l = layer_create(Depth)
		ds_map_add(global.layerMap,Depth,l)
		return l
	}
}

enum Layer{
	blocks = -500,
	item = -20,
	attackF = -10,
	enemy = -5,
	player = 0,
	wild = 5,
	attackB = 10,
	background = 1000
}