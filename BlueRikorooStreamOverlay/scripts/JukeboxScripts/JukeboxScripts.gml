function jukeSwitch(newAudio, gain=jukeVolume){
	if jukeCurrent != noone{
		var temp = audio_play_sound(asset_get_index(audio_get_name(jukeCurrent)), 1, false, 
		  audio_sound_get_gain(jukeCurrent), 
		  audio_sound_get_track_position(jukeCurrent))
		audio_stop_sound(jukeCurrent)
		audio_sound_gain(temp, 0, 2500)
	}
	if newAudio != noone{
		jukeCurrent = audio_play_sfx(newAudio, 0, true, 1, gain)
		jukeCredit = GetCredit(newAudio)
		jukeTimer = 60*5
	}else{
		jukeCurrent = noone
	}
}

function jukeHotkeyAdd(str){
	if jukeKeyOnlyOne{
		jukeKeyOnlyOne = false	
		hotKeyJukeKey += str
	}
}