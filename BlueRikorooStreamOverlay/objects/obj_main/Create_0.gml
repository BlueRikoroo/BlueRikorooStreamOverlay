randomize()


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
layer = getLayer(Layer.UI)
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
window_toggle = false
if currentMap != ""{
	load_map(currentMap)
}
cameraMoving = false
cameraMoveToX = 1920
cameraMoveToY = 1080
testing = false
show_nametags = true
userToObj = ds_map_create()  // Add and remove player objects from this list
userToElement = ds_map_create()
userToSubBlocks = ds_map_create()

camera_width = 1920
camera_height = 1080
var width = camera_width
var height = camera_height
window_set_size(width, height)
display_set_gui_size(width, height)
chat_surface_height = ceil(height/3)
chat_surface_width = ceil(width/3)
chat_surface = noone
chat_surface_x = 0
chat_surface_y = height-chat_surface_height-55

overlay_timer = 0
overlay_step = empty_script
overlay_draw = overlay_draw_empty_script
overlay_surface = noone

#endregion
#region Enums

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

#endregion
#region Particle Effects

global.particle_system = part_system_create()
#region Raid Bullet Particle

particle_portalRocket = part_type_create()
var p = particle_portalRocket
part_type_shape(p,10)
part_type_scale(p,0.5,0.5)
part_type_size(p,0.5,2,0,0.90)
part_type_life(p,60,60)
part_type_direction(p,0,360,0,0)
part_type_speed(p, 0, 2, 0, 0)
part_type_color2(p,10224966,134674)
part_type_alpha2(p,1,0)
particle_raidPortal = part_type_create()
var p = particle_raidPortal
part_type_shape(p,10)
part_type_scale(p,0.5,0.5)
part_type_size(p,0.5,2,0,0.90)
part_type_life(p,60,60)
part_type_direction(p,0,360,0,0)
part_type_speed(p, 0, 2, 0, 0)
part_type_color2(p,10224966,134674)
part_type_alpha2(p,1,0)

#endregion

#endregion