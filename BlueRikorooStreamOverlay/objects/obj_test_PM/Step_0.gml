timer++
if timer > 116{
	spawnPatreon("", base, asthetics, 0)
	timer = 0
}

if mouse_check_button_pressed(mb_right){
	if first
		show_message("Select a base. Needs to be 8 frame, 2Kx2K pixels")
	var baseFile = get_open_filename("PNG Base|*.png", "")
	base = sprite_add(baseFile, 8, 0, 0, 1017, 1458)
	var itemTotal = 0
	var itemFile = []
	asthetics = []
	if first
		show_message("Select an asthetic. Needs to be 8 frame, 2Kx2K pixels, leave blank to end")
	while true{
		itemFile[itemTotal] = get_open_filename("PNG Apparel (Optional)|*.png", "")
		if itemFile[itemTotal] == ""{
			break	
		}
	
		asthetics[itemTotal] = sprite_add(itemFile[itemTotal], 8, 0, 0, 1017, 1458)
		itemTotal += 1
	}
	first = false
}