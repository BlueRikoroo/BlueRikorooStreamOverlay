draw_sprite(sprite_index, 0, x, y)
timer+=0.05
var Y = y - 60 + 5 * sin(timer)
var tierH = tier*6
draw_sprite_ext(elementalSpr, 0, x, Y-tierH, tier, tier, 0, -1, 1)

#region Name

draw_text_setup(fnt_playerName, fa_center, fa_middle)

//Draw Outline
draw_set_color(c_black)
for(var X = -1; X <= 1; X++){
	for(var Y = -1; Y <= 1; Y++){
		draw_text(x+X,y-80+Y-tierH*2,username)
	}
}

//Draw Text
draw_set_color(c_white)
draw_text(x,y-80-tierH*2,username)

#endregion