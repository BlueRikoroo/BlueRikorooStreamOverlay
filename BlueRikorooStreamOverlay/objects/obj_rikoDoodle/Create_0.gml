event_inherited()
checkDirectory("RikoDoodle")
ini_open("RikoDoodle/Data.ini")
currentFile = ini_read_real("File", "Current", 0)
ini_close()

canvas = noone  // Where peeps draw
canvasWidth = surfaceWidth - 60
canvasHeight = surfaceHeight - 200
canvasPosX = 30
canvasPosY = 175
canvasFilename = "RikoDoodle/Canvas.png"
canvasSpr = noone // temp variable for initializing surface
colorPickSprite = noone

gameCloseTimer = 60*30

colorLookup = ds_map_create()

colorOptions = [c_white, c_ltgray, c_gray, c_dkgray, c_black, c_maroon, 
  c_red, c_orange, c_yellow, c_olive, c_green, c_lime, c_teal, c_aqua, c_blue,
  c_navy, c_fuchsia, c_purple]
  
 