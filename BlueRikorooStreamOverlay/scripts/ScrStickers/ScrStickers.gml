// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnSticker(Username, Spr){
	var obj = instance_create_layer(50 + irandom(1820), 1580, getLayer(0), obj_sticker)
	obj.username = Username
	obj.spr = Spr
	return obj
}

function processSticker(Username, SprString){
	switch(SprString){
	case "angel": return spawnSticker(Username, spr_sticker_angel)
	case "blep": return spawnSticker(Username, spr_sticker_blep)
	case "blush": return spawnSticker(Username, choose(spr_sticker_blush, spr_sticker_blush2))
	case "chomp": return spawnSticker(Username, spr_sticker_chomp)
	case "derp": return spawnSticker(Username, spr_sticker_derp)
	case "evil": return spawnSticker(Username, spr_sticker_evil)
	case "flop": return spawnSticker(Username, spr_sticker_flop)
	case "gimme": return spawnSticker(Username, spr_sticker_gimme)
	case "hehe": return spawnSticker(Username, spr_sticker_hehe)
	case "hmmm": return spawnSticker(Username, spr_sticker_hmmm)
	case "hug": return spawnSticker(Username, spr_sticker_hug)
	case "hugAll": return spawnSticker(Username, spr_sticker_hugAll)
	case "hugSad": return spawnSticker(Username, spr_sticker_hugSad)
	case "lick": return spawnSticker(Username, spr_sticker_lick)
	case "love": return spawnSticker(Username, spr_sticker_love)
	case "patpat": return spawnSticker(Username, spr_sticker_patpat)
	case "shrug": return spawnSticker(Username, spr_sticker_shrug)
	case "sleep": return spawnSticker(Username, spr_sticker_sleep)
	case "wave": return spawnSticker(Username, spr_sticker_wave)
	case "yaaay": return spawnSticker(Username, spr_sticker_yaaay)
	case "yesss": return spawnSticker(Username, spr_sticker_yesss)
	case "yesyes": return spawnSticker(Username, spr_sticker_yesyes)
	}
}