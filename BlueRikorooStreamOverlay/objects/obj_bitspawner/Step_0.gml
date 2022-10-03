if instance_exists(objFollow){
	origin = [objFollow.x, objFollow.y-15]	
}

if money > 0{
	timer++
	if timer > 15{
		timer = 0
		var spr = spr_m_coin1
		var value = 1
		if money > 10000{
			spr = spr_m_coin9
			value = 10000
		}else if money > 3000{
			spr = spr_m_coin8
			value = 3000
		}else if money > 1000{
			spr = spr_m_coin7	
			value = 1000
		}else if money > 300{
			spr = spr_m_coin6	
			value = 300
		}else if money > 100{
			spr = spr_m_coin5	
			value = 100
		}else if money > 30{
			spr = spr_m_coin4	
			value = 30
		}else if money > 10{
			spr = spr_m_coin3	
			value = 10
		}else if money > 3{
			spr = spr_m_coin2	
			value = 3
		}
		money -= value
		CreateBitTraveler(origin, dest, spr)
	}
}else{
	instance_destroy()	
}