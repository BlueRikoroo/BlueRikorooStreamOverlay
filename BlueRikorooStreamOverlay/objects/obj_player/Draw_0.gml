#region Player

var scale = (1 + isKing)*size
switch(anim_current){
case Anim.idle:
	if anim_idle == spr_player_metal{
		draw_sprite_ext(anim_idle, anim_frame, x, y-14*scale, facing*scale*squish, scale/squish, -3*x, shiney, 1)
	}else{
		draw_sprite_ext(anim_idle, anim_frame, x, y, facing*scale*squish, scale/squish, 0, shiney, 1)
	}
	anim_frame += anim_idle_speed
	if anim_frame >= anim_idle_max{
		anim_frame -= anim_idle_max	
	}
	break
case Anim.idleRandom:
	if anim_idle == spr_player_metal{
		draw_sprite_ext(anim_idleRandom, anim_frame, x, y-14*scale, facing*scale*squish, scale/squish, -3*x, shiney, 1)
	}else{
		draw_sprite_ext(anim_idleRandom, anim_frame, x, y, facing*scale*squish, scale/squish, 0, shiney, 1)
	}
	anim_frame += anim_idleRandom_speed
	if anim_frame >= anim_idleRandom_max{
		anim_frame -= anim_idleRandom_max	
	}
	break
case Anim.run:
	if anim_idle == spr_player_metal{
		draw_sprite_ext(anim_idle, anim_frame, x, y-14*scale, facing*scale*squish, scale/squish, -3*x, shiney, 1)
	}else{
		draw_sprite_ext(anim_run, anim_frame, x, y, facing*scale*squish, scale/squish, 0, shiney, 1)
	}
	anim_frame += anim_run_speed
	if anim_frame >= anim_run_max{
		anim_frame -= anim_run_max	
	}
	break
case Anim.fly:
	switch(anim_flyType){
	case AnimFly.directional:
		draw_sprite_ext(anim_fly, anim_frame, x, y-13*scale, scale*squish, scale/squish, direction, shiney, 1)
		break
	case AnimFly.directionalEyes:
		draw_sprite_ext(anim_fly, anim_frame, x, y-13*scale, scale*squish, scale/squish, direction, shiney, 1)
		draw_sprite_ext(anim_flyEyes, -1, x, y, facing*scale*squish, scale/squish, 0, shiney, 1)
		break
	case AnimFly.animation:
		if anim_idle == spr_player_metal{
			draw_sprite_ext(anim_idle, anim_frame, x, y-14*scale, facing*scale*squish, scale/squish, -3*x, shiney, 1)
		}else{
			draw_sprite_ext(anim_fly, anim_frame, x, y, facing*scale*squish, scale/squish, 0, shiney, 1)
		}
		break
	case AnimFly.gradual:
		draw_sprite_ext(anim_fly, clamp(round(vspeed*0.25/scale)+2, 0, 4), x, y, facing*scale*squish, scale/squish, 0, shiney, 1)
		break
	case AnimFly.rotate:
		draw_sprite_ext(anim_fly, 0, x, y-14*scale, facing*scale*squish, scale/squish, -anim_frame*facing, shiney, 1)
		break
	}
	anim_frame += anim_fly_speed
	if anim_frame >= anim_fly_max{
		anim_frame -= anim_fly_max	
	}
	break
}

if isKing{
	draw_sprite_ext(spr_crown, 0, x, y-22, 2*facing*size, 2, 0, -1, 1)
}

#endregion
#region Name

if obj_main.show_nametags or isKing{
	draw_set_font(fnt_playerName)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	
	var name = username
	if cheerAmount >= 50{
		name = username + " - " + string(cheerAmount)	
	}

	//Draw Outline
	draw_set_color(c_black)
	for(var X = -1; X <= 1; X++){
		for(var Y = -1; Y <= 1; Y++){
			draw_text(x+X,y-45+Y-nameHeight,name)
		}
	}

	//Draw Text
	draw_set_color(c_white)
	draw_text(x,y-45-nameHeight,name)
}

#endregion