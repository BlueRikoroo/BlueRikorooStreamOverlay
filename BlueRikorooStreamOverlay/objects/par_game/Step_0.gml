if !instance_exists(obj_gamePopup) {
	if ds_list_size(popups) > 0{
		instance_activate_object(popups[| 0])
		ds_list_delete(popups, 0)
	}
}
gameCloseTimer--
if gameCloseTimer <= 0{
	with(obj_main)
		ActivateGame(1000)
}