#region Shoot off 

if timer == 180{  // 60*3
	var X = camera_get_view_x(view_camera[0]) + gui_xpos
	var Y = camera_get_view_y(view_camera[0]) + gui_ypos
	var obj = instance_create_layer(X, Y, getLayer(Layer.player), obj_subStatue)
	obj.hspeed = -random(15) + 5
	obj.vspeed = -random(10)
	obj.username = username
	obj_main.userToObj[? username] = id
	var element = getUserElement(username)
	while element == Element.neutral or element = Element.time or element == Element.ai{
		element = getRandomElement()	
	}
	obj.element = element
	switch(element){
	case Element.fire: obj.elementalSpr = spr_subStatue_fire break
	case Element.earth: obj.elementalSpr = spr_subStatue_earth break
	case Element.metal: obj.elementalSpr = spr_subStatue_metal break
	case Element.storm: obj.elementalSpr = spr_subStatue_storm break
	case Element.nature: obj.elementalSpr = spr_subStatue_nature break
	case Element.water: obj.elementalSpr = spr_subStatue_water break
	case Element.ice: obj.elementalSpr = spr_subStatue_ice break
	case Element.light: obj.elementalSpr = spr_subStatue_light break
	case Element.shadow: obj.elementalSpr = spr_subStatue_shadow break
	}
	obj.tier = tier
	switch(tier){
	case 1: obj.font = fnt_subStatueUsername_tier1 break
	case 2: obj.font = fnt_subStatueUsername_tier2 break
	case 3: obj.font = fnt_subStatueUsername_tier3 break
	}
}

#endregion

#region Play Rikoroo sound

if timer == 1{
	audio_play_sfx(snd_notification_rikoroooo)	
}

#endregion