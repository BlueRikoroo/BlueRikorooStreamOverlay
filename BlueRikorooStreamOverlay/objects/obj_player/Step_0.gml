function TryJump(){
	if on_ground and !damaged{
		vspeed = -jumpForce*(1+random(1))
		on_ground = false
	}
}
#region Decisions

#region Which one?

if !obj_main.startingSoon or controlTimer == 0{
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
}else{
	var camx = camera_get_view_x(view_camera[0])
	controlTimer--
	if x < camx{
		decision = Movement.rightHurry
	}
	else if x > camx + 1920{
		decision = Movement.leftHurry
	}else if controlGoto+30 < x{
		decision = Movement.left
	}else if controlGoto-30 > x{
		decision = Movement.right
	}else{
		decision = Movement.idle	
	}
}

#endregion
#region Leaving

if leaving{
	decision = Movement.left
	if x < camera_get_view_x(view_camera[0])-400{
		instance_destroy()	
	}
}	

#endregion
#region Damanged

if damaged{
	decision = Movement.idle
	damageTimer++
	alpha = (damageTimer mod 4 ) / 4
	if damageTimer >= 600{
		damageTimer = -60*4
		damaged = false
	}
}else if damageTimer < 0{
	damageTimer++
	alpha = -(damageTimer mod 4 ) / 4
}else{
	alpha = 1
}

#endregion	
#region Action

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
performOptomizedCol()

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

if (obj_main.show_nametags or isKing) and instance_exists(nameObj) {
	with(nameObj){
		x = other.x
		y = other.y-32*other.isKing
		while place_meeting(x, y, obj_player_namePlate){
			y -= 15
		}
	}

	nameHeightTo = y-nameObj.y
	if abs(nameHeightTo-nameHeight) <= 1{
		nameHeight = nameHeightTo
	}else{
		nameHeight += sign(nameHeightTo-nameHeight)*2
	}
}

#endregion

if keyboard_check_pressed(ord("D")){
	damaged = true
}