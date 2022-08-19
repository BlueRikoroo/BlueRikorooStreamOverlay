function getUserCheerData(username){
	if is_undefined(obj_main.userToCheer[? username]){
		ini_open("Viewers/" + username + ".ini")
		var cheer = ini_read_real("Data", "cheer", 0)
		ini_close()
		obj_main.userToCheer[? username] = cheer
	}
	return obj_main.userToCheer[? username]
}

function saveUserCheerData(username){
	if !is_undefined(obj_main.userToCheer[? username]){
		ini_open("Viewers/" + username + ".ini")
		ini_write_real("Data", "cheer", obj_main.userToCheer[? username])
		ini_close()
	}
}

function addCheerAmount(username, amount){
	var cheer = getUserCheerData(username)
	if cheer + amount >= 0{
		obj_main.userToCheer[? username] += amount
		saveUserCheerData(username)
		var player = obj_main.userToObj[? username]
		if !is_undefined(player){
			player.cheerAmount = obj_main.userToCheer[? username]	
		}
	}
	return false
}