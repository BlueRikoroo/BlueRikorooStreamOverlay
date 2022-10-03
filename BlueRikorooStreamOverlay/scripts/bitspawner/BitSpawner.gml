function CreateBitSpawner(spawnFromObj, endPoint, money){
	var sp = [0, 0]
	if is_array(spawnFromObj){
		sp = spawnFromObj
	}else{
		sp = [spawnFromObj.x, spawnFromObj.y-15]
	}
	var obj = instance_create_layer(sp[0], sp[1], getLayer(-10), obj_bitSpawner)
	obj.money = money
	obj.objFollow = spawnFromObj
	obj.origin = sp
	obj.dest = endPoint
}

function CreateBitTraveler(startPoint, endPoint, spr){
	var obj = instance_create_layer(startPoint[0], startPoint[1]+10, getLayer(-10), obj_bitTravler)
	obj.spr = spr
	obj.dest = endPoint
}