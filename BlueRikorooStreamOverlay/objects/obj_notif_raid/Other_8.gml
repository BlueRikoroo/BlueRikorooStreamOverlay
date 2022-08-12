portalActive = true
playerSpawnDelay = 60
audio_play_sfx(snd_neutral_ult_metal_activate, 0, false, 1, 0.8)
audio_stop_sound(looping_sound)
looping_sound = audio_play_sfx(snd_neutral_ult_light_loop, 0, true, 1, 0.6)