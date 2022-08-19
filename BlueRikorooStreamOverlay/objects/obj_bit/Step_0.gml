#region Death Timer

if deathTimer > 0{
	deathTimer--
	if deathTimer == 0{
		instance_destroy()	
	}
}

#endregion
subImg += imageSpeed
#region Collisions

if still{
	
}else if place_meeting(x, y+1+vspeed, obj_block){
	if abs(vspeed) < 0.05{
		vspeed = 0
		still = 0
	}else{
		vspeed *= -0.75
		tapOnce = true
	}
	if hspeed != 0{
		hspeed *= 0.98	
		if abs(hspeed) < 0.01{
			hspeed = 0
		}
	}
	if hspeed = 0 and vspeed = 0{
		still = true
		deathTimer = 36000
	}
}else{
	vspeed += grav
	if place_meeting(x+hspeed, y, obj_block){
		hspeed *= -0.98	
	}
}

#endregion
#region Touch Bits

if tapOnce and place_meeting(x, y, obj_bit){
	with(instance_place(x, y, obj_bit)){
		if other.Value >= Value and other.Value/4 < Value{
			other.Value += Value 
			instance_destroy()
		}
	}
	if Value > 10000{
		spr = spr_m_coin9
	}else if Value > 3000{
		spr = spr_m_coin8
	}else if Value > 1000{
		spr = spr_m_coin7	
	}else if Value > 300{
		spr = spr_m_coin6	
	}else if Value > 100{
		spr = spr_m_coin5	
	}else if Value > 30{
		spr = spr_m_coin4	
	}else if Value > 10{
		spr = spr_m_coin3	
	}else if Value > 3{
		spr = spr_m_coin2	
	}
}

#endregion
#region Despawn if off screen

if y > room_height
	instance_destroy()
	
#endregion