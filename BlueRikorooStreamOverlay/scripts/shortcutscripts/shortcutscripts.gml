function check_multiple() {
	/// @description check_multiple(variable,checkfor...)
	/// @param variable
	/// @param checkfor...
	//Checks if "variable" is equal to any of the following
	//Used to shorten code / make it more readable.
	for (var i = 1;i<argument_count;i++){
	    if argument[0] = argument[i]{
	        return true
	    }
	}
	return false
}

function snap(value, snapTo) {
	return round(value/snapTo)*snapTo
}

function getBlockshape(grid, X, Y){
	var obj = ds_grid_get(grid, X, Y)
	if !is_undefined(obj) and obj != 0
		return obj.blockShape	
	return -1
}

function getRandomElement(){
	return choose(Element.neutral, Element.fire, Element.earth,
	Element.metal, Element.storm, Element.nature, Element.water,
	Element.ice, Element.light, Element.shadow)
}

function audio_play_sfx(audio,audio_priority=0,loop=false,pitch=1,gain=1){
	var snd = audio_play_sound(audio,audio_priority,loop);
	audio_sound_gain(snd,gain*audio_sound_get_gain(audio),0);
	audio_sound_pitch(snd,pitch);
	return snd
}

function empty_script(){
	
}

function draw_setup(color=c_white,alpha=1){
	draw_set_color(color)
	draw_set_alpha(alpha)
}
function draw_text_setup(font, halign, valign, color=draw_get_color(), alpha=draw_get_alpha()){
	draw_set_font(font)
	draw_set_halign(halign)
	draw_set_valign(valign)
	draw_set_color(color)
	draw_set_alpha(alpha)
}

function optomizedHorizontalCol(){
	if !on_ground or hspeed != 0 or vspeed < 0{
		if place_meeting(x, y+vspeed, obj_block){
			var vs = sign(vspeed)
			while(!place_meeting(x, y+vs, obj_block)){
				y+=vs	
			}
			vspeed = 0
			if vs > 0{
				on_ground = true	
			}
		}
	}
}

function optomizedVerticalCol(){
	if hspeed != 0{
		if place_meeting(x+hspeed, y+vspeed, obj_block){
			var hs = sign(hspeed)
			while(!place_meeting(x+hs, y+vspeed, obj_block)){
				x += hs
			}
			hspeed = 0
		}
	}
}

function performOptomizedCol(){
	optomizedHorizontalCol()
	optomizedVerticalCol()
}

function getUserObj(username){
	var playerObj = obj_main.userToObj[? username]
	if is_undefined(playerObj){
		var element = getUserElement(username)
		playerObj = createPlayer(960, 540, element, username)
		with(playerObj){
			chatterRep = true	
		}
		obj_main.userToObj[? username] = playerObj
	}
	return playerObj
}

function getUserElement(username){
	var element = obj_main.userToElement[? username]
	if is_undefined(element){
		element = getRandomElement()
		if irandom(1000) == 0{
			element = Element.ai	
		}
		if irandom(5000) == 0{
			element = Element.time	
		}
		obj_main.userToElement[? username] = element
	}	
	return element
}

function getCharMods(username){
	var data = obj_main.userToCharModifiers[? username]
	if is_undefined(data){
		//     [Size, Squish, R, G, B]
		data = [1, 1, -1]
		obj_main.userToCharModifiers[? username] = data
	}	
	return data
}

function updateCharMod(username, slot, value){
	var data = getCharMods(username)
	data[slot] = value
}

function getUserMouse(username){
	var mouseObj = obj_main.userToMouse[? username]
	if is_undefined(mouseObj){
		mouseObj = instance_create_layer(0, 0, getLayer(0), obj_mouse)
		mouseObj.username = username
		obj_main.userToMouse[? username] = mouseObj
	}
	return mouseObj
}

function checkDirectory(direct){
	if !directory_exists(direct)
		directory_create(direct)
}

function array2Dfill(width, height, fillValue){
	var array2;
	for (var i = width-1; i >= 0; i--) {
	  for (var j = height-1; j >= 0; j--) {
	    array2[i, j] = fillValue;
	  }
	}
return array2;	
}


function stringSplit(delimiter, str) {
	/// @description Splits a string on delimiter given
	/// @param delimiter - What is seperating the string
	/// @param str - String to split

	var sub_str = ""
	var array = undefined
	var at = 0

	for(var i = 1; i < string_length(str)+1; i++){
		var next_char = string_char_at(str, i)
		if next_char != delimiter{
				sub_str = sub_str + next_char
		}else{
				if(sub_str != "") array[at++] = sub_str
				sub_str = ""
		}
	}
	if(sub_str != "") array[at++] = sub_str
	return array
}

function posInRegion(X, Y, X1, Y1, X2, Y2){
	return X1 <= X and X < X2 and Y1 <= Y and Y < Y2	
}

function getElementColor(element){
	var color = c_white
	switch(element){
	case Element.fire: color = merge_color(c_red, c_white, 0.25) break
	case Element.earth: color = merge_color(c_orange, c_white, 0.25) break
	case Element.metal: color = c_ltgray break
	case Element.storm: color = c_yellow break
	case Element.nature: color = c_lime break
	case Element.water: color = c_aqua break
	case Element.ice: color = merge_color(c_aqua, c_white, 0.25) break
	case Element.light: color = merge_color(c_white, c_yellow, 0.25) break
	case Element.shadow: color = merge_color(c_purple, c_white, 0.25) break
	}
	return color
}

function wrapString(str, width){
	while(string_width(str) > width){
		var lastSpace = -1
		for(var i = 1; i <= string_length(str); i++){
			if string_width(string_copy(str, 1, i)) > width{
				break	
			}
			if string_char_at(str, i) == " "{
				lastSpace = i
			}
		}
		if lastSpace = -1{
			str = "<Message Too Long>"
			break
		}else{
			str = string_copy(str, 1, lastSpace-1) + "\n" + string_copy(str, lastSpace+1, 10000000)
		}
	}
	return str
}