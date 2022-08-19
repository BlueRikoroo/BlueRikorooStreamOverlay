//draw_setup(backgroundColor, 1)
//draw_rectangle(x - 14, y - 14, x + 28 + boxWidth, y - 14 + boxHeight, false)

draw_sprite(elementSpr, 0, x, y)

draw_set_font(fnt_chatText)
draw_set_valign(fa_top)
draw_set_halign(fa_left)

draw_set_color(c_black)
var OS = 1  //Outline Size
for(var X = -OS; X <=OS; X+=OS)
	for(var Y = -OS; Y <= OS; Y+=OS)
		draw_text(x + 15 + X, y + Y -14, author + ": " + content)


draw_set_color(c_white)
draw_text(x + 15, y - 14, author + ": " + content)
draw_set_color(nameColor)
draw_text(x + 15, y - 14, author)

draw_set_alpha(1)