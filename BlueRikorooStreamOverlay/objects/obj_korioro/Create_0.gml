// Korioro for 5 in a row
event_inherited()
board = array2Dfill(12, 22, noone)  // 2D array
pieceSprites = ds_map_create()
pieceOrder = ds_list_create()
activePiece = noone  // [pieceType, name, [objs], center, offset]
orientation = 0
location = [0, 0]

KorioroAddPiece(KorioroPiece.Long, "BlueRikoroo")
KorioroAddPiece(KorioroPiece.MR, "BlueRikoroo")
KorioroAddPiece(KorioroPiece.Star, "BlueRikoroo")
KorioroAddPiece(KorioroPiece.LongL, "BlueRikoroo")
KorioroAddPiece(KorioroPiece.Hat, "BlueRikoroo")
KorioroAddPiece(KorioroPiece.LongJ, "BlueRikoroo")
KorioroAddPiece(KorioroPiece.AwkwardSquareL, "BlueRikoroo")
KorioroAddPiece(KorioroPiece.AwkwardSquareR, "BlueRikoroo")

highScore = 0
currentScore = 0
dropTimer = 0
dropTimerMax = 60*20
resetTime = 0