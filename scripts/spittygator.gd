extends StaticBody2D

var spit = preload('res://objects/spit.tscn')

var inplay: bool = false

var life: int = 90
var speed: float = 1.2
export var SM: float = -1.0

var shockon: bool = false
#onready var player = get_node('/root/main/player')

var touch = true

var attacking = false
var attackpos = Vector2(0,0)

var new_time: float = 0

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#move_local_x(speed*SM)
	if position.x > 900:
		#set_rotation(0)
		move_local_x(-1.2)



func shock():
	#print(life)
	life -= 1
	if shockon == false:
		shockon = true
		$AnimationPlayer.play("shockOn")
	#playshockedanim
#	if life <= 0:
#		die()
#

func die():
	#player.
	queue_free()


func _on_VisibilityNotifier2D_screen_entered():
	inplay = true


func _on_VisibilityNotifier2D_screen_exited():
	if inplay == true:
		#print('dead')
		queue_free()


func _on_TouchScreenButton_pressed():
	get_node('/root/main/player').touchattack(self)


func attack(target):# might turn off when getin shocked
	if shockon == false:
		$AnimationPlayer.play("attack")
		#print(target.get_name())
		var spawn = spit.instance()
		spawn.set_global_position(get_global_position())
		spawn.look_at(target.get_global_position())
		#spawn.speed = rand_range(.6,1.2)
		get_parent().add_child(spawn)
		randomize()
		#new_time = rand_range(.25,1.15)#1.15)
	#	new_time = rand_range(3,10)
	#	$Timer.set_wait_time(new_time)
	#	$Timer.start()


func _on_Timer_timeout():
	if get_parent().get_node("main/player"):
		attack(get_parent().get_node("main/player"))
		new_time = rand_range(3,10)
		$Timer.set_wait_time(new_time)
		$Timer.start()
