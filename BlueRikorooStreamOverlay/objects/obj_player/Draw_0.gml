switch(anim_current){
case Anim.idle:
	draw_sprite_ext(anim_idle, anim_frame, x, y, facing, 1, 0, -1, 1)
	anim_frame += anim_idle_speed
	if anim_frame >= anim_idle_max{
		anim_frame -= anim_idle_max	
	}
	break
case Anim.idleRandom:
	draw_sprite_ext(anim_idleRandom, anim_frame, x, y, facing, 1, 0, -1, 1)
	anim_frame += anim_idleRandom_speed
	if anim_frame >= anim_idleRandom_max{
		anim_frame -= anim_idleRandom_max	
	}
	break
case Anim.run:
	draw_sprite_ext(anim_run, anim_frame, x, y, facing, 1, 0, -1, 1)
	anim_frame += anim_run_speed
	if anim_frame >= anim_run_max{
		anim_frame -= anim_run_max	
	}
	break
case Anim.fly:
	switch(anim_flyType){
	case AnimFly.directional:
		draw_sprite_ext(anim_fly, anim_frame, x, y-13, 1, 1, direction, -1, 1)
		draw_sprite_ext(anim_flyEyes, -1, x, y, facing, 1, 0, -1, 1)
		break
	}
	anim_frame += anim_fly_speed
	if anim_frame >= anim_fly_max{
		anim_frame -= anim_fly_max	
	}
	break
}