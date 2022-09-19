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
	ML = 10,
	Star = 11
}
function KorioroGenerateBlock(username, piece){
	checkDirectory("Korioro")
	var fp = "Kioioro/" + string_replace(username, "/", "_")
	checkDirectory(fp)
	fp += "/" + string(piece)
	checkDirectory(fp)
	if !file_exists(fp + "/1.png"){
		//sprite_save()
	}
	var a = [noone, noone, noone, noone]
	a[0] = sprite_add(fp + "/1.png", 0, 0, 0, 0, 0)
	a[1] = sprite_add(fp + "/2.png", 0, 0, 0, 0, 0)
	a[2] = sprite_add(fp + "/3.png", 0, 0, 0, 0, 0)
	a[3] = sprite_add(fp + "/4.png", 0, 0, 0, 0, 0)
	a[4] = sprite_add(fp + "/5.png", 0, 0, 0, 0, 0)
	return a;
}

function _SaveKorioroBlock(username, piece){
	switch(piece){
	case KorioroPiece.Long:
		
	}
}
