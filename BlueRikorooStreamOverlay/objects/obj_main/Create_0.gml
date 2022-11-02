randomize()
ini_open("Config/config.ini")
webhook_url = ini_read_string("Website", "url", "")
confirmationWebhook_url = ini_read_string("Website", "confirmation_url", "")
TTS_url = ini_read_string("Website", "TTS_url", "")
currentMap = ini_read_string("Carryover", "lastMap", "")
currentOverlay = ini_read_real("Carryover", "lastOverlay", 0)
ini_close()

// Start recieving data if a website it inputted
if webhook_url != ""
	alarm[0] = 10
if confirmationWebhook_url != ""
	alarm[1] = 120
	
#region Variables used to process data

global.time = 0
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
userToSubStatue = ds_map_create()
userToCheer = ds_map_create()
userToMouse = ds_map_create()
userToCharModifiers = ds_map_create()

camera_width = 1920
camera_height = 1080
var width = camera_width
var height = camera_height
window_set_size(width, height)
display_set_gui_size(width, height)
chat_surface_height = ceil(height/3)
chat_surface_width = ceil(width/3)
chat_surface = noone
chat_surface_x = 30
chat_surface_y = 30 //height-chat_surface_height-55

allowGame = true
activeGame = noone  // Object that is controlling the active game space
activeGameTransition = 0
activeGameSwapSpeed = 0.02
activeGamePosX = 0
activeGamePosY = 0
activeGameSwap = -1 // What to swap game to (Alarm 0)
activeGameSurface = noone
activeGameSurfaceWidth = 356
activeGameSurfaceHeight = 642

transitionHoldOverlay = false
transitionOverlay = noone

overlay_timer = 0
overlay_step = empty_script
overlay_draw = overlay_draw_empty_script
overlay_surface = noone
sideOverlay = false  // If on a side overlay
load_overlay(currentOverlay)
previousOverlay = currentOverlay

hotKeyJukeKey = ""
jukeCurrent = noone
jukePlaylist = false
jukePlaylistArr = []
hotKeyOnlyOne = true
jukeKeyOnlyOne = true
toggleCursors = false
notificationEffects = 3  // 0 None, 1 Just Message top right, 2 More centered message, 3 All effects
jukeVolume = 0.25
jukeCredit = ""
jukePos = 2920

streamOver = false
currentKing = ""
startingSoon = false
lastGlobalOverlay = 0


drawOverlay = false
drawOverlaySurface = noone
drawOverlayColor = c_white
drawOverlayPrevX = 0
drawOverlayPrevY = 0

overlayTextWiggle = ""

enemiesDestroyed = 0
nextBoss = 80

pushUpNum = 0
pushUpPos = 1930

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

scr_createParticles()

// testOffset = [0, 0, 0, 0, 0, 0, 0, 0]
// testAnimation = 0