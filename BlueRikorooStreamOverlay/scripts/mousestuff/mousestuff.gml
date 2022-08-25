function mouse_event(event){
	if event == "click"{
		show = true
		image_index = 1
		timer = 60
		var subStatue = obj_main.userToSubStatue[? username]
		if subStatue{  // Special Effects for those that subed
			switch(subStatue.element){
			case Element.fire:
			case Element.earth:
			case Element.metal:
			case Element.storm:
			case Element.nature:
			case Element.water:
			case Element.ice:
			case Element.light:
			case Element.shadow:
				break
			}
		}
		
		var X = x + camera_get_view_x(view_camera[0])
		var Y = y + camera_get_view_y(view_camera[0])
		subStatue = collision_point(X, Y, obj_subStatue, false, false)
		if subStatue{
			var p = obj_main.particle_subClick
			var color = c_white
			switch(subStatue.element){
			case Element.fire: color = merge_color(c_red, c_white, 0.25) break
			case Element.earth: color = merge_color(c_orange, c_white, 0.25) break
			case Element.metal: color = c_ltgray break
			case Element.storm: color = c_yellow break
			case Element.nature: color = c_lime break
			case Element.water: color = c_aqua break
			case Element.ice: color = merge_color(c_aqua, c_white, 0.25) break
			case Element.light: color = merge_color(c_white, c_yellow, 0.25) break
			case Element.shadow: color = merge_color(c_purple, c_white, 0.25) break
			}
			part_type_color1(p, color)
			part_particles_create(global.particle_system, subStatue.x, subStatue.y-65, p, 1)
			
			var target = obj_main.userToObj[? username]
			if target{
				var obj = instance_create_layer(subStatue.x, subStatue.y-60, getLayer(10), obj_subStatue_elementSwitcher)
				obj.target = target
				obj.element = subStatue.element
				obj.color = color
			}
		}
	}
	else if event == "mousedrag"{
		var subStatue = obj_main.userToSubStatue[? username]
		if subStatue{  // Special Effects for those that subed
			subStatue.x = x
			subStatue.y = camera_get_view_x(view_camera[0]) + 987 
			subStatue.speed = 0
		}
	}
}