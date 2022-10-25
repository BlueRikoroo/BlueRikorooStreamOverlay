gotoPos = centerPos + 250 * sin((global.time+frameOffset) * 0.005)


x += (gotoPos - x) * 0.01
y += (1440 - y) * 0.01

if !charging and irandom(500) == 0{
	charging = true
}
if charging{
	chargingTimer++
	spawn_charge_particle(x+(x-xprevious)*24, y,200,30,c_blue)
	if chargingTimer > 300{
		charging = false
		chargingTimer = 0
		spawn_ea_laser(x, y, id, 270, 40, 300)
	}
}

if HP < HP_max and global.time mod 60 == 0{
	HP++
}
