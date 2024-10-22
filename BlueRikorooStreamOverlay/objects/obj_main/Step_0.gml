// show_debug_message("(" + string(mouse_x) + ", " + string(mouse_y) + ")")
global.time++
#region Mode Switching

if keyboard_check(vk_anykey) and mode == "normal"{
	switch(keyboard_string){
	case "blocks":
		mode = "editBlocks" 
		unload_map()
		instance_create_layer(0, 0, layer, obj_blockEditor)
		
		break
	case "test":
		testing = !testing
		keyboard_string = ""
		break
	case "window":
		window_toggle = !window_toggle
		if window_toggle
			window_set_size(camera_width*0.5, camera_height*0.5)
		else
			window_set_size(camera_width, camera_height)
		keyboard_string = ""
		break
	case "player":
		if testing{
			keyboard_string = ""
			var e = [Element.neutral, Element.fire, Element.earth,
			  Element.metal, Element.nature, Element.storm, Element.water,
			  Element.ice, Element.light, Element.shadow, Element.time, Element.ai]
			for (var i = 0; i < array_length(e); i++){
				createPlayer(camera_get_view_x(view_camera[0])+480 + 64*i,camera_get_view_y(view_camera[0])+540,e[i],"BlueRikorooTest")
			}
		}
		break
	case "shoot":
		if testing{
			keyboard_string = ""
			with(obj_player){
				spawnAttack(element, x, y, x, y-100)
			}
		}
		break
	case "patreon":
		if testing{
			keyboard_string = ""
			spawnPatreon("BlueRikoroo", spr_pm_base_rikkor, [spr_pm_aesth_rikkorBoneHelmet, spr_pm_aesth_rikkorBoneStaff], 0)
		}
		break
	case "game":
		if testing{
			mode = "gameSelect"	
			keyboard_string = ""
		}
		break
	case "draw":
		if drawOverlay{
			drawOverlay = false
		}else{
			drawOverlay = true
		}
		keyboard_string = ""
	}
}

#endregion
#region Map Loading

if keyboard_check_pressed(vk_lshift) and !keyboard_check(vk_lcontrol){
	if mode == "normal"{
		keyboard_string = ""
		mode = "mapLoading"
	}else if mode == "mapLoading"{
		try{
			var num = real(keyboard_string)
			keyboard_string = ""
			ini_open("MapBinds.ini")
			currentMap = ini_read_string("MapBinds", string(num), "")
			ini_close()
			unload_map()
			load_map(currentMap)
		}
		catch(error){
			show_debug_message(error)
		}
		mode = "normal"
	}
}
if mode == "mapLoading" and keyboard_check_pressed(vk_backspace){
	mode = "normal"	
}

#endregion
#region Overlay Loading

overlay_step()

if keyboard_check_pressed(vk_rshift){
	if mode == "normal"{
		keyboard_string = ""
		mode = "overlayLoading"
	}else if mode == "overlayLoading"{
		try{
			var num = real(keyboard_string)
			keyboard_string = ""
			currentOverlay = num
			load_overlay(num)			
		}
		catch(error){
			show_debug_message(error)
		}
		mode = "normal"	
	}
	
}
if mode == "overlayLoading" and keyboard_check_pressed(vk_backspace){
	mode = "normal"	
}

#endregion
#region Camera Movement

if cameraMoving{
	var X = camera_get_view_x(view_camera[0])
	var Y = camera_get_view_y(view_camera[0])
	X += (cameraMoveToX-X)*0.1
	Y += (cameraMoveToY-Y)*0.1
	if point_distance(X, Y, cameraMoveToX, cameraMoveToY) < 0.1{
		cameraMoving = false
		X = cameraMoveToX
		Y = cameraMoveToY
	}
	camera_set_view_pos(view_camera[0], X, Y)
}

