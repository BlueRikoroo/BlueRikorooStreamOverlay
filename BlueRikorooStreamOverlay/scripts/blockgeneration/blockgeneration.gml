enum KorioroPiece{
	Long = 0,
	LongL = 1,
	AwkwardTR = 2,
	AwkwardTL = 3,
	LongJ = 4,
	Corner = 5,
	AwkwardSquareR = 6,
	Hat = 7,
	AwkwardSquareL = 8,
	MR = 9,
	Star = 10
}
function KorioroGenerateBlock(username, piece){
	checkDirectory("Korioro")
	var fp = "Korioro/" + string_replace(username, "/", "_")
	checkDirectory(fp)
	fp += "/" + string(piece)
	checkDirectory(fp)
	if !file_exists(fp + "/1.png"){
		_SaveKorioroBlock(fp, username, piece)
	}
	var a = [noone, noone, noone, noone]
	if ds_map_exists(pieceSprites, username + "ô" + string(piece) + "ô1"){
		a[0] = ds_map_find_value(pieceSprites, username + "ô" + string(piece) + "ô1")
		a[1] = ds_map_find_value(pieceSprites, username + "ô" + string(piece) + "ô2")
		a[2] = ds_map_find_value(pieceSprites, username + "ô" + string(piece) + "ô3")
		a[3] = ds_map_find_value(pieceSprites, username + "ô" + string(piece) + "ô4")
		a[4] = ds_map_find_value(pieceSprites, username + "ô" + string(piece) + "ô5")
	}else{
		a[0] = sprite_add(fp + "/1.png", 0, 0, 0, 0, 0)
		a[1] = sprite_add(fp + "/2.png", 0, 0, 0, 0, 0)
		a[2] = sprite_add(fp + "/3.png", 0, 0, 0, 0, 0)
		a[3] = sprite_add(fp + "/4.png", 0, 0, 0, 0, 0)
		a[4] = sprite_add(fp + "/5.png", 0, 0, 0, 0, 0)
		ds_map_add(pieceSprites, username + "ô" + string(piece) + "ô1", a[0])
		ds_map_add(pieceSprites, username + "ô" + string(piece) + "ô2", a[1])
		ds_map_add(pieceSprites, username + "ô" + string(piece) + "ô3", a[2])
		ds_map_add(pieceSprites, username + "ô" + string(piece) + "ô4", a[3])
		ds_map_add(pieceSprites, username + "ô" + string(piece) + "ô5", a[4])
	}
	
	return a;
}

function updatePiece(obj, orientation){
	with obj{
		switch(orientation){
		case 0:
			xOff = 0
			yOff = 0
			break
		case 90:
			xOff = 0
			yOff = 1
			break
		case 180:
			xOff = 1
			yOff = 1
			break
		case 270:
			xOff = 1
			yOff = 0
			break
		}
		angle = orientation
	}
}

