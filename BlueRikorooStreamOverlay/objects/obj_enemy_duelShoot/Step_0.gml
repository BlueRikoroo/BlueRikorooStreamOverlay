gotoPos = centerPos + 150 * sin((global.time+frameOffset) * 0.01)


x += (gotoPos - x) * 0.01
y += (1240 - y) * 0.01

if !charging and irandom(250) == 0{
	charging = true
}
if charging{
	chargingTimer++
	spawn_charge_particle(x+(x-xprevious)*12, y,,15)
	if chargingTimer > 120{
		charging = false
		chargingTimer = 0
		spawn_ea_standard(x-30, y+10, 2, 270)
		spawn_ea_standard(x+30, y+10, 2, 270)
	}
}

