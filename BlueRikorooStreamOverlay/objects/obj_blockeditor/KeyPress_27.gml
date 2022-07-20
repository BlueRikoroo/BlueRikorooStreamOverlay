if saveState > 0{
	if keyboard_string == ""{
		saveState = 0
	}
}else{
	instance_destroy()	
}
keyboard_string = ""
