function createPlayer(X, Y, element, Name){
	var obj = instance_create_layer(X, Y, getLayer(Layer.player),obj_player)
	obj.username = Name
	switch(element){
	case Element.fire:
		break
	case Element.earth:
		break
	case Element.metal:
		break
	case Element.storm:
		break
	case Element.nature:
		break
	case Element.water:
		break
	case Element.ice:
		break
	case Element.light:
		break
	case Element.shadow:
		break
	case Element.ai:
		break
	case Element.time:
		break
	}
}