if mode == "normal" and !keyboard_check_direct(vk_lcontrol){
	if keyboard_check_pressed(vk_numpad1){
		cameraMoving = true
		cameraMoveToX = 1920
		cameraMoveToY = 1080
	}
	if keyboard_check_pressed(vk_numpad2){
		cameraMoving = true
		cameraMoveToX = 1920
		cameraMoveToY = 1032
	}
	if keyboard_check_pressed(vk_numpad3){
		cameraMoving = true
		cameraMoveToX = 0
		cameraMoveToY = 1080
	}
	if keyboard_check_pressed(vk_numpad4){
		cameraMoving = true
		cameraMoveToX = 3840
		cameraMoveToY = 1080
	}
}

#endregion
#region Global Keys

if keyboard_check_direct(vk_lcontrol){
	if keyboard_check_direct(vk_lshift){
		if keyboard_check_direct(ord("1")) or 
		  keyboard_check_direct(ord("2")) or 
		  keyboard_check_direct(ord("4")) or 
		  keyboard_check_direct(ord("5")) or
		  keyboard_check_direct(ord("W"))
		{
			if hotKeyOnlyOne{
				hotKeyOnlyOne = false
				if keyboard_check_direct(ord("5")) or keyboard_check_direct(ord("4")){
					create_transition(TransitionType.SwipeRightQuick)
				}else{
					create_transition(TransitionType.SwipeLeft)
				}
				if sideOverlay{
					sideOverlay = false
					if currentOverlay != previousOverlay{
						load_overlay(previousOverlay)
					}
				}
				streamOver = false
				startingSoon = false
				instance_destroy(par_enemy)
				enemiesDestroyed = 0
				overlayTextWiggle = ""
				lastGlobalOverlay = 1
			}
		}
		else if keyboard_check_direct(ord("3"))
		{
			if hotKeyOnlyOne {
				hotKeyOnlyOne = false
				create_transition(TransitionType.SwipeRightQuick)
				if !sideOverlay{
					sideOverlay = true
					previousOverlay = currentOverlay
				}
				if currentOverlay != -1{
					load_overlay(-1)
				}
				streamOver = false
				startingSoon = false
				instance_destroy(par_enemy)
				enemiesDestroyed = 0
				overlayTextWiggle = ""
				lastGlobalOverlay = 3
			}
		}
		else if keyboard_check_direct(ord("7"))
		{
			if hotKeyOnlyOne{
				hotKeyOnlyOne = false
				create_transition(TransitionType.SwipeRight)
				if !sideOverlay{
					sideOverlay = true
					previousOverlay = currentOverlay
				}
				if currentOverlay != 98{
					load_overlay(98)
				}
				streamOver = false
				startingSoon = true
				instance_destroy(par_enemy)
				enemiesDestroyed = 0
				overlayTextWiggle = "Be Back in a few! :D"
				lastGlobalOverlay = 7
			}
		}
		else if keyboard_check_direct(ord("8"))
		{
			if hotKeyOnlyOne{
				hotKeyOnlyOne = false
				create_transition(TransitionType.SwipeRight)
				if !sideOverlay{
					sideOverlay = true
					previousOverlay = currentOverlay
				}
				if currentOverlay != 98{
					load_overlay(98)
				}
				streamOver = false
				startingSoon = true
				overlayTextWiggle = "Starting Soon!"
				lastGlobalOverlay = 8
			}
		}
		else if keyboard_check_direct(ord("9"))
		{
			if hotKeyOnlyOne{
				hotKeyOnlyOne = false
				create_transition(TransitionType.SwipeRight)
				if !sideOverlay{
					sideOverlay = true
					previousOverlay = currentOverlay
				}
				if currentOverlay != 99{
					load_overlay(99)
				}
				streamOver = true
				startingSoon = false
				instance_destroy(par_enemy)
				enemiesDestroyed = 0
				overlayTextWiggle = "Stream Over! See Y'all Later!"
				lastGlobalOverlay = 9
			}
		}else if keyboard_check_direct(ord("Q")){
			if hotKeyOnlyOne{
				hotKeyOnlyOne = false
				create_transition(TransitionType.SwipeLeftQuick)
				load_overlay(11)
				streamOver = false
				startingSoon = false
				cameraMoving = true
				cameraMoveToX = 1920
				cameraMoveToY = 1032
				overlayTextWiggle = ""
			}
		}else if keyboard_check_direct(ord("C")){
			if hotKeyOnlyOne{
				hotKeyOnlyOne = false
				toggleCursors = !toggleCursors
				with(obj_mouse){
					show = other.toggleCursors	
				}
			}
		}else if keyboard_check_direct(ord("T")){
			if hotKeyOnlyOne{
				hotKeyOnlyOne = false
				show_nametags = !show_nametags
			}
		}else if keyboard_check_direct(ord("N")){
			if keyboard_check_direct(ord("H")){
				if hotKeyOnlyOne{
					hotKeyOnlyOne = false
					notificationEffects = 0
					create_chat_message("Overlay", "Notifications - 0", Element.neutral)
				}	
			}else if keyboard_check_direct(ord("J")){
				if hotKeyOnlyOne{
					hotKeyOnlyOne = false
					notificationEffects = 1 
					create_chat_message("Overlay", "Notifications - 1", Element.neutral)
				}	
			}else if keyboard_check_direct(ord("K")){
				if hotKeyOnlyOne{
					hotKeyOnlyOne = false
					notificationEffects = 2 
					create_chat_message("Overlay", "Notifications - 2", Element.neutral)
				}	
			}else if keyboard_check_direct(ord("L")){
				if hotKeyOnlyOne{
					hotKeyOnlyOne = false
					notificationEffects = 3 
					create_chat_message("Overlay", "Notifications - 3", Element.neutral)
				}	
			}
		}else if keyboard_check_direct(ord("P")){
			if hotKeyOnlyOne{
				hotKeyOnlyOne = false
				pushUpNum = 0
				pushUpPos = 1930	
			}
		}else{
			hotKeyOnlyOne = true
		}
	}

	if keyboard_check_direct(vk_numpad0){
		jukeHotkeyAdd("0")	
	}
	else if keyboard_check_direct(vk_numpad1){
		jukeHotkeyAdd("1")	
	}
	else if keyboard_check_direct(vk_numpad2){
		jukeHotkeyAdd("2")	
	}
	else if keyboard_check_direct(vk_numpad3){
		jukeHotkeyAdd("3")	
	}
	else if keyboard_check_direct(vk_numpad4){
		jukeHotkeyAdd("4")	
	}
	else if keyboard_check_direct(vk_numpad5){
		jukeHotkeyAdd("5")	
	}
	else if keyboard_check_direct(vk_numpad6){
		jukeHotkeyAdd("6")	
	}
	else if keyboard_check_direct(vk_numpad7){
		jukeHotkeyAdd("7")	
	}
	else if keyboard_check_direct(vk_numpad8){
		jukeHotkeyAdd("8")	
	}
	else if keyboard_check_direct(vk_numpad9){
		jukeHotkeyAdd("9")	
	}
	else if keyboard_check_direct(vk_multiply){
		
		if keyboard_check_direct(vk_add)
		{
			if jukeKeyOnlyOne{
				jukeKeyOnlyOne = false	
				hotKeyJukeKey = ""
				if jukeVolume < 1{
					jukeVolume += 0.05	
					audio_sound_gain(jukeCurrent,jukeVolume,100)
				}
			}			
		}	
		else if keyboard_check_direct(vk_subtract)
		{
			if jukeKeyOnlyOne{
				jukeKeyOnlyOne = false	
				hotKeyJukeKey = ""
				if jukeVolume > 0{
					jukeVolume -= 0.05	
					audio_sound_gain(jukeCurrent,jukeVolume,100)
				}
			}	
		}
	
	}
	else if keyboard_check_direct(vk_add){
		if jukeKeyOnlyOne{
			jukeKeyOnlyOne = false	
			if hotKeyJukeKey == "1"
				jukeSwitch(bgm_song2bcutupinloops)
			else if hotKeyJukeKey == "10"
				jukeSwitch(bgm_forest, 0.25)
			else if hotKeyJukeKey == "11"
				jukeSwitch(bgm_industrial)
			else if hotKeyJukeKey == "12"
				jukeSwitch(bgm_industrialDay)
			else if hotKeyJukeKey == "13"
				jukeSwitch(bgm_jazz_kit)
			else if hotKeyJukeKey == "14"
				jukeSwitch(bgm_melanchonyAndAmbiance)
			else if hotKeyJukeKey == "15"
				jukeSwitch(bgm_PVPUndergroundSuugestion)
			else if hotKeyJukeKey == "10"
				jukeSwitch(bgm_forest)
				
			else if hotKeyJukeKey == "2"
				jukeSwitch(bgm_coastal)
			else if hotKeyJukeKey == "21"
				jukeSwitch(bgm_natureWalk)
			else if hotKeyJukeKey == "22"
				jukeSwitch(bgm_plains)
			else if hotKeyJukeKey == "23"
				jukeSwitch(bgm_regolith)
			else if hotKeyJukeKey == "24"
				jukeSwitch(bgm_sunsetRide)
			else if hotKeyJukeKey == "25"
				jukeSwitch(bgm_wayOfPebbles)
			else if hotKeyJukeKey = "250"
				jukeSwitch(bgm_theIceCaves)
			else if hotKeyJukeKey = "251"
				jukeSwitch(bgm_stoneForest)
			else if hotKeyJukeKey = "252"
				jukeSwitch(bgm_snowyRidge)
			else if hotKeyJukeKey = "253"
				jukeSwitch(bgm_runeStones)
			else if hotKeyJukeKey = "254"
				jukeSwitch(bgm_storiesOnTheWall)
			else if hotKeyJukeKey = "255"
				jukeSwitch(bgm_legendOfTheStone)
			else if hotKeyJukeKey = "256"
				jukeSwitch(bgm_theBookOfRocks)
				
			else if hotKeyJukeKey == "3"
				jukeSwitch(bgm_natureWalkCaves)
			else if hotKeyJukeKey == "30"
				jukeSwitch(bgm_graveyard)
			else if hotKeyJukeKey == "31"
				jukeSwitch(bgm_mapEditorPercussive)
				
			else if hotKeyJukeKey == "40"
				jukeSwitch(bgm_encounterOfALifetime)
			
				
			else if hotKeyJukeKey == "50"
				jukeSwitch(bgm_dearRival)
				
			else if hotKeyJukeKey == "6"
				jukeSwitch(bgm_orchestra)
			else if hotKeyJukeKey == "60"
				jukeSwitch(bgm_diddle)
			else if hotKeyJukeKey == "61"
				jukeSwitch(bgm_fallingDepression)
			else if hotKeyJukeKey == "62"
				jukeSwitch(bgm_shadowNightSecond)
				
			else if hotKeyJukeKey == "7"
				jukeSwitch(bgm_amaranthMinigameElevator)
			else if hotKeyJukeKey == "70"
				jukeSwitch(bgm_diddleShadowRegion)
				
			else if hotKeyJukeKey == "8"
				jukeSwitch(bgm_makingAChoice)
			else if hotKeyJukeKey == "80"
				jukeSwitch(bgm_pad)
				
			else
				jukeSwitch(noone)
			hotKeyJukeKey = ""
		}
	}
	else if keyboard_check_direct(vk_subtract){
		if jukeKeyOnlyOne{
			jukeKeyOnlyOne = false
			if hotKeyJukeKey == "2"
				jukePlaylistSet([bgm_coastal, bgm_natureWalk,
					bgm_plains, bgm_regolith, bgm_sunsetRide, bgm_wayOfPebbles, 
					bgm_stoneForest])
			else if hotKeyJukeKey == "3"
				jukePlaylistSet([bgm_graveyard, bgm_mapEditorPercussive,
				  bgm_sunsetRide])
			else if hotKeyJukeKey == "4"
				jukePlaylistSet([bgm_encounterOfALifetime])
			else if hotKeyJukeKey == "5"
				jukePlaylistSet([bgm_dearRival])
			else if hotKeyJukeKey == "6"
				jukePlaylistSet([bgm_diddle, bgm_fallingDepression, bgm_orchestra,
				 bgm_shadowNightSecond])
			else if hotKeyJukeKey == "7"
				jukePlaylistSet([bgm_amaranthMinigameElevator, bgm_diddleShadowRegion])
			else if hotKeyJukeKey == "8"
				jukePlaylistSet([bgm_makingAChoice, bgm_pad])
			else if hotKeyJukeKey == "9"
				jukePlaylistSet([bgm_balearicPumping, bgm_beatSaber, bgm_commercialPumping, bgm_countryRounds,
				  bgm_escape, bgm_legend])
			else{
				jukePlaylist = 0
				jukeSwitch(noone)
			}
			hotKeyJukeKey = ""
		}
	}
	else{
		jukeKeyOnlyOne = true	
	}
}

