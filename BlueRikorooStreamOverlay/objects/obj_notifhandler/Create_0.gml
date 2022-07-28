/// @description Keeps new notifications in order and properly timed
newNotifs = ds_list_create()
handlingNotif = false
betweenNotifMin = 60*4
betweenNotifTimer = betweenNotifMin