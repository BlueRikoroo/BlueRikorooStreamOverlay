if chatterRep{
	with(obj_main){
		ds_map_delete(userToObj, other.username)
	}
}
instance_destroy(nameObj)