function KorioroGetOffset(piece){
	var ox = [0, 0, 0, 0, 0]
	var oy = [0, 0, 0, 0, 0]
	switch(piece){
	case KorioroPiece.Long:
		ox = [0, 1, 2, 3, 4]
		break
	case KorioroPiece.LongL:
	    ox = [0, 1, 2, 3, 0]
		oy = [0, 0, 0, 0, 1]
		break
	case KorioroPiece.LongJ:
		ox = [0, 1, 2, 3, 3]
		oy = [0, 0, 0, 0, 1]
		break
	case KorioroPiece.AwkwardTR:
		ox = [0, 1, 2, 3, 1]
		oy = [0, 0, 0, 0, 1]
		break
	case KorioroPiece.AwkwardTL:
		ox = [0, 1, 2, 3, 2]
		oy = [0, 0, 0, 0, 1]
		break
	case KorioroPiece.Corner:
		ox = [0, 1, 2, 0, 0]
		oy = [0, 0, 0, 1, 2]
		break
	case KorioroPiece.AwkwardSquareR:
		ox = [0, 1, 2, 0, 1]
		oy = [0, 0, 0, 1, 1]
		break
	case KorioroPiece.AwkwardSquareL:
		ox = [0, 1, 2, 1, 2]
		oy = [0, 0, 0, 1, 1]
		break
	case KorioroPiece.Hat:
		ox = [0, 1, 2, 0, 2]
		oy = [0, 0, 0, 1, 1]
		break
	case KorioroPiece.MR:
		ox = [1, 2, 0, 1, 0]
		oy = [0, 0, 1, 1, 2]
		break
	case KorioroPiece.Star:
		ox = [1, 0, 1, 2, 1]
		oy = [0, 1, 1, 1, 2]
		break
	}
	return [ox, oy]
}
function KorioroGetStartPos(piece){
	switch(piece){
	case KorioroPiece.Long:
		return [-2, 0]
	case KorioroPiece.LongL:
	case KorioroPiece.AwkwardTR:
	    return [-2, -1]
	case KorioroPiece.LongJ:
	case KorioroPiece.AwkwardTL:
	case KorioroPiece.AwkwardSquareR:
	case KorioroPiece.AwkwardSquareL:
	case KorioroPiece.Hat:
		return [-1, -1]
	case KorioroPiece.Corner:
	case KorioroPiece.MR:
	case KorioroPiece.Star:
		return [-1, -2]
	}
	return [0, 0]
}
function KorioroGetCenter(piece){
	switch(piece){
	case KorioroPiece.Long:
	case KorioroPiece.LongJ:
	case KorioroPiece.AwkwardTL:
		return [2, 0]
	case KorioroPiece.LongL:
	case KorioroPiece.AwkwardTR:
	    return [1, 0]
	case KorioroPiece.AwkwardSquareR:
		return [0.5, 0.5]
	case KorioroPiece.AwkwardSquareL:
		return [1.5, 0.5]
	case KorioroPiece.Hat:
		return [1, 0]
	case KorioroPiece.Corner:
	case KorioroPiece.MR:
	case KorioroPiece.Star:
		return [1, 1]
	}
	return [0, 0]
}

