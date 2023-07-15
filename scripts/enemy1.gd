extends StaticBody2D

var inplay: bool = false

var life: int = 90
var speed: float = 1.2
export var SM: float = -1.0

var shockon: bool = false
#onready var player = get_node('/root/main/player')

var touch = true

var attacking = false
var attackpos = Vector2(0,0)

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#move_local_x(speed*SM)
	if $AnimationPlayer.get_current_animation() != "attack":
		#set_rotation(0)
		move_local_x(speed*SM)
	else:
		move_local_x(attackpos.x*SM)
		move_local_y(attackpos.y*SM)
		#move_local_x((attackpos.x-get_global_position().x)*.1)
		#move_local_y((attackpos.x-get_global_position().x)*.1)
#	elif attacking == true:
#		print(get_node("/root/main/player").get_global_position())


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
	Score.score += 1
	print(Score.score)
	queue_free()


func _on_VisibilityNotifier2D_screen_entered():
	inplay = true


func _on_VisibilityNotifier2D_screen_exited():
	if inplay == true:
		#print('dead')
		queue_free()


func _on_TouchScreenButton_pressed():
	get_node('/root/main/player').touchattack(self)


func attack(target):
	#print(look_at(target.get_global_position()))
	#print("D")
	attackpos = Vector2(target.get_global_position()-get_global_position()).normalized()
	#print(attackpos)
	$AnimationPlayer.play("attack")
	