#endregion
#region Mouse

if keyboard_string == "mouse"{
	var mouseObj = getUserMouse("Bluerikoroo")
	mouseObj.x = device_mouse_x_to_gui(0)
	mouseObj.y = device_mouse_y_to_gui(0)
	with(mouseObj){
		if currentEvent != "mousedrag"{
			mouse_event("mousemove")
		}
	}
}

#endregion
#region Game

if mode == "gameSelect"{
	if keyboard_check_pressed(vk_backspace){
		mode = "normal"	
		keyboard_string = ""
	}else if keyboard_check_pressed(vk_enter){
		mode = "normal"
		try{
			ActivateGame(real(keyboard_string))
		}catch(e){
			show_debug_message(e)
		}
		keyboard_string = ""
	}
}

#endregion
#region Transition

if activeGameSwap != -1 and activeGameTransition > 0{
	activeGameTransition -= activeGameSwapSpeed
	if activeGameTransition <= 0{
		activeGameTransition = 0
		instance_destroy(par_game)
		activeGame = noone
		if activeGameSwap != -1{
			ActivateGame(activeGameSwap)
		}
		activeGameSwap = -1
	}
}
if activeGameSwap == -1 and activeGame != noone and activeGameTransition < 1{
	activeGameTransition += activeGameSwapSpeed
	if activeGameTransition >= 1{
		activeGameTransition = 1	
	}
}

