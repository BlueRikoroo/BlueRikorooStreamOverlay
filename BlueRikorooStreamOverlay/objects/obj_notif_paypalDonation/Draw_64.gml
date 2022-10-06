timer++
if timer < 60*6{
	if obj_main.notificationEffects >= 2{
		subImg += 0.5
		draw_sprite_ext(spr_rikorooBounce, subImg, gui_xpos, gui_ypos, 0.25, 0.25, 0, -1, 1)

		draw_text_setup(fnt_notification, fa_center, fa_middle)
		draw_text_outline(gui_xpos, gui_ypos+100, msgDisplay, 4, c_black, c_white)
	}else if obj_main.notificationEffects == 1{
		draw_text_setup(fnt_notification, fa_right, fa_top)
		draw_text_outline(1880, 40, msgDisplay, 2, c_black, c_white)
	}
}else{
	obj_notifHandler.handlingNotif = false
	instance_destroy()
}	