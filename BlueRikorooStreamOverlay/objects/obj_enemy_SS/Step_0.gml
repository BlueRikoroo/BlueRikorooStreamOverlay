x += (gotoPos - x) * 0.01

if !charging and irandom(300) == 0{
	charging = true
}
if charging{
	chargingTimer++
	spawn_charge_particle(x+(x-xprevious)*12, y,,15)
	if chargingTimer > 120{
		charging = false
		chargingTimer = 0
		spawn_ea_standard(x, y, 2, 270)
	}
}