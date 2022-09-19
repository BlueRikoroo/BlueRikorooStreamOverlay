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

surface_reset_target()