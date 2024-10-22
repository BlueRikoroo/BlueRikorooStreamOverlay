randomize()
grav = 0.2
accel = 0.2
maxSpeed = 3
jumpForce = 3
frict = 0.05

decision = Movement.idle

on_ground = false

anim_current = Anim.idle

anim_idle = spr_player_neutral_idle
anim_idleRandom = spr_player_neutral_idleRandom
anim_run = spr_player_neutral_run
anim_flyType = AnimFly.directionalEyes
anim_fly = spr_player_neutral_fly
anim_flyEyes = spr_player_neutral_eyes

anim_frame = 0
anim_idle_speed = 0.1
anim_idle_max = 8
anim_idleRandom_speed = 0.1
anim_idleRandom_max = 15
anim_run_speed = 0.15
anim_run_max = 18
anim_fly_speed = 0.1
anim_fly_max = 6

facing = Facing.right

isKing = false
nameObj = noone
nameHeight = 0    // Where it is currently
nameHeightTo = 0  // Where it is going to
username = ""
cheerAmount = 0

size = 1
squish = 1
shiney = -1

leaving = false
chatterRep = false  // Represents a chatter

element = Element.neutral
// Controlling Stuff
controlTimer = 0
controlGoto = 0

damaged = false
damageTimer = 0
alpha = 1

enum Anim{
	idle,
	idleRandom,
	run,
	fly,
}
enum AnimFly{
	directional,
	directionalEyes,
	animation,
	gradual,
	rotate,
}
enum Movement{
	idle,
	right,
	left,
	rightHurry,
	leftHurry,
}
enum Facing{
	left = -1,
	right = 1,
}