function mouse_event(event){
	if event == "click"{
		// show = true
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
			var color = getElementColor(subStatue.element)
			part_type_color1(p, color)
			part_particles_create(global.particle_system, subStatue.x, subStatue.y-65, p, 1)
			
			var target = getUserObj(username)
			if target{
				var obj = instance_create_layer(subStatue.x, subStatue.y-60, getLayer(10), obj_subStatue_elementSwitcher)
				obj.target = target
				obj.element = subStatue.element
				obj.color = color
			}
		}
		
		if obj_main.activeGame != noone{
			switch(obj_main.activeGame.object_index){
			case obj_korioro:
				with(obj_main.activeGame){
					var X = other.x - obj_main.activeGamePosX
					var Y = other.y - obj_main.activeGamePosY
					if posInRegion(X,Y,226,0,356,55) and !obj_main.streamOver{
						var playerObj = getUserObj(other.username)
						var cheer = getUserCheerData(other.username)
						if cheer >= 5{
							CreateBitSpawner(playerObj, 
							  [ X + obj_main.activeGamePosX + camera_get_view_x(view_camera), 
							    Y + obj_main.activeGamePosY + camera_get_view_y(view_camera)
							  ], 5)
							addCheerAmount(other.username, -5)
							KorioroAddPiece(irandom(10), other.username)
						}
					}else if posInRegion(X,Y,226,55,356,100) and !obj_main.streamOver{
						var playerObj = getUserObj(other.username)
						if not KorioroCheckInPieceOrder(other.username){
							CreateBitSpawner(playerObj, 
							  [ X + obj_main.activeGamePosX + camera_get_view_x(view_camera), 
							    Y + obj_main.activeGamePosY + camera_get_view_y(view_camera)
							  ], 1)
							KorioroAddPiece(irandom(10), other.username)
						}
					}else if activePiece != noone and activePiece[1] == other.username{
						var Yloc = 142 + location[1]*20 + obj_main.activeGamePosY
						if other.y < Yloc{
							KorioroPieceRotateL(activePiece)	
						}
						if other.y > Yloc{
							KorioroPieceRotateR(activePiece)	
						}
					}	
				}
				break
			}
		}else{
			var centerX = obj_main.activeGameSurfaceWidth * 0.5
			var X = x - obj_main.activeGamePosX
			var Y = y - obj_main.activeGamePosY
			if posInRegion(X,Y,centerX-100,100,centerX+100, 150){
				with(obj_main){
					ActivateGame(Game.Korioro)
				}
			}else if posInRegion(X,Y,centerX-100,175,centerX+100, 225){
				with(obj_main){
					ActivateGame(Game.RikoDoodle)
				}
			}
		}
	}
	else if event == "mousedrag"{
		var subStatue = obj_main.userToSubStatue[? username]
		if subStatue{  // Special Effects for those that subed
			subStatue.x = x + camera_get_view_x(view_camera[0])
			subStatue.y = camera_get_view_y(view_camera[0]) + 987 
			subStatue.speed = 0
			subStatue.on_ground = false
		}
	}
}