var A = 1
if deathTimer > 0{
	A = deathTimer/120
}
draw_sprite_ext(spr, subImg, x, y, 1, 1, 0, -1, A)