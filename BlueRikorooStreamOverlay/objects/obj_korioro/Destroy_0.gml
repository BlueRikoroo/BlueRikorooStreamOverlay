// Inherit the parent event
event_inherited();

ini_open("Korioro/Data.ini")

for(var X = 0; X < 12; X++){
	for(var Y = 0; Y < 22; Y++){
		var cord = string(X) + ";" + string(Y)
		if instance_exists(board[X][Y]){
			var o = board[X][Y]
			ini_write_string("Board", cord, o.username + ";" + string(o.piece) + ";" + string(o.num) + ";" + string(o.angle))
		}else
			ini_write_string("Board", cord, "noone")
	}
}
ini_write_real("Score", "Current", currentScore)

ini_close()

instance_destroy(obj_korioroPiece)

// Remove all the sprites created to free up mem
for (var k = ds_map_find_first(pieceSprites); !is_undefined(k); k = ds_map_find_next(pieceSprites, k)) {
	var v = pieceSprites[? k];
	sprite_delete(v)
}
ds_map_destroy(pieceSprites)
ds_list_destroy(pieceOrder)
ds_list_destroy(pieceOrderPriority)
