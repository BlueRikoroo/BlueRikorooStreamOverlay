function spawn_ea_standard(X, Y, S, D){
	var obj = instance_create_layer(X, Y, getLayer(Layer.attackF), obj_ea_standard)
	with(obj){
		speed = S
		direction = D
	}
	return obj
}

function spawn_ea_laser(X, Y, Follow, D, w, time){
	var obj = instance_create_layer(X, Y, getLayer(Layer.attackB), obj_ea_laser)
	with(obj){
		mainObj = Follow
		dir = D
		timer = time
		Width = w*0.5
	}
	return obj
}

function spawn_charge_particle(X, Y, Dist=50, Time=60, Color=c_aqua){
	var obj = instance_create_layer(X, Y, getLayer(Layer.attackF), obj_part_chargeing)
	with(obj){
		var dir = random(360)	
		x += lengthdir_x(Dist, dir)
		y += lengthdir_y(Dist, dir)
		speed = Dist/Time
		direction = dir+180
		alarm[0] = Time
		image_blend = Color
	}
}

function spawn_gmExplosion(X, Y, size=1, Time=17){
	var obj = instance_create_layer(X, Y, getLayer(Layer.attackB), obj_explosion)
	with(obj){
		image_xscale = size
		image_yscale = size
		image_speed = 17/Time
	}	
}