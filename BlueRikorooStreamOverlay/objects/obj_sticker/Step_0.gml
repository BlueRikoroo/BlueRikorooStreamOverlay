timer++
if timer < timeOut{
	if y > 1080{
		y -= moveSpeed
	}
}else{
	y += moveSpeed
	if y > 1500{
		instance_destroy()
	}
}