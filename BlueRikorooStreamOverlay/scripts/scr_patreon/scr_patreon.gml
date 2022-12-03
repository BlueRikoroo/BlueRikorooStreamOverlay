function spawnPatreon(username, base, asthetics, offset, nameOffset=0){
	var obj = instance_create_layer(1826 - offset, 2116, getLayer(Layer.player), obj_patreonMarcher)
	obj.username = username
	obj.sprite_index = base
	obj.asthetics = asthetics
	obj.astheticAmount = array_length(asthetics)
	obj.nameOffset = nameOffset
}

function pmGetBase(name){
	switch(name){
	case "Blue": return spr_pm_base_default
	case "Magenta": return spr_pm_base_magenta
	case "Purple": return spr_pm_base_purple
	case "Red": return spr_pm_base_red
	case "Orange": return spr_pm_base_orange
	case "Yellow": return spr_pm_base_yellow
	case "Lime": return spr_pm_base_lime
	case "Green": return spr_pm_base_green
	case "Teal": return spr_pm_base_teal
	case "Gray": return spr_pm_base_gray
	case "Original Rikkor": return spr_pm_base_rikkor
	case "Poly Nugget": return spr_pm_base_polyNugget
	case "WileyPansexualRoo": return spr_pm_base_wileyPansexualRoo
	}
}

function pmGetAsthetics(name){
	switch(name){
	case "Bone Staff": return spr_pm_aesth_rikkorBoneStaff
	case "Bone Helmet": return spr_pm_aesth_rikkorBoneHelmet
	case "Halloween Pumpkin Bucket": return spr_pm_aesth_halloweenPumkinBucket
	case "Spooky Skull Helmet": return spr_pm_aesth_skullHelmet
	case "Witches Broom": return spr_pm_aesth_witchBroom
	case "Pilgrim Hat": return spr_pm_aesth_pilgrimHat
	case "Wiley Pie": return spr_pm_aesth_wileyPie
	case "WileyPCOH": return spr_pm_aesth_wileyPCOH
	}
}