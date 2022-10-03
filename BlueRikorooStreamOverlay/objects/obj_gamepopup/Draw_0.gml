if !surface_exists(surface){
	surface = surface_create(surfaceWidth, surfaceHeight)
}
surface_set_target(surface)

var SCx = surfaceWidth*0.5
var SCy = surfaceHeight*0.5
draw_text_setup(fnt_subStatueUsername_tier3, fa_center, fa_middle, c_black, 1)
for(var X = -2; X <= 2; X += 2){
	for(var Y = -2; Y <= 2; Y += 2){
		draw_text_transformed(SCx+X, SCy+Y, text, 1, 1, 0)
	}
}
draw_setup(make_color_hsv(global.time mod 255, 255, 255), 1)
draw_text_transformed(SCx, SCy, text, 1, 1, 0)

surface_reset_target()

var scale = 1+0.2*sin(global.time*0.1)
draw_surface_ext(surface, x-surfaceWidth*0.5*scale, y-surfaceHeight*0.5*scale, scale, scale, 0, -1, min(1, timer/60))