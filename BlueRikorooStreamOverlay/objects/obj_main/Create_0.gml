ini_open("Config/config.ini")

webhook_url = ini_read_string("Website", "url", "")
currentMap = ini_read_string("Carryover", "lastMap", "")

ini_close()

// Start recieving data if a website it inputted
if webhook_url != ""
	alarm[0] = 10
	
#region Variables used to process data

notifCount = -1  // Keeps track of which notification ID we are on so as not to repeat notifications
global.layerMap = ds_map_create()
switch(date_get_month(date_current_datetime())){
case 1: case 2: case 12:
	global.season = 2 break
case 3: case 4: case 5:
	global.season = 3 break
case 6: case 7: case 8:
    global.season = 0 break
case 9: case 10: case 11:
    global.season = 1 break
}
global.tileMap = ds_map_create()
mode = "normal"
if currentMap != ""{
	load_map(currentMap)
}
cameraMoving = false
cameraMoveToX = 1920
cameraMoveToY = 1080
testing = false
show_nametags = true
userList = ds_list_create()  // Add and remove player objects from this list

#endregion

enum Element{
	neutral,
	fire,
	metal,
	earth,
	storm,
	nature,
	water,
	ice,
	light,
	shadow,
	ai,
	time
}