#endregion
#region Jukebox 

if jukePlaylist and !audio_is_playing(jukeCurrent){
	jukePlaylistSwitch()
}

#endregion
#region Starting Soon

if startingSoon{
	if enemiesDestroyed > 0{
		if lastGlobalOverlay = 8{
			overlayTextWiggle = "Starting Soon!     Enemies Destroyed: " + string(enemiesDestroyed) 
		}else if lastGlobalOverlay = 5{
			overlayTextWiggle = "Be Back in a few! :D     Enemies Destroyed: " + string(enemiesDestroyed) 
		}else{
			overlayTextWiggle = "Enemies Destroyed: " + string(enemiesDestroyed) 
		}
	}
	if !instance_exists(obj_enemy_boss1){
		if (irandom(125) == 0 or instance_number(obj_enemy_SS) == 0) and instance_number(obj_enemy_SS) <= instance_number(obj_player)
			instance_create_layer(choose(920, 4840), 1180, getLayer(Layer.enemy), obj_enemy_SS)
		if irandom(625) == 0 and instance_number(obj_enemy_duelShoot) <= instance_number(obj_player)/8 and enemiesDestroyed > 5
			instance_create_layer(2140 + random(1500), 700, getLayer(Layer.enemy), obj_enemy_duelShoot)
		if irandom(1250) == 0 and instance_number(obj_enemy_rapidShoot) <= instance_number(obj_player)/16 and enemiesDestroyed > 20
			instance_create_layer(2140 + random(1500), 700, getLayer(Layer.enemy), obj_enemy_rapidShoot)
		if enemiesDestroyed > nextBoss
			instance_create_layer(1920+1920*0.5, 500, getLayer(Layer.enemy), obj_enemy_boss1)
	}else{
		if irandom(125) == 0 and instance_number(obj_enemy_SS) <= instance_number(obj_player){
			var pos = 10 + random(400)
			var obj = instance_create_layer(920, 1180, getLayer(Layer.enemy), obj_enemy_SS)
			obj.gotoPos = 1920+pos
			var obj = instance_create_layer(4840, 1180, getLayer(Layer.enemy), obj_enemy_SS)
			obj.gotoPos = 3840-pos
		}
	}
}

#endregion