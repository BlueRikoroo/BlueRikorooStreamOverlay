draw_sprite_ext(spr, 0, x, y, 0.5, 0.5, 0, -1, 1)
var NameHeight = y - 250

#region Name

draw_text_setup(fnt_playerName, fa_center, fa_middle)

//Draw Outline
draw_set_color(c_black)
for(var X = -1; X <= 1; X++){
	for(var Y = -1; Y <= 1; Y++){
		draw_text(x+X,NameHeight+Y,username)
	}
}

//Draw Text
draw_set_color(c_white)
draw_text(x,NameHeight,username)

#endregion