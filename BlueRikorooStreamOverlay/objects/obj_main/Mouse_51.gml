#region Mouse

if keyboard_string == "mousemove"{
	var mouseObj = getUserMouse("BlueRikoroo")
	mouseObj.x = device_mouse_x_to_gui(0)
	mouseObj.y = device_mouse_y_to_gui(0)
	with(mouseObj){
		mouse_event("mousedrag")
	}
}

#endregion