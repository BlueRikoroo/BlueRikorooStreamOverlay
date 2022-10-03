#region Mouse

if keyboard_string == "mouse"{
	var mouseObj = getUserMouse("Bluerikoroo")
	mouseObj.x = device_mouse_x_to_gui(0)
	mouseObj.y = device_mouse_y_to_gui(0)
	with(mouseObj){
		mouse_event("click")
	}
}

#endregion