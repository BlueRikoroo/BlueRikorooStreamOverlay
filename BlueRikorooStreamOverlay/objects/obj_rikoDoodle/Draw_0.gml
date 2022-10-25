event_inherited()
surface_set_target(surface)
draw_clear(merge_color(c_green, c_lime, 0.5))

// Title
draw_text_setup(fnt_subStatueUsername_tier3, fa_center, fa_top, c_white)
draw_text(surfaceWidth*0.5, 50, "Riko Doodle <3")

// Draw Canvas
if !surface_exists(canvas){
	if !file_exists(canvasFilename){
		canvas = surface_create(canvasWidth, canvasHeight)
		surface_reassign_target(canvas)
		draw_clear_alpha(c_white, 1)
		surface_reassign_target(surface)
		surface_save(canvas, canvasFilename)
	}else{
		canvasSpr = sprite_add(canvasFilename, 0, false, false, 0, 0)
		canvas = surface_create(canvasWidth, canvasHeight)
		surface_reassign_target(canvas)
		draw_sprite(canvasSpr, 0, 0, 0)
		alarm[1] = 1  // Delete Sprite
		surface_reassign_target(surface)
	}
}

// Clear if wipe
if keyboard_string="wipe"{
	keyboard_string = ""
	canvas = surface_create(canvasWidth, canvasHeight)
	surface_reassign_target(canvas)
	draw_clear_alpha(c_white, 1)
	surface_reassign_target(surface)
	surface_save(canvas, canvasFilename)
}

// Draw Color Options
if !sprite_exists(colorPickSprite){

	var colorPickSurface = surface_create(canvasWidth, 50)
	surface_reassign_target(colorPickSurface)
	draw_clear_alpha(c_white, 1)
	var betweenWidth = canvasWidth / array_length(colorOptions)
	for(var i = 0; i < array_length(colorOptions); i++){
		draw_set_color(colorOptions[i])
		draw_rectangle(i*betweenWidth, 0, (i+1)*betweenWidth, 50, false)
	}
	draw_setup(c_black, 1)
	draw_rectangle(1, 1, canvasWidth-2, 48, true)
	surface_reassign_target(surface)
	colorPickSprite = sprite_create_from_surface(colorPickSurface, 0, 0, canvasWidth, 50, false, false, 0, 0)
}

draw_sprite(colorPickSprite, 0, canvasPosX, 100)


draw_surface(canvas, canvasPosX, canvasPosY)

with(obj_mouse){
	var X = x - obj_main.activeGamePosX
	var Y = y - obj_main.activeGamePosY
	if posInRegion(X, Y, 0, 0, other.surfaceWidth, other.surfaceHeight){
		var color = other.colorLookup[? username]
		if is_undefined(color){
			color = c_black
			other.colorLookup[? username] = color
		}
		draw_set_color(color)
		draw_circle(X,  Y, 2, false)
	}
	if currentEvent == "mousemove"{
		lastPosX = X
		lastPosY = Y
	}
	else if currentEvent == "mousedrag"{	
		// Draw from Mouse
		if posInRegion(X,Y,other.canvasPosX,other.canvasPosY,other.canvasPosX+other.canvasWidth,other.canvasPosY+other.canvasHeight){
			surface_reassign_target(other.canvas)
			draw_set_color(other.colorLookup[? username])
			draw_line_width(lastPosX-other.canvasPosX, lastPosY-other.canvasPosY, 
			                X-other.canvasPosX, Y-other.canvasPosY, 4)
			surface_reassign_target(other.surface)
			alarm[0] = 60
			other.gameCloseTimer = 60*20
		}
		lastPosX = X
		lastPosY = Y	
	}
}


// Popups
with(obj_gamePopup){
	event_perform(ev_draw, 0)
}

surface_reset_target()

if keyboard_check(vk_lcontrol) and keyboard_check_pressed(ord("S")){
	checkDirectory("RikoDoodle/Saves")
	surface_save(canvas, "RikoDoodle/Saves/" + string(currentFile) + ".png")
	createGamePopup("File Saved\n" + string(currentFile) + ".png")
	ini_open("RikoDoodle/Data.ini")
	currentFile++
	ini_write_real("File", "Current", currentFile)
	ini_close()
}