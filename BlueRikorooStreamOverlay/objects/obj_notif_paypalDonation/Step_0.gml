#region Hearts Shoot off 

if t1 == "Hearts" and obj_main.notificationEffects == 3{
	if timer == 180{  // 60*3
		var X = camera_get_view_x(view_camera[0]) + gui_xpos
		var Y = camera_get_view_y(view_camera[0]) + gui_ypos
		var angle = 0
		repeat(60){
			var obj = instance_create_layer(X, Y, getLayer(25), obj_followHeart)
			obj.speed = 10
			obj.direction = angle
			angle += 6
		}
	}
}

#endregion
#region Coins

if t1 == "Coins"{
	if timer > 180{  // 60*3
		var X = camera_get_view_x(view_camera[0]) + gui_xpos
		var Y = camera_get_view_y(view_camera[0]) + gui_ypos
		if bitsLeft > 0{
			repeat(ceil(bitsLeft/1000)){
				bitsLeft--
				if obj_main.notificationEffects == 3{
					var obj = instance_create_layer(X, Y, getLayer(25), obj_bit)
					obj.hspeed = random(4)-2
					obj.vspeed = -random(8)-2
				}
			}
		}
		if bitsLeft <= 0{
			bitsLeft--
			if bitsLeft < -120{
				obj_notifHandler.handlingNotif = false
				instance_destroy()	
			}
		}
		timer = 181
	}
}

#endregion
#region Sub Notif

if t5 != undefined and t5 != "None"{
	if timer == 180{  // 60*3
		var X = camera_get_view_x(view_camera[0]) + gui_xpos
		var Y = camera_get_view_y(view_camera[0]) + gui_ypos
		var obj = instance_create_layer(X, Y, getLayer(Layer.player), obj_subStatue)
		if obj_main.notificationEffects == 3{
			obj.hspeed = -random(15) + 5
			obj.vspeed = -random(10)
		}
		obj.username = username
		obj_main.userToSubStatue[? username] = obj.id
		var element = ""
		switch(t5){
		case "Fire": element = Element.fire break
		case "Earth": element = Element.earth break
		case "Metal": element = Element.metal break
		case "Storm": element = Element.storm break
		case "Nature": element = Element.nature break
		case "Water": element = Element.water break
		case "Ice": element = Element.ice break
		case "Light": element = Element.light break
		case "Shadow": element = Element.shadow break
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
}

#endregion



#region Play Rikoroo sound

if timer == 1 and obj_main.notificationEffects == 3{
	audio_play_sfx(snd_notification_rikoroooo)	
}

#endregion
