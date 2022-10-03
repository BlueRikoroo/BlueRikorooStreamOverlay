function create_chat_message(author, Content, element){
	_processContent(author, Content)
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

function _processContent(author, Content){
	var cl = string_lower(Content)
	
	var newElement = noone
	switch(cl){
	case "!none": case "!neutral": case "!blob": case "!amaranth": case "!gray":
		newElement = Element.neutral break
	case "!fire": case "!red": case "!flame":
		newElement = Element.fire break
	case "!earth": case "!orange": case "!rock": case "!dirt":
		newElement = Element.earth break
	case "!metal": case "!silver": case "!rolly":
		newElement = Element.metal break
	case "!storm": case "!yellow": case "!cloud":
		newElement = Element.storm break
	case "!nature": case "!green": case "!acorn": case "!leaf":
		newElement = Element.nature break
	case "!water": case "!aqua": case "!blue": case "!bubble":
		newElement = Element.water break
	case "!ice": case "!sky": case "!icicle": case "!snowcone":
		newElement = Element.ice break
	case "!light": case "!cape": case "!white":
		newElement = Element.light break
	case "!shadow": case "!purple": case "!ghost":
		newElement = Element.shadow break
	case "!leap": case "!jump":
		var obj = getUserObj(author)
		obj.vspeed = -10
		break
	}
	
	if newElement != noone{
		obj_main.userToElement[? author] = newElement
		var target = getUserObj(author)
		if target{
			var color = getElementColor(newElement)
			var obj = instance_create_layer(
			  camera_get_view_x(view_camera[0])+960,
			  camera_get_view_y(view_camera[0])+1080,
			  getLayer(10), obj_subStatue_elementSwitcher)
			obj.target = target
			obj.element = newElement
			obj.color = color
		}
	}
	
}