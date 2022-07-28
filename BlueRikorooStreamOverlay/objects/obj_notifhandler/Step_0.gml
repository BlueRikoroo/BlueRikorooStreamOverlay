if !handlingNotif{
	if betweenNotifTimer <= 0{
		if ds_list_size(newNotifs) != 0{
			handlingNotif = true
			var obj = newNotifs[| 0]
			ds_list_delete(newNotifs, 0)
			instance_activate_object(obj)
			betweenNotifTimer = betweenNotifMin
		}
	}else{
		betweenNotifTimer--	
	}
}