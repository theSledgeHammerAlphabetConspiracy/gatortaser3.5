extends StaticBody2D

var inplay: bool = false

var life: int = 90
var speed: float = 1.2

var shockon: bool = false
onready var player = get_node('/root/main/player')

var touch = true

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_local_x(speed*-1)
	#if life <= 0:
		#die()


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
