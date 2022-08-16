timer += 0.05

var A = 1
if deathTimer > 0{
	A = deathTimer/120
}
draw_sprite_ext(spr_heart, 0, x, y-32, sin(timer), 1, 0, color, A)