function _SaveKorioroBlock(fp, username, piece){
	var W = 20
	username = string_upper(username)
	switch(piece){
	case KorioroPiece.Long:
		var s = surface_create(W*5, W)
		surface_set_target(s)
		draw_clear(c_blue)
		draw_text_setup(fnt_korioro_piece, fa_center, fa_middle, c_white)
		var MaxW = W*5
		var SW = string_width(username)
		draw_text_transformed(MaxW*0.5,W*0.5,username,MaxW/SW,1,0)
		surface_reset_target()
		surface_save_part(s, fp + "/1.png", 0, 0, W, W)
		surface_save_part(s, fp + "/2.png", W, 0, W, W)
		surface_save_part(s, fp + "/3.png", W*2, 0, W, W)
		surface_save_part(s, fp + "/4.png", W*3, 0, W, W)
		surface_save_part(s, fp + "/5.png", W*4, 0, W, W)
		break
	case KorioroPiece.LongL:
		var s = surface_create(W*4, W*2)
		surface_set_target(s)
		draw_clear(c_lime)
		draw_text_setup(fnt_korioro_piece, fa_center, fa_middle, c_white)
		var MaxW = W*4
		var SW = string_width(username)
		draw_text_transformed(W*2,W,username,MaxW/SW,1,14.03)
		surface_reset_target()
		surface_save_part(s, fp + "/1.png", 0, 0, W, W)
		surface_save_part(s, fp + "/2.png", W, 0, W, W)
		surface_save_part(s, fp + "/3.png", W*2, 0, W, W)
		surface_save_part(s, fp + "/4.png", W*3, 0, W, W)
		surface_save_part(s, fp + "/5.png", 0, W, W, W)
		break
	case KorioroPiece.LongJ:
		var s = surface_create(W*4, W*2)
		surface_set_target(s)
		draw_clear(c_green)
		draw_text_setup(fnt_korioro_piece, fa_center, fa_middle, c_white)
		var MaxW = W*4
		var SW = string_width(username)
		draw_text_transformed(W*2,W,username,MaxW/SW,1,-14.03)
		surface_reset_target()
		surface_save_part(s, fp + "/1.png", 0, 0, W, W)
		surface_save_part(s, fp + "/2.png", W, 0, W, W)
		surface_save_part(s, fp + "/3.png", W*2, 0, W, W)
		surface_save_part(s, fp + "/4.png", W*3, 0, W, W)
		surface_save_part(s, fp + "/5.png", W*3, W, W, W)
		break
	case KorioroPiece.AwkwardTR:
		var s = surface_create(W*4, W*2)
		surface_set_target(s)
		draw_clear(c_olive)
		draw_text_setup(fnt_korioro_piece, fa_center, fa_middle, c_white)
		var MaxW = W*4
		var SW = string_width(username)
		draw_text_transformed(W*2,W*.75,username,MaxW/SW,1,0)
		surface_reset_target()
		surface_save_part(s, fp + "/1.png", 0, 0, W, W)
		surface_save_part(s, fp + "/2.png", W, 0, W, W)
		surface_save_part(s, fp + "/3.png", W*2, 0, W, W)
		surface_save_part(s, fp + "/4.png", W*3, 0, W, W)
		surface_save_part(s, fp + "/5.png", W, W, W, W)
		break
	case KorioroPiece.AwkwardTL:
		var s = surface_create(W*4, W*2)
		surface_set_target(s)
		draw_clear(c_orange)
		draw_text_setup(fnt_korioro_piece, fa_center, fa_middle, c_white)
		var MaxW = W*4
		var SW = string_width(username)
		draw_text_transformed(W*2,W*.75,username,MaxW/SW,1,0)
		surface_reset_target()
		surface_save_part(s, fp + "/1.png", 0, 0, W, W)
		surface_save_part(s, fp + "/2.png", W, 0, W, W)
		surface_save_part(s, fp + "/3.png", W*2, 0, W, W)
		surface_save_part(s, fp + "/4.png", W*3, 0, W, W)
		surface_save_part(s, fp + "/5.png", W*2, W, W, W)
		break
	case KorioroPiece.Corner:
		var s = surface_create(W*3, W*3)
		surface_set_target(s)
		draw_clear(c_aqua)
		draw_text_setup(fnt_korioro_piece, fa_center, fa_middle, c_white)
		var MaxW = W*3
		var SW = string_width(username)
		draw_text_transformed(W*1.5,W*0.5,username,MaxW/SW,1,0)
		surface_reset_target()
		surface_save_part(s, fp + "/1.png", 0, 0, W, W)
		surface_save_part(s, fp + "/2.png", W, 0, W, W)
		surface_save_part(s, fp + "/3.png", W*2, 0, W, W)
		surface_save_part(s, fp + "/4.png", 0, W, W, W)
		surface_save_part(s, fp + "/5.png", 0, W*2, W, W)
		break
	case KorioroPiece.AwkwardSquareR:
		var s = surface_create(W*3, W*2)
		surface_set_target(s)
		draw_clear(c_yellow)
		draw_text_setup(fnt_korioro_piece, fa_center, fa_middle, c_white)
		var MaxW = W*3
		var SW = string_width(username)
		draw_text_transformed(W*1.5,W,username,MaxW/SW,1,18.5)
		surface_reset_target()
		surface_save_part(s, fp + "/1.png", 0, 0, W, W)
		surface_save_part(s, fp + "/2.png", W, 0, W, W)
		surface_save_part(s, fp + "/3.png", W*2, 0, W, W)
		surface_save_part(s, fp + "/4.png", 0, W, W, W)
		surface_save_part(s, fp + "/5.png", W, W, W, W)
		break
	case KorioroPiece.AwkwardSquareL:
		var s = surface_create(W*3, W*2)
		surface_set_target(s)
		draw_clear(c_teal)
		draw_text_setup(fnt_korioro_piece, fa_center, fa_middle, c_white)
		var MaxW = W*3
		var SW = string_width(username)
		draw_text_transformed(W*1.5,W,username,MaxW/SW,1,-18.5)
		surface_reset_target()
		surface_save_part(s, fp + "/1.png", 0, 0, W, W)
		surface_save_part(s, fp + "/2.png", W, 0, W, W)
		surface_save_part(s, fp + "/3.png", W*2, 0, W, W)
		surface_save_part(s, fp + "/4.png", W, W, W, W)
		surface_save_part(s, fp + "/5.png", W*2, W, W, W)
		break
	case KorioroPiece.Hat:
		var s = surface_create(W*3, W*2)
		surface_set_target(s)
		draw_clear(c_purple)
		draw_text_setup(fnt_korioro_piece, fa_center, fa_middle, c_white)
		var MaxW = W*3
		var SW = string_width(username)
		draw_text_transformed(W*1.5,W*.875,username,MaxW/SW,1,0)
		surface_reset_target()
		surface_save_part(s, fp + "/1.png", 0, 0, W, W)
		surface_save_part(s, fp + "/2.png", W, 0, W, W)
		surface_save_part(s, fp + "/3.png", W*2, 0, W, W)
		surface_save_part(s, fp + "/4.png", 0, W, W, W)
		surface_save_part(s, fp + "/5.png", W*2, W, W, W)
		break
	case KorioroPiece.MR:
		var s = surface_create(W*3, W*3)
		surface_set_target(s)
		draw_clear(c_maroon)
		draw_text_setup(fnt_korioro_piece, fa_center, fa_middle, c_white)
		var MaxW = W*3.25
		var SW = string_width(username)
		draw_text_transformed(W*1.25,W*1.25,username,MaxW/SW,1,45)
		surface_reset_target()
		surface_save_part(s, fp + "/1.png", W, 0, W, W)
		surface_save_part(s, fp + "/2.png", W*2, 0, W, W)
		surface_save_part(s, fp + "/3.png", 0, W, W, W)
		surface_save_part(s, fp + "/4.png", W, W, W, W)
		surface_save_part(s, fp + "/5.png", 0, W*2, W, W)
		break
	case KorioroPiece.Star:
		var s = surface_create(W*3, W*3)
		surface_set_target(s)
		draw_clear(c_fuchsia)
		draw_text_setup(fnt_korioro_piece, fa_center, fa_middle, c_white)
		var MaxW = W*3
		var SW = string_width(username)
		draw_text_transformed(W*1.5,W*1.5,username,MaxW/SW,1,0)
		surface_reset_target()
		surface_save_part(s, fp + "/1.png", W, 0, W, W)
		surface_save_part(s, fp + "/2.png", 0, W, W, W)
		surface_save_part(s, fp + "/3.png", W*1, W, W, W)
		surface_save_part(s, fp + "/4.png", W*2, W, W, W)
		surface_save_part(s, fp + "/5.png", W, W*2, W, W)
		break
	}
}
function KorioroAddPiece(piece, username){
	var sprite = KorioroGenerateBlock(username, piece)
	var s = KorioroGetStartPos(piece)
	var o = KorioroGetOffset(piece)
	var a = [noone, noone, noone, noone]
	a[0] = instance_create_layer(5+s[0]+o[0][0]-100, s[1]+o[1][0], getLayer(-100), obj_korioroPiece)
	updatePiece(a[0], 0)
	a[0].spr = sprite[0]
	a[1] = instance_create_layer(5+s[0]+o[0][1]-100, s[1]+o[1][1], getLayer(-100), obj_korioroPiece)
	updatePiece(a[1], 0)
	a[1].spr = sprite[1]
	a[2] = instance_create_layer(5+s[0]+o[0][2]-100, s[1]+o[1][2], getLayer(-100), obj_korioroPiece)
	updatePiece(a[2], 0)
	a[2].spr = sprite[2]
	a[3] = instance_create_layer(5+s[0]+o[0][3]-100, s[1]+o[1][3], getLayer(-100), obj_korioroPiece)
	updatePiece(a[3], 0)
	a[3].spr = sprite[3]
	a[4] = instance_create_layer(5+s[0]+o[0][4]-100, s[1]+o[1][4], getLayer(-100), obj_korioroPiece)
	updatePiece(a[4], 0)
	a[4].spr = sprite[4]
	ds_list_add(pieceOrder, [piece, username, a, KorioroGetCenter(piece), o])
}
function KorioroPiecePlace(array){
	var obja = array[2]	
	for (var i = 0; i < 5; i++){
		var X = round(obja[i].x)
		var Y = round(obja[i].y)
		if X >= 0 and X < 12 and Y >= 0 and Y < 22{
			board[X][Y] = obja[i]
		}
	}
	activePiece = noone
	
	clears = 0
	for(var Y = 21; Y >= 0; Y--){
		clear = true
		for(var X = 0; X < 12; X++){
			if board[X][Y] == noone{
				clear = false
			}
		}
		if clear{
			clears += 1
			for(var X = 0; X < 12; X++){
				instance_destroy(board[X][Y])
				board[X][Y] = noone
			}
			for(var AY = Y; AY > 0; AY--){
				for(var AX = 0; AX < 12; AX++){
					var temp = board[AX][AY]
					board[AX][AY] = board[AX][AY-1]
					if board[AX][AY] != noone{
						board[AX][AY].y++	
					}
					board[AX][AY-1] = temp
				}
			}
			Y++
		}
	}
}

