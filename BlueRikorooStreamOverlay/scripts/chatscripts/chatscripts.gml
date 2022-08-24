function create_chat_message(author, Content, element){
	var obj = instance_create_layer(25, 15, getLayer(-1000), obj_chatMessage)
	switch(element){
	case Element.neutral:
		obj.elementSpr = spr_chatSymbol_neutral
		obj.nameColor = c_gray break
	case Element.fire: 
		obj.elementSpr = spr_chatSymbol_fire
		obj.nameColor = merge_color(c_red, c_white, 0.25) break
	case Element.earth: 
		obj.elementSpr = spr_chatSymbol_earth
		obj.nameColor = merge_color(c_orange, c_white, 0.25) break
	case Element.metal: case Element.ai:
		obj.elementSpr = spr_chatSymbol_metal
		obj.nameColor = c_ltgray break
	case Element.storm: 
		obj.elementSpr = spr_chatSymbol_storm
		obj.nameColor = c_yellow break
	case Element.nature: 
		obj.elementSpr = spr_chatSymbol_nature
		obj.nameColor = c_lime break
	case Element.water: 
		obj.elementSpr = spr_chatSymbol_water
		obj.nameColor = c_aqua break
	case Element.ice: 
		obj.elementSpr = spr_chatSymbol_ice
		obj.nameColor = merge_color(c_aqua, c_white, 0.25) break
	case Element.light: 
		obj.elementSpr = spr_chatSymbol_light
		obj.nameColor = merge_color(c_white, c_yellow, 0.25) break
	case Element.shadow: 
		obj.elementSpr = spr_chatSymbol_shadow
		obj.nameColor = merge_color(c_purple, c_white, 0.25) break
	case Element.time:
		obj.elementSpr = spr_chatSymbol_time
		obj.nameColor = c_gray break
	}
	
	obj.author = author
	obj.content = Content
	
	var width = obj_main.chat_surface_width-75 // 25 (symetry) + 25 (left) + 25 (symbol)
	with(obj){
		while(string_width(author + ": " + content) > width){
			var lastSpace = -1
			for(var i = 1; i <= string_length(content); i++){
				if string_width(author + ": " + string_copy(content, 1, i)) > width{
					break	
				}
				if string_char_at(content, i) == " "{
					lastSpace = i
				}
			}
			if lastSpace = -1{
				content = "<Message Too Long>"
				break
			}else{
				content = string_copy(content, 1, lastSpace-1) + "\n" + string_copy(content, lastSpace+1, 10000000)
			}
		}
	}
	
	var moveAmount = (string_count("\n", obj.content)+1)*25
	with(obj_chatMessage){
		if id != obj.id{
			y+=moveAmount
			if y + boxHeight > obj_main.chat_surface_height
				instance_destroy()
		}
	}
	
	draw_set_font(fnt_chatText)
	obj.boxWidth = string_width(author + ": " + obj.content)
	obj.boxHeight = moveAmount
	
	obj.backgroundColor = make_color_hsv((color_get_hue(obj.nameColor)+64) mod 255, color_get_saturation(obj.nameColor), color_get_value(obj.nameColor))
}