#region Gravity

if !on_ground{
	vspeed += grav
}

#endregion
performOptomizedCol()
#region Stop On Ground

if on_ground{
	hspeed = 0	
}

#endregion