function KorioroPieceMove(array, offset){
	var obja = array[2]
	
	// Test if can move
	for (var i = 0; i < 5; i++){
		var X = round(obja[i].x + offset[0])
		var Y = round(obja[i].y + offset[1])
		if X < 0 or X >= 12 or Y >= 22 or (Y >= 0 and board[X, Y] != noone){
			return false
		}
	}
	
	// Move
	for (var i = 0; i < 5; i++){
		obja[i].x += offset[0]
		obja[i].y += offset[1]
	}
	location[0] += offset[0]
	location[1] += offset[1]
	
	return true
}

function KorioroPieceRotate(array, orientationOffset, roptions){
	var obja = array[2]
	var Px = [0, 0, 0, 0, 0]
	var Py = [0, 0, 0, 0, 0]
	if orientationOffset == -90{
		for (var i = 0; i < 5; i++){
			Px[i] = location[0]-(obja[i].y-location[1])
			Py[i] = location[1]+(obja[i].x-location[0])
		}
	}else{
		for (var i = 0; i < 5; i++){
			Px[i] = location[0]+(obja[i].y-location[1])
			Py[i] = location[1]-(obja[i].x-location[0])
		}
	}
	//Test if can move
	var roffset = noone
	for (var i = 0; i < 25; i++){
		var works = true
		for (var Pi = 0; Pi < 5; Pi++){
			var X = Px[Pi] + roptions[i][0]	
			var Y = Py[Pi] + roptions[i][1]
			if X < 0 or X >= 12 or Y >= 22 or (Y >= 0 and board[X, Y] != noone){
				works = false
				break	
			}
		}
		if works{
			roffset = roptions[i]
			break	
		}
	}
	
	if roffset == noone{
		return	
	}
	
	// Move
	orientation += orientationOffset
	if orientation < 0{
		orientation += 360	
	}
	if orientation >= 360{
		orientation -= 360	
	}
	location[0] += roffset[0]
	location[1] += roffset[1]
	for (var i = 0; i < 5; i++){
		updatePiece(obja[i], orientation)
		obja[i].x = Px[i] + roffset[0]
		obja[i].y = Py[i] + roffset[1]
	}
}
function KorioroPieceRotateR(array){
	KorioroPieceRotate(array, -90, [[0, 0], [0, 1], [0, 2], [1, 0], [-1, 0], [1, 1], [-1, 1],
	[1, 2], [-1, 2], [2, 0], [-2, 0], [2, 1], [-2, 1], [2, 2], [-2, 2],
	[0, -1], [0, -2], [1, -1], [-1, -1], [1, -2], [-1, -2], [2, -1], [-2, -1], 
	[2, -2], [-2, -2]])
}
function KorioroPieceRotateL(array){
	KorioroPieceRotate(array, 90, [[0, 0], [0, 1], [0, 2], [-1, 0], [1, 0], [-1, 1], [1, 1],
	[-1, 2], [1, 2], [-2, 0], [2, 0], [-2, 1], [2, 1], [-2, 2], [2, 2],
	[0, -1], [0, -2], [-1, -1], [1, -1], [-1, -2], [1, -2], [-2, -1], [2, -1], 
	[-2, -2], [2, -2]])
}