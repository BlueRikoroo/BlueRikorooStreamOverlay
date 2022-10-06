#region Shoot off 

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
}

#endregion

#region Play Rikoroo sound

if timer == 1 and obj_main.notificationEffects == 3{
	audio_play_sfx(snd_notification_rikoroooo)	
}

#endregion