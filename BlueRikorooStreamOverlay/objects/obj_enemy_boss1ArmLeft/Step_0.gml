if irandom(60) == 0{
	spawn_ea_standard(x-362, y+140, 2, 250+random(40))
}

if HP < HP_max and global.time mod 180 == 0{
	HP++
}