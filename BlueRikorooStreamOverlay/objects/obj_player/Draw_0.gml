#region Player

var scale = 1 + isKing
switch(anim_current){
case Anim.idle:
	draw_sprite_ext(anim_idle, anim_frame, x, y, facing*scale, scale, 0, -1, 1)
	anim_frame += anim_idle_speed
	if anim_frame >= anim_idle_max{
		anim_frame -= anim_idle_max	
	}
	break
case Anim.idleRandom:
	draw_sprite_ext(anim_idleRandom, anim_frame, x, y, facing*scale, scale, 0, -1, 1)
	anim_frame += anim_idleRandom_speed
	if anim_frame >= anim_idleRandom_max{
		anim_frame -= anim_idleRandom_max	
	}
	break
case Anim.run:
	draw_sprite_ext(anim_run, anim_frame, x, y, facing*scale, scale, 0, -1, 1)
	anim_frame += anim_run_speed
	if anim_frame >= anim_run_max{
		anim_frame -= anim_run_max	
	}
	break
case Anim.fly:
	switch(anim_flyType){
	case AnimFly.directional:
		draw_sprite_ext(anim_fly, anim_frame, x, y-13, scale, scale, direction, -1, 1)
		draw_sprite_ext(anim_flyEyes, -1, x, y, facing*scale, scale, 0, -1, 1)
		break
	case AnimFly.animation:
		draw_sprite_ext(anim_fly, anim_frame, x, y, facing*scale, scale, 0, -1, 1)
		break
	}
	anim_frame += anim_fly_speed
	if anim_frame >= anim_fly_max{
		anim_frame -= anim_fly_max	
	}
	break
}

if isKing{
	draw_sprite_ext(spr_crown, 0, x, y-22, 2*facing, 2, 0, -1, 1)
}

#endregion
#region Name

draw_set_font(fnt_playerName)
draw_set_halign(fa_middle)
draw_set_valign(fa_center)

//Draw Outline
draw_set_color(c_black)
for(var X = -1; X <= 1; X++){
	for(var Y = -1; Y <= 1; Y++){
		draw_text(x+X,y-45+Y-32*isKing-nameHeight,username)
	}
}

//Draw Text
draw_set_color(c_white)
draw_text(x,y-45-32*isKing-nameHeight,username)

#endregion