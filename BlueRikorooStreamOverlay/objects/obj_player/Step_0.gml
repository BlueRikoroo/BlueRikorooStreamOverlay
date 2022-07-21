function TryJump(){
	if on_ground{
		vspeed = -jumpForce*(1+random(1))
		on_ground = false
	}
}
#region Decisions

var camx = camera_get_view_x(view_camera[0])
if x < camx{
	decision = Movement.rightHurry
}
else if x > camx + 1920{
	decision = Movement.leftHurry
}
else if x < camx + 150{
	decision = Movement.right
}
else if x > camx + 1770{
	decision = Movement.left
}else{
	switch(irandom(250)){
	case 0: case 1: case 2: decision = Movement.idle break
	case 3: decision = Movement.left break
	case 4: decision = Movement.right break
	}
}

switch(decision){
case Movement.idle:
	if irandom(300) == 0
		TryJump()
	break
case Movement.right:
	hspeed += accel
	if irandom(300) == 0
		TryJump()
	break
case Movement.left:
	hspeed -= accel
	if irandom(300) == 0
		TryJump()
	break
case Movement.rightHurry:
	hspeed += accel*2
	TryJump()
	break
case Movement.leftHurry:
	hspeed -= accel*2
	TryJump()
	break
}

#endregion
#region Collisions and Automated Movement

#region Movement Check

if hspeed > frict{
	hspeed -= frict
}else if hspeed < -frict{
	hspeed += frict
}else{
	hspeed = 0
}
if hspeed > maxSpeed{
	hspeed = maxSpeed
}else if hspeed < -maxSpeed{
	hspeed = -maxSpeed
}
if hspeed < 0{
	facing = Facing.left
}
else if hspeed > 0{
	facing = Facing.right
}
if on_ground and hspeed != 0 and vspeed >= 0{
	on_ground = place_meeting(x, y+1, obj_block)
}
if y > room_height{
	y = 0
	vspeed = 0
}
#endregion
#region Flying Check

if vspeed < 0{
	on_ground = false	
}

#endregion
#region Gravity

if !on_ground{
	vspeed += grav
}

#endregion
#region Verticle Collisions

if !on_ground or hspeed != 0 or vspeed < 0{
	if place_meeting(x, y+vspeed, obj_block){
		var vs = sign(vspeed)
		while(!place_meeting(x, y+vs, obj_block)){
			y+=vs	
		}
		vspeed = 0
		if vs > 0{
			on_ground = true	
		}
	}
}

#endregion
#region Horizontal Collisions

if hspeed != 0{
	if place_meeting(x+hspeed, y+vspeed, obj_block){
		var hs = sign(hspeed)
		while(!place_meeting(x+hs, y+vspeed, obj_block)){
			x += hs
		}
		hspeed = 0
	}
}

#endregion

#endregion
#region Animation Switching

if on_ground{
	if hspeed == 0{
		if anim_current != Anim.idle and anim_current != Anim.idleRandom{
			anim_current = Anim.idle
			anim_frame = 0
		}
		else if anim_current != Anim.idleRandom and anim_frame >= anim_idle_max-1 and irandom(5) == 0{
			anim_current = Anim.idleRandom
			anim_frame = 0
		}else if anim_current == Anim.idleRandom and anim_frame >= anim_idleRandom_max-1{
			anim_current = Anim.idle
			anim_frame = 0
		}
	}else if anim_current != Anim.run{
		anim_current = Anim.run
		anim_frame = 0
	}
}else if anim_current != Anim.fly{
	anim_current = Anim.fly
	anim_frame = 0
}
#endregion
#region Nameplate

if obj_main.show_nametags{
	with(nameObj){
		x = other.x
		y = other.y
		var i = 0
		while place_meeting(x, y, obj_player_namePlate){
			y += 15
			if i >= 6{
				y = other.y
				break
			}
		}
	}

	nameHeightTo = nameObj.y-y
	nameHeight += sign(nameHeightTo-nameHeight)
}

#endregion