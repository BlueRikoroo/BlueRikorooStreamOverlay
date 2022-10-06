if !surface_exists(surface){
	surface = surface_create(1920, 1080)
}

surface_set_target(surface)

draw_transition()

surface_reset_target()

draw_surface(surface, 0, 0)

timer += 1

if done
	instance_destroy()