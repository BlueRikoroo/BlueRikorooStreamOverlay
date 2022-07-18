/// @description Keeps new notifications in order and properly timed
newNotifs = ds_list_create()
handlingNotif = false
betweenNotifMax = 60*4
betweenNotifTimer = betweenNotifMax