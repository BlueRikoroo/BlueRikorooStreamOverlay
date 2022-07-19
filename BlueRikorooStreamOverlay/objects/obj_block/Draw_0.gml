switch(blockShape){
case BlockShape.block:
	draw_sprite_part(spr, 0, 330, 33, 32, 32, x, y) break
case BlockShape.slant_bl:
	draw_sprite_part(spr, 0, 33, 165, 32, 32, x, y) break
case BlockShape.slant_br:
	draw_sprite_part(spr, 0, 264, 132, 32, 32, x, y) break
case BlockShape.slant_tr:
	draw_sprite_part(spr, 0, 198, 165, 32, 32, x, y) break
case BlockShape.slant_tl:
	draw_sprite_part(spr, 0, 363, 165, 32, 32, x, y) break
}