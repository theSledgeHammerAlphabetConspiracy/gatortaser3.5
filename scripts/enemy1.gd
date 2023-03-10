extends StaticBody2D

var inplay: bool = false

var life: int = 40
var speed: float = 1.2

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_local_x(speed*-1)
	if life <= 0:
		die()


func _on_visible_on_screen_notifier_2d_screen_entered():
	inplay = true


func _on_visible_on_screen_notifier_2d_screen_exited():
	if inplay == true:
		#print('dead')
		queue_free()

func die():
	queue_free()