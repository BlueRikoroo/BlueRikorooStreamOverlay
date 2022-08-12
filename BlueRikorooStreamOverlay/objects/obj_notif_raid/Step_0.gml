#region Shoot off to spot for portal

if timer == 180{  // 60*3
	path_start(path_raidPortalTraversal, 20, path_action_stop, false)
	audio_play_sfx(snd_fire_shotgun, 0, false, 1, 0.9)
	looping_sound = audio_play_sfx(snd_rockthrust_rocks, 0, true, 1, 0.7)
}
if timer >= 180 and !portalActive and deathTimer <= 0{
	part_emitter_region(part_system, part_emitter_main, x, x, y, y, ps_shape_line, ps_distr_linear)
	part_emitter_burst(part_system, part_emitter_main, obj_main.particle_portalRocket, 5)
}

#endregion
#region Spawn Peeps

if portalActive{
	part_emitter_region(part_system, part_emitter_portal, x-25, x+25, y-125,y+125,ps_shape_ellipse,ps_distr_gaussian)
	part_emitter_burst(part_system, part_emitter_portal, obj_main.particle_raidPortal, 5)
	playerSpawnDelay--
	if playerSpawnDelay <= 0{
		playerSpawnDelay = 3
		var obj = createPlayer(x, y, getRandomElement(), username + " Raid")
		obj.hspeed = random(10)+5
		obj.vspeed = -random(10)-5
		obj.alarm[0] = 18000 - irandom(3600) // 5 minutes to despawn - some random minute
		raidAmountCurrent++
		if raidAmountCurrent >= raidAmount{
			portalActive = false
			obj_notifHandler.handlingNotif = false
			deathTimer = 200
			audio_sound_gain(looping_sound, 0, 2000)
		}
	}
}

#endregion
#region Death Timer

if deathTimer > 0{
	deathTimer--
	if deathTimer <= 0{
		instance_destroy()	
	}
}

#endregion
#region Play Rikoroo sound

if timer == 1{
	audio_play_sfx(snd_notification_rikoroooo)	
}

#endregion