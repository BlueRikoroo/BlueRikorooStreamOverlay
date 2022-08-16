#region Gravity

if !on_ground{
	vspeed += grav
}

#endregion
#region Collisions

if !on_ground or hspeed != 0 or vspeed < 0{
	if place_meeting(x, y+vspeed, obj_block){
		var vs = sign(vspeed)
		while(!place_meeting(x, y+vs, obj_block)){
			y+=vs	
		}
		vspeed = -vspeed * 0.7
		hspeed *= 0.7
		if vs > 0 and abs(hspeed) < 1 and abs(vspeed) < 1{
			on_ground = true	
			hspeed = 0
			vspeed = 0
			deathTimer = 120
		}
	}
}
if hspeed != 0{
	if place_meeting(x+hspeed, y+vspeed, obj_block){
		var hs = sign(hspeed)
		while(!place_meeting(x+hs, y+vspeed, obj_block)){
			x += hs
		}
		hspeed = -hspeed * 0.7
	}
}

#endregion
#region Death Timer

if deathTimer > 0{
	deathTimer--
	if deathTimer == 0{
		instance_destroy()	
	}
}

#endregion