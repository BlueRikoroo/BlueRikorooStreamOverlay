function createPlayer(X, Y, element, Name){
	var obj = instance_create_layer(X, Y, getLayer(Layer.player),obj_player)
	with(obj){
		username = Name
		setPlayerAnimations(element)
		nameObj = instance_create_layer(x, y, layer, obj_player_namePlate)
		nameObj.image_yscale = 0.45
		nameObj.image_xscale = string_width(username)/60
		alarm[0] = 72000  // 20*60*60 = 20minutes to despawn
		cheerAmount = getUserCheerData(username)
		isKing = (obj_main.currentKing == username)
		if irandom(1000) == 0
			shiney = make_color_rgb(irandom(150)+55, irandom(150)+55, irandom(150)+55)
		var data = getCharMods(Name)
		size = data[0]
		squish = data[1]
		if data[2] != -1
			shiney = data[2]
	}
	return obj
}
function setPlayerAnimations(elemenT){
	element = elemenT
	switch(elemenT){
	case Element.fire:
		anim_idle = spr_player_fire_idle
		anim_idle_speed = 0.15
		anim_idle_max = 10
		anim_idleRandom = spr_player_fire_idle
		anim_idleRandom_speed = 0.15
		anim_idleRandom_max = 10
		anim_run = spr_player_fire_run
		anim_run_speed = 0.15
		anim_run_max = 11
		anim_fly = spr_player_fire_fly
		anim_fly_speed = 0.15
		anim_fly_max = 11
		anim_flyEyes = spr_player_fire_eyes
		break
	case Element.earth:
		anim_idle = spr_player_earth_idle
		anim_idle_speed = 0.15
		anim_idle_max = 8
		anim_idleRandom = spr_player_earth_idle
		anim_idleRandom_speed = 0.15
		anim_idleRandom_max = 8
		anim_run = spr_player_earth_run
		anim_run_speed = 0.25
		anim_run_max = 6
		anim_flyType = AnimFly.animation
		anim_fly = spr_player_earth
		anim_fly_speed = 0
		anim_fly_max = 1
		break
	case Element.metal:
		anim_idle = spr_player_metal
		anim_idle_speed = 0.05
		anim_idle_max = 1
		anim_idleRandom = spr_player_metal_idleRandom
		anim_flyType = AnimFly.animation
		break
	case Element.storm:
		anim_idle = spr_player_storm_idle
		anim_idle_speed = 0.1
		anim_idle_max = 6
		anim_idleRandom = spr_player_storm_idle
		anim_idleRandom_speed = 0.1
		anim_idleRandom_max = 6
		anim_run = spr_player_storm_run
		anim_run_speed = 0.1
		anim_run_max = 6
		anim_flyType = AnimFly.gradual
		anim_fly = spr_player_storm_fly
		break
	case Element.nature:
		anim_idle = spr_player_nature_idle
		anim_idle_speed = 0.1
		anim_idle_max = 45
		anim_idleRandom = spr_player_nature
		anim_idleRandom_speed = 0.01
		anim_idleRandom_max = 1
		anim_run = spr_player_nature_run
		anim_run_speed = 0.2
		anim_run_max = 10
		anim_flyType = AnimFly.rotate
		anim_fly = spr_player_nature_center
		anim_fly_speed = 6
		anim_fly_max = 360
		break
	case Element.water:
		anim_idle = spr_player_water_idle
		anim_idle_speed = 0.1
		anim_idle_max = 8
		anim_idleRandom = spr_player_water_idle
		anim_idleRandom_speed = 0.1
		anim_idleRandom_max = 8
		anim_run = spr_player_water_run
		anim_run_speed = 0.1
		anim_idle_max = 7
		anim_flyType = AnimFly.directional
		anim_fly = spr_player_water_fly
		anim_fly_speed = 0.1
		anim_fly_max = 6
		break
	case Element.ice:
		anim_idle = spr_player_ice_idle
		anim_idle_speed = 0.1
		anim_idle_max = 12
		anim_idleRandom = spr_player_ice_idleRandom
		anim_idleRandom_speed = 0.1
		anim_idleRandom_max = 12
		anim_run = spr_player_ice_run
		anim_run_speed = 0.1
		anim_run_max = 15
		anim_flyType = AnimFly.animation
		anim_fly = spr_player_ice_run
		anim_fly_speed = 0.1
		anim_fly_max = 15
		break
	case Element.light:
		anim_idle = spr_player_light_idle
		anim_idle_speed = 0.1
		anim_idle_max = 9
		anim_idleRandom = spr_player_light_idle
		anim_idleRandom_speed = 0.1
		anim_idleRandom_max = 9
		anim_run = spr_player_light_run
		anim_run_speed = 0.1
		anim_run_max = 7
		anim_flyType = AnimFly.gradual
		anim_fly = spr_player_light_fly
		break
	case Element.shadow:
		anim_idle = spr_player_shadow_idle
		anim_idle_speed = 0.1
		anim_idle_max = 7
		anim_idleRandom = spr_player_shadow_idle
		anim_idleRandom_speed = 0.1
		anim_idleRandom_max = 7
		anim_run = spr_player_shadow_run
		anim_run_speed = 0.1
		anim_run_max = 7
		anim_fly = spr_player_shadow_fly
		anim_fly_speed = 0.1
		anim_fly_max = 7
		anim_flyEyes = spr_player_shadow_eyes
		break
	case Element.ai:
		anim_idle = spr_player_ai
		anim_idle_speed = 0.1
		anim_idle_max = 4
		anim_idleRandom = spr_player_ai
		anim_idleRandom_speed = 0.1
		anim_idleRandom_max = 4
		anim_run = spr_player_ai
		anim_run_speed = 0.1
		anim_run_max = 4
		anim_flyType = AnimFly.animation
		anim_fly = spr_player_ai
		anim_fly_speed = 0.1
		anim_fly_max = 4
		break
	case Element.time:
		shiney = 0x8781BE
		break
	}	
}
function spawnAttack(element, Xs, Ys, Xt, Yt){
	var obj;
	var dir = point_direction(Xs, Ys, Xt, Yt)
	switch(element){
	case Element.fire: obj = spawnAttackFire(Xs, Ys,dir) break
	case Element.earth: obj = spawnAttackEarth(Xs, Ys,dir) break
	case Element.metal: obj = spawnAttackMetal(Xs, Ys,dir) break
	case Element.storm: obj = spawnAttackStorm(Xs, Ys,dir) break
	case Element.nature: obj = spawnAttackNature(Xs, Ys,dir) break
	case Element.water: obj = spawnAttackWater(Xs, Ys,dir) break
	case Element.ice: obj = spawnAttackIce(Xs, Ys,dir) break
	case Element.light: obj = spawnAttackLight(Xs, Ys,dir) break
	case Element.shadow: obj = spawnAttackShadow(Xs, Ys,dir) break
	default: obj = spawnAttackNeutral(Xs, Ys,dir) break
	}
	obj.speed = 20
	obj.direction = point_direction(Xs, Ys, Xt, Yt)
	return obj
}
function spawnAttackNeutral(X, Y, dir){
	var obj = instance_create_layer(X, Y, getLayer(Layer.attackF), par_playerAttack)
	with(obj){
		stepFunct = emitterFollowStep
		destroyFunct = emitterDestroy
		partType = obj_main.particle_neutralBullet
		emitter = part_emitter_create(global.particle_system);
		part_emitter_region(global.particle_system,emitter,x,x,y,y,0,0);
		part_emitter_stream(global.particle_system,emitter,partType,3);
	}
	return obj
}
function spawnAttackFire(X, Y, dir){
	var obj = instance_create_layer(X, Y, getLayer(Layer.attackF), par_playerAttack)
	with(obj){
		stepFunct = emitterFollowStep
		destroyFunct = emitterDestroy
		
		partType = obj_main.particle_fireBullet
		
		emitter = part_emitter_create(global.particle_system);
		part_emitter_region(global.particle_system,emitter,x,x,y,y,0,0);
		part_emitter_stream(global.particle_system,emitter,partType,10);
	}
	
	return obj	
}
function spawnAttackEarth(X, Y, dir){
	var obj = instance_create_layer(X, Y, getLayer(Layer.attackF), par_playerAttack)
	with(obj){
		stepFunct = emitterFollowStep
		destroyFunct = emitterDestroy
		sprite_index = spr_boulder_fling
		
		partType = obj_main.particle_earthBullet
		
		emitter = part_emitter_create(global.particle_system);
		part_emitter_stream(global.particle_system,emitter,partType,-3);
	}	
	return obj
}
function spawnAttackMetal(X, Y, dir){
	var obj = instance_create_layer(X, Y, getLayer(Layer.attackF), par_playerAttack)
	with(obj){
		stepFunct = emitterFollowStep
		destroyFunct = emitterDestroy
		sprite_index = 	spr_metal_spike
		image_angle = dir
		image_index = 1
		image_speed = 0
		
		partType = obj_main.particle_metalBullet
		
		emitter = part_emitter_create(global.particle_system);
		part_emitter_stream(global.particle_system,emitter,partType,1);
	}	
	return obj
}
function spawnAttackStorm(X, Y, dir){
	var obj = instance_create_layer(X, Y, getLayer(Layer.attackF), par_playerAttack)
	with(obj){
		stepFunct = emitterFollowStep
		destroyFunct = emitterDestroy
		sprite_index = spr_at_elorb
		image_xscale = 3
		image_yscale = 3
		image_speed = 0.25
		
		partType = obj_main.particle_stormBullet
		
		emitter = part_emitter_create(global.particle_system);
		part_emitter_stream(global.particle_system,emitter,partType,1);
	}	
	return obj
}
function spawnAttackNature(X, Y, dir){
	var obj = instance_create_layer(X, Y, getLayer(Layer.attackF), par_playerAttack)
	with(obj){
		stepFunct = emitterFollowStep
		destroyFunct = emitterDestroy
		sprite_index = spr_at_leafBoomerang
		image_angle = dir
		
		partType = obj_main.particle_natureBullet
		
		emitter = part_emitter_create(global.particle_system);
		part_emitter_stream(global.particle_system,emitter,partType,1);
	}	
	return obj
}
function spawnAttackWater(X, Y, dir){
	var obj = instance_create_layer(X, Y, getLayer(Layer.attackF), par_playerAttack)
	with(obj){
		stepFunct = emitterFollowStep
		destroyFunct = emitterDestroy
		sprite_index = spr_waterBlob
		image_angle = dir
		
		partType = obj_main.particle_waterBullet
		
		emitter = part_emitter_create(global.particle_system);
		part_emitter_stream(global.particle_system,emitter,partType,1);
	}	
	return obj
}
function spawnAttackIce(X, Y, dir){
	var obj = instance_create_layer(X, Y, getLayer(Layer.attackF), par_playerAttack)
	with(obj){
		stepFunct = emitterFollowStep
		destroyFunct = emitterDestroy
		sprite_index = spr_ice_shard
		image_angle = dir
		
		partType = obj_main.particle_iceBullet
		
		emitter = part_emitter_create(global.particle_system);
		part_emitter_stream(global.particle_system,emitter,partType,-4);
	}
	return obj
}
function spawnAttackLight(X, Y, dir){
	var obj = instance_create_layer(X, Y, getLayer(Layer.attackF), par_playerAttack)
	with(obj){
		stepFunct = emitterFollowStep
		destroyFunct = emitterDestroy
		
		partType = obj_main.particle_lightBullet
		
		emitter = part_emitter_create(global.particle_system);
		part_emitter_stream(global.particle_system,emitter,partType,1);
	}	
	return obj
}
function spawnAttackShadow(X, Y, dir){
	var obj = instance_create_layer(X, Y, getLayer(Layer.attackF), par_playerAttack)
	with(obj){
		stepFunct = emitterFollowStep
		destroyFunct = emitterDestroy
		sprite_index = spr_shadow_knife
		image_angle = dir
		
		partType = obj_main.particle_shadowBullet
		
		emitter = part_emitter_create(global.particle_system);
		part_emitter_stream(global.particle_system,emitter,partType,1);
	}	
	return obj
}

function emitterFollowStep(){
	part_emitter_region(global.particle_system,emitter,x,x,y,y,0,0);
}
function emitterDestroy(){
	part_emitter_destroy(global.particle_system, emitter)	
}