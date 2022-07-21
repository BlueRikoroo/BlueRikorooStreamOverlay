var url = ds_map_find_value(async_load, "url")

if url == webhook_url{
	var result = ds_map_find_value(async_load, "url")
	var json = json_decode(result)
	
	#region Obtain viewers (MvT specific Mode)
	
	//var viewers = json[? "Viewers"]
	//for (var k = ds_map_find_first(viewers); !is_undefined(k); k = ds_map_find_next(viewers, k)){
		//var viewer = viewers[? k]
		//var timer = viewer[? "timer"]
		// var gifts = viewer[? "gifts"]
		// var patreon = viewer[? "patreon"]
		// var rewards = viewer[? "rewards"]
		// var PPS = viewer[? "PPS"]
		// var MAX = viewer[? "MAX"]
	
		/*
		if ds_list_find_index(twitchViewerName, k) == -1{
			ds_list_add(twitchViewerName, k)
			var obj = instance_create_layer(0, 1000, getLayerDepth(0), obj_twitchViewer)
			ds_list_add(twitchViewerObj, obj)
		}
		ds_list_add(currentViewerNames, k)
	
		var i = ds_list_find_index(twitchViewerName, k)
		var obj = ds_list_find_value(twitchViewerObj, i)
		obj.twitchName = k
		obj.timer = timer
		*/
	//}
	
	/*
	var twitchViewerSorted = ds_list_create()
	ds_list_copy(twitchViewerSorted, twitchViewerObj)
	var l = ds_list_size(twitchViewerSorted)-1
	for (var i = 0; i < l; i++){
		for (var j = i; j < l; j++){
			if twitchViewerSorted[|j].timer < twitchViewerSorted[|j+1].timer{
				var t = twitchViewerSorted[|j]
				twitchViewerSorted[|j] = twitchViewerSorted[|j+1]
				twitchViewerSorted[|j+1] = t
			}
		}
	}
	for (var i = 0; i < l+1; i++){
		twitchViewerSorted[|i].gotoYPos = i*50
	}
	ds_list_destroy(twitchViewerSorted)

	with(obj_twitchViewer){
		if ds_list_find_index(currentViewerNames, twitchName) == -1{
			instance_destroy()
		}
	}	
	ds_list_destroy(currentViewerNames)
	*/
	
	#endregion
	#region Update Commands (MvT Specifc)
	
	/*
	var commands = ds_map_find_value(json, "NewCommands")
	l = ds_list_size(commands)
	var currentCommandIDs = ds_list_create()
	for (var i = 0; i < l; i++){
		var command = commands[|i]
		var idValueRec = command[|0]
		var commandStr = command[|1]
		var senderName = command[|2]
		var commandType = command[|3]
	
		ds_list_add(currentCommandIDs, idValueRec)
	
		if ds_list_find_index(commandViewerID, idValueRec) == -1{
			ds_list_add(commandViewerID, idValueRec)
			var obj = instance_create_layer(100, 0, getLayerDepth(-1), obj_commandViewer)
			obj.idValue = idValueRec
			obj.commandText = string_copy(commandStr,0, 20)
			obj.senderName = senderName
			switch(commandType){
			case "summon": case "spawn": case "entity": case "ent": obj.commandPlate = spr_commandBackgroundSummon break
			case "donation": obj.commandPlate = spr_commandBackgroundDonation break
			case "drop": obj.commandPlate = spr_commandBackgroundDrop break
			case "effect": case "potion": obj.commandPlate = spr_commandBackgroundEffect break
			case "gift": obj.commandPlate = spr_commandBackgroundGift break
			case "give": case "item": obj.commandPlate = spr_commandBackgroundGive break
			case "set": case "place": obj.commandPlate = spr_commandBackgroundSet break
			case "teleport": case "tp": case "portal": obj.commandPlate = spr_commandBackgroundTeleport break
			case "time": case "clock": case "time_of_day":
			case "weather":
			case "playsound": case "sound":
			case "points": case "point": case "amount":
			case "prize": case "winnings": case "winningamount":
			case "stats": case "info":
			case "redeem":
				obj.commandPlate = spr_commandBackgroundDefault break
			default:
				obj.commandPlate = spr_commandBackgroundUnknown break
			}
			var index = ds_list_find_index(twitchViewerName, senderName)
			if index != -1{
				obj.y = twitchViewerObj[|index].y
			}
			ds_list_add(commandViewerObj, obj)
		}
	}


	with(obj_commandViewer){
		if ds_list_find_index(currentCommandIDs, idValue) == -1{
			instance_destroy()
		}
	}		

	UpdateCommandOrder()
	    /*
		function UpdateCommandOrder(){
			with(obj_controller){
				var l = ds_list_size(commandViewerObj)
				for (var i = 0; i < l; i++){
					commandViewerObj[|i].gotoYPos = 560 - i*40
				}
			}
		}
		/
	ds_list_clear(currentCommandIDs)
	*/
	var notifications = json[? "Notifications"]
	if !is_undefined(notifications){
		var l = ds_list_size(notifications)
		for (var i = 0; i < l; i++){
			var notif = notifications[|i]
			var notifID = notif[|0]
			if notifCount < notifID{
				notifCount = notifID
				var notifType = notif[|1]
				switch(notifType){
				case "raid":
					var obj = instance_create_layer(0, 0, getLayer(-1000), obj_notif_raid)
					obj.username = notif[|2]
					obj.raidAmount = notif[|3]
					ds_list_add(obj_notifHandler.newNotifs, obj)
					instance_deactivate_object(obj)
					break
				}
			}
		}
	}
}