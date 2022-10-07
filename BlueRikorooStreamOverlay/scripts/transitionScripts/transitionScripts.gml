function create_transition(transType){
	with(instance_create_layer(0, 0, getLayer(0), obj_transitioner))
	{
		switch(transType){
		case TransitionType.SwipeLeft:
			draw_transition = draw_transition_swipeLeft break
		case TransitionType.SwipeRight:
			draw_transition = draw_transition_swipeRight break
		case TransitionType.SwipeLeftQuick:
			draw_transition = draw_transition_swipeLeftQuick break
		case TransitionType.SwipeRightQuick:
			draw_transition = draw_transition_swipeRightQuick break
		}
	}
}

function draw_transition_swipeLeft(){
	if timer == 0{
		audio_play_sfx(sfx_kunai_hit_wall)
	}else if timer == 90{
		audio_play_sfx(sfx_kunai_hit_body)	
	}
	if timer <= 30{
		var pos = 1920 - timer * 70
		var h = global.time*5 mod 255
		draw_set_color(make_color_hsv(h, 200, 150))
		draw_primitive_shape([pos+100, 0], [pos+200, 0], [pos, 1080], [pos+100, 1080])	
		draw_set_color(make_color_hsv(h, 100, 255))
		draw_primitive_shape([pos+200, 0], [pos+300, 0], [pos+100, 1080], [pos+200, 1080])	
	}else if timer <= 90{
		obj_main.transitionHoldOverlay = false
		if obj_main.transitionOverlay != noone{
			with(obj_main){
				load_overlay(transitionOverlay)	
				transitionOverlay = noone
			}
		}
		if timer mod 5 == 0{
			var pos = 1920 - (timer - 30) * 35
			draw_set_color(make_color_hsv(irandom(255), 215, 175))
			var size = 30 + random(100)
			draw_circle(pos, 100 + random(880), size, false)
			audio_play_sfx(sfx_waterBubble, 0, 0, size/65)
		}
	}else if timer <= 120{
		var pos = 1920 - (timer-90) * 70
		var h = global.time*5 mod 255		
		draw_set_color(make_color_hsv(h, 100, 255))
		draw_primitive_shape([pos+100, 0], [pos+200, 0], [pos, 1080], [pos+100, 1080])	
		gpu_set_blendmode(bm_subtract)
		draw_set_color(c_white)
		draw_primitive_shape([pos+200, 0], [pos+300, 0], [pos+100, 1080], [pos+200, 1080])	
		gpu_set_blendmode(bm_normal)
	}else{
		done = true
	}
}

function draw_transition_swipeRight(){
	if timer == 0{
		audio_play_sfx(sfx_kunai_hit_wall)
	}else if timer == 90{
		audio_play_sfx(sfx_kunai_hit_body)	
	}
	if timer <= 30{
		var pos = timer * 70
		var h = global.time*5 mod 255
		draw_set_color(make_color_hsv(h, 200, 150))
		draw_primitive_shape([pos-100, 0], [pos-200, 0], [pos, 1080], [pos-100, 1080])	
		draw_set_color(make_color_hsv(h, 100, 255))
		draw_primitive_shape([pos-200, 0], [pos-300, 0], [pos-100, 1080], [pos-200, 1080])	
	}else if timer <= 90{
		obj_main.transitionHoldOverlay = false
		if obj_main.transitionOverlay != noone{
			with(obj_main){
				load_overlay(transitionOverlay)	
				transitionOverlay = noone
			}
		}
		if timer mod 5 == 0{
			var pos = (timer - 30) * 35
			draw_set_color(make_color_hsv(irandom(255), 215, 175))
			var size = 30 + random(100)
			draw_circle(pos, 100 + random(880), size, false)
			audio_play_sfx(sfx_waterBubble, 0, 0, size/65)
		}
	}else if timer <= 120{
		var pos = (timer-90) * 70
		var h = global.time*5 mod 255		
		draw_set_color(make_color_hsv(h, 100, 255))
		draw_primitive_shape([pos-100, 0], [pos-200, 0], [pos, 1080], [pos-100, 1080])	
		gpu_set_blendmode(bm_subtract)
		draw_set_color(c_white)
		draw_primitive_shape([pos-200, 0], [pos-300, 0], [pos-100, 1080], [pos-200, 1080])	
		gpu_set_blendmode(bm_normal)
	}else{
		done = true
	}
}

function draw_transition_swipeLeftQuick(){
	if timer == 0{
		audio_play_sfx(sfx_kunai_hit_wall)
	}else if timer == 30{
		audio_play_sfx(sfx_kunai_hit_body)	
	}
	if timer <= 30{
		var pos = 1920 - timer * 70
		var h = global.time*5 mod 255
		draw_set_color(make_color_hsv(h, 200, 150))
		draw_primitive_shape([pos+100, 0], [pos+200, 0], [pos, 1080], [pos+100, 1080])	
		draw_set_color(make_color_hsv(h, 100, 255))
		draw_primitive_shape([pos+200, 0], [pos+300, 0], [pos+100, 1080], [pos+200, 1080])	
	}else if timer <= 60{
		obj_main.transitionHoldOverlay = false
		if obj_main.transitionOverlay != noone{
			with(obj_main){
				load_overlay(transitionOverlay)	
				transitionOverlay = noone
			}
		}
		var pos = 1920 - (timer-30) * 70
		var h = global.time*5 mod 255		
		draw_set_color(make_color_hsv(h, 100, 255))
		draw_primitive_shape([pos+100, 0], [pos+200, 0], [pos, 1080], [pos+100, 1080])	
		gpu_set_blendmode(bm_subtract)
		draw_set_color(c_white)
		draw_primitive_shape([pos+200, 0], [pos+300, 0], [pos+100, 1080], [pos+200, 1080])	
		gpu_set_blendmode(bm_normal)
	}else{
		done = true
	}
}

function draw_transition_swipeRightQuick(){
	if timer == 0{
		audio_play_sfx(sfx_kunai_hit_wall)
	}else if timer == 30{
		audio_play_sfx(sfx_kunai_hit_body)	
	}
	if timer <= 30{
		var pos = timer * 70
		var h = global.time*5 mod 255
		draw_set_color(make_color_hsv(h, 200, 150))
		draw_primitive_shape([pos-100, 0], [pos-200, 0], [pos, 1080], [pos-100, 1080])	
		draw_set_color(make_color_hsv(h, 100, 255))
		draw_primitive_shape([pos-200, 0], [pos-300, 0], [pos-100, 1080], [pos-200, 1080])	
	}else if timer <= 60{
		obj_main.transitionHoldOverlay = false
		if obj_main.transitionOverlay != noone{
			with(obj_main){
				load_overlay(transitionOverlay)	
				transitionOverlay = noone
			}
		}
		var pos = (timer-30) * 70
		var h = global.time*5 mod 255		
		draw_set_color(make_color_hsv(h, 100, 255))
		draw_primitive_shape([pos-100, 0], [pos-200, 0], [pos, 1080], [pos-100, 1080])	
		gpu_set_blendmode(bm_subtract)
		draw_set_color(c_white)
		draw_primitive_shape([pos-200, 0], [pos-300, 0], [pos-100, 1080], [pos-200, 1080])	
		gpu_set_blendmode(bm_normal)
	}else{
		done = true
	}
}