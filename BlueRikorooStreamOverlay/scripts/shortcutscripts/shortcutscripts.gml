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