if instance_exists(target){
	speed = 4
	direction = point_direction(x, y, target.x, target.y)
	if collision_point(x, y, target, false, false){
		instance_destroy()
		with(collision_point(x, y, target, false, false)){
			setPlayerAnimations(other.element)
			obj_main.userToElement[? username] = other.element
		}
	}
}else{
	instance_destroy()
}