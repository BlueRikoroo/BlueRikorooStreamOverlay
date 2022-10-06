timer++
if timer < 60*6{
	if tier == 1
		var S = username + " subscribed!\nDrag mouse to position your statue"
	else
		var S = username + " subscribed with tier " + string(tier) + "!\nClick to drop your statue"
		
	if obj_main.notificationEffects >= 2{
		subImg += 0.5
		draw_sprite_ext(spr_rikorooBounce, subImg, gui_xpos, gui_ypos, 0.25, 0.25, 0, -1, 1)

		draw_text_setup(fnt_notification, fa_center, fa_middle)
		draw_text_outline(gui_xpos, gui_ypos+100, S, 4, c_black, c_white)
	}else if obj_main.notificationEffects == 1{
		draw_text_setup(fnt_notification, fa_right, fa_top)
		draw_text_outline(1880, 40, S, 2, c_black, c_white)
	}
}else{
	obj_notifHandler.handlingNotif = false
	instance_destroy()
}