event_inherited()
surface_set_target(surface)
draw_clear(merge_color(c_green, c_lime, 0.5))

// Debug Outlining
//surfaceWidth = 356
//surfaceHeight = 642
draw_set_color(c_red)
draw_rectangle(30, 30, surfaceWidth - 30, surfaceHeight - 30, true)
draw_rectangle(31, 31, surfaceWidth - 31, surfaceHeight - 31, true)

// Draw Squares
var W = 20
var Left = 60
var Right = Left+12*W
var Bottom = surfaceHeight-60
var Top = Bottom-W*22  // 142
for(var X = 0; X <= 12; X++){
	var lx = X*W+Left
	draw_line_width(lx, Top, lx, Bottom, 2)  
}
for(var Y = 0; Y <= 22; Y++){
	var ly = Y*W+Top
	draw_line_width(Left, ly, Right, ly, 2)
}

with(obj_korioroPiece){
	event_perform(ev_draw, 0)	
}

var scale = dropTimer/dropTimerMax
draw_set_color(c_gray)
draw_rectangle(Right+5, Top, Right+20, Bottom, false)
draw_set_color(merge_color(c_green, c_red, scale))
draw_rectangle(Right+7, Bottom-(1-scale)*(Bottom-Top), Right+18, Bottom, false)

// Title
draw_text_setup(fnt_subStatueUsername_tier3, fa_center, fa_top, c_white)
draw_text(surfaceWidth*0.5, 110, "KORIORO!")

// Play
if !obj_main.streamOver{
	draw_setup()
	draw_rectangle(surfaceWidth-130,0,surfaceWidth,55,false)
	draw_set_color(make_color_hsv(global.time*0.25 mod 255, 150, 255))
	draw_rectangle(surfaceWidth-125, 0, surfaceWidth-5, 50, false)
	draw_text_setup(fnt_chatText, fa_center, fa_middle, c_white)
	draw_text(surfaceWidth-75, 35, "PLAY (5     )")
	draw_sprite_ext(spr_m_coin1, global.time*0.05, surfaceWidth-50, 45, 0.75, 0.75, 0, -1, 1)
}

// Score
draw_text_setup(fnt_chatText, fa_left, fa_top, c_white)
draw_text(40, 30, "High Score: " + string(highScore))
draw_text(40, 50, "Score: " + string(currentScore))

// Players
if activePiece != noone{
	draw_text(40, 70, "Current: " + activePiece[1])
}
if ds_list_size(pieceOrder) > 0{
	draw_text(40, 90, "Next: " + pieceOrder[| 0][1])
}

// Popups
with(obj_gamePopup){
	event_perform(ev_draw, 0)
}

surface_reset_target()