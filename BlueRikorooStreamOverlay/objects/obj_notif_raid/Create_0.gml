username = ""
raidAmount = 0
raidAmountCurrent = 0

gui_xpos = 1400
gui_ypos = 180
subImg = 0

timer = 0  // Controls Notification Appearance
portalActive = false
deathTimer = 0

looping_sound = noone

part_system = part_system_create()
part_emitter_main = part_emitter_create(part_system)
part_emitter_portal = part_emitter_create(part_system)