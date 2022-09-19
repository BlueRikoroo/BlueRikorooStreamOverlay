// Inherit the parent event
event_inherited();

instance_destroy(obj_korioroPiece)

// Remove all the sprites created to free up mem
for (var k = ds_map_find_first(pieceSprites); !is_undefined(k); k = ds_map_find_next(pieceSprites, k)) {
	var v = pieceSprites[? k];
	sprite_delete(v)
}
ds_map_destroy(pieceSprites)
ds_list_destroy(pieceOrder)