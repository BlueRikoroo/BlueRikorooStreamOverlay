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
function draw_text_setup(font, halign, valign, color=c_black, alpha=1){
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