enum Game{
	Korioro = 0,
	RikoDoodle = 1,
}

function ActivateGame(game){
	if allowGame{
		if activeGame == noone{
			switch(game){
			case Game.Korioro:
				activeGame = instance_create_layer(0, 0, getLayer(-100), obj_korioro)
				break
			case Game.RikoDoodle:
				activeGame = instance_create_layer(0, 0, getLayer(-100), obj_rikoDoodle)
			}
			if activeGame != noone{
				activeGame.gameID = game
			}
		}else if activeGame.gameID != game{
			activeGameSwap = game
		}
	}
}

function drawGameSurface(){
	if !surface_exists(surface){
		surface = surface_create(surfaceWidth, surfaceHeight)
	}
	surface_set_target(obj_main.activeGameSurface)
	draw_surface(surface, (1-sin(pi/2*obj_main.activeGameTransition))*obj_main.activeGameSurfaceWidth*1.05, 0)
	surface_reset_target()
}

function createGamePopup(text, Time=60*3, offsetPosScale=[1, 1]){
	var obj = instance_create_layer(surfaceWidth*0.5*offsetPosScale[0], surfaceHeight*0.5*offsetPosScale[1], getLayer(-500), obj_gamePopup)
	obj.text = text
	obj.timer = Time
	draw_set_font(fnt_subStatueUsername_tier3)
	obj.surfaceWidth = string_width(obj.text) + 8
	obj.surfaceHeight = string_height(obj.text) + 8
	instance_deactivate_object(obj)
	ds_list_add(popups, obj)
}

function draw_startgame_button(str, x1, y1, x2, y2){
	draw_set_color(c_white)
	draw_rectangle(x1,  y1,   x2,   y2,   false)
	draw_set_color(make_color_hsv((global.time*0.25 + string_length(str)*20) mod 255, 150, 255))
	draw_rectangle(x1+5,y1+5, x2-5, y2-5, false)
	draw_text_setup(fnt_chatText, fa_center, fa_middle, c_black)
	draw_text((x2+x1)*0.5, (y2+y1)*0.5, str)
}