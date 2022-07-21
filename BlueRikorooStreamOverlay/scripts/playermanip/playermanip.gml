function createPlayer(X, Y, element, Name){
	var obj = instance_create_layer(X, Y, getLayer(Layer.player),obj_player)
	with(obj){
		username = Name
		switch(element){
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
			
			anim_run = spr_player_water_run
			anim_run_speed = 0.1
			anim_idle_max = 7
			break
		case Element.ice:
			break
		case Element.light:
			break
		case Element.shadow:
			break
		case Element.ai:
			break
		case Element.time:
			break
		}
		nameObj = instance_create_layer(x, y, layer, obj_player_namePlate)
		nameObj.image_yscale = 0.45
		nameObj.image_xscale = string_width(username)/60
	}
}