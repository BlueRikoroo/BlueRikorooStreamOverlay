with(obj_player){
	if collision_line(other.x, other.y, 
	  other.x+lengthdir_x(5000, other.dir),
	  other.y+lengthdir_y(5000, other.dir), id, true, false)
	or 
	  collision_line(other.x+other.Width, other.y, 
	  other.x+lengthdir_x(5000, other.dir)+other.Width,
	  other.y+lengthdir_y(5000, other.dir), id, true, false)
	or
	  collision_line(other.x-other.Width, other.y, 
	  other.x+lengthdir_x(5000, other.dir)-other.Width,
	  other.y+lengthdir_y(5000, other.dir), id, true, false)
	{
		if !damaged{
			damaged = true	
		}
	}
}