gotoPos = 2880+950*sin((global.time+frameOffset) * 0.002)


x += (gotoPos - x) * 0.01
y += (1220 - y) * 0.01

if !charging and irandom(500) == 0{
	charging = true
}
if charging{
	chargingTimer++
	if chargingTimer < 145{
		spawn_charge_particle(x+(x-xprevious)*12, y,75,15,c_orange)
	}
	if chargingTimer > 145 and chargingTimer % 30 == 0{
		spawn_ea_standard(x, y+10, 2, 270)
	}
	if chargingTimer > 355{
		charging = false
		chargingTimer = 0	
	}
}

