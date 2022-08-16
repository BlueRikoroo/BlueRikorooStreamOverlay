#region Shoot off 

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

#endregion

#region Play Rikoroo sound

if timer == 1{
	audio_play_sfx(snd_notification_rikoroooo)	
}

#endregion