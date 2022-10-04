if !handlingNotif{
	if betweenNotifTimer <= 0{
		if ds_list_size(newNotifs) != 0{
			handlingNotif = true
			var obj = newNotifs[| 0]
			ds_list_delete(newNotifs, 0)
			instance_activate_object(obj)
			betweenNotifTimer = betweenNotifMin
			if obj.TTSMessage != "" and obj_main.TTS_url != ""{
				http_post_string(obj_main.TTS_url + "?message=" + obj.TTSMessage, "")	
			}
		}
	}else{
		betweenNotifTimer--	
	}
}