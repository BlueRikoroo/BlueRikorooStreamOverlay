event_inherited()
if activePiece == noone and nextPiece != noone{
	// Pull Out Piece
	activePiece = nextPiece
	nextPiece = noone
	ds_list_delete(pieceOrder, 0)	
	for (var i = 0; i < 5; i++){
		activePiece[2][i].x += 100
	}
	// Setup
	orientation = 0
	var sp = KorioroGetStartPos(activePiece[0])
	location = [5 + sp[0] + activePiece[3][0], 0 + sp[1] + activePiece[3][1]]
	dropTimer = 0
	resetTime = 60*5
}
if nextPiece == noone and (ds_list_size(pieceOrder) > 0 or ds_list_size(pieceOrderPriority) > 0){
	if ds_list_size(pieceOrderPriority) > 0{
		nextPiece = pieceOrderPriority[| 0]
		ds_list_delete(pieceOrderPriority, 0)	
	}
	else if ds_list_size(pieceOrder) > 0{
		nextPiece = pieceOrder[| 0]
		ds_list_delete(pieceOrder, 0)	
	}
}
if activePiece == noone and ds_list_size(pieceOrder) == 0 and ds_list_size(pieceOrderPriority) == 0{
	gameCloseTimer--
	if gameCloseTimer <= 0{
		with(obj_main)
			ActivateGame(1000)
	}
}else{
	gameCloseTimer = 60*20
}

if activePiece != noone{
	var mouseObj = getUserMouse(activePiece[1])
	var Xloc = 60 + location[0]*20 + obj_main.activeGamePosX
	if mouseObj.x < Xloc{
		KorioroPieceMove(activePiece, [-1, 0])	
	}
	if mouseObj.x > Xloc+20{
		KorioroPieceMove(activePiece, [1, 0])	
	}
	var Yloc = 142 + location[1]*20 + obj_main.activeGamePosY
	if resetTime <= 0{
		if mouseObj.y > Yloc + 100 and dropTimer < dropTimerMax-60{
			dropTimer = dropTimerMax-60
		}
		if mouseObj.y > Yloc + 200 and dropTimer < dropTimerMax{
			dropTimer = dropTimerMax
		}
	}else{
		resetTime--
	}
	dropTimer++
	if dropTimer > dropTimerMax{
		dropTimer = 0
		if !KorioroPieceMove(activePiece, [0, 1]){
			KorioroPiecePlace(activePiece)	
			if board[3][0] != noone or board[4][0] != noone or board[5][0] != noone
			 or board[6][0] != noone or board[7][0] != noone{
				KorioroFinishGame()
			}
		}
	}
}
