// Inherit the parent event
event_inherited();

gotoPos = x
centerPos = gotoPos

image_xscale = 2
image_yscale = 2

charging = false
chargingTimer = 0

HP_max = 150
HP = HP_max

frameOffset = random(1000)

var obj = instance_create_layer(x, y, layer, obj_enemy_boss1ArmLeft)
obj.mainBoss = id
var obj = instance_create_layer(x, y, layer, obj_enemy_boss1ArmRight)
obj.mainBoss = id