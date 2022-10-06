// Korioro for 5 in a row
event_inherited()
checkDirectory("Korioro")
ini_open("Korioro/Data.ini")

pieceSprites = ds_map_create()
pieceOrderPriority = ds_list_create()
pieceOrder = ds_list_create()
activePiece = noone  // [pieceType, name, [objs], center, offset]
nextPiece = noone    // same
orientation = 0
location = [0, 0]
board = array2Dfill(12, 22, noone)  // 2D array
for(var X = 0; X < 12; X++){
	for(var Y = 0; Y < 22; Y++){
		var cord = string(X) + ";" + string(Y)
		var data = ini_read_string("Board", cord, "noone")
		if data != "noone"{
			data = stringSplit(";", data)	
			var s = KorioroGenerateBlock(data[0], real(data[1]))
			var obj = instance_create_layer(X, Y, getLayer(-500), obj_korioroPiece)
			obj.spr = s[real(data[2])-1]
			updatePiece(obj,real(data[3]), real(data[1]), data[0], data[2])
			board[X][Y] = obj
		}
	}
}

highScore = ini_read_real("Score", "High", 0)
currentScore = ini_read_real("Score", "Current", 0)
streak = 0

ini_close()

dropTimer = 0
dropTimerMax = 60*20
resetTime = 0

gameCloseTimer = 60*20