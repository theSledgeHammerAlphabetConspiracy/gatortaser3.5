extends StaticBody2D


func _physics_process(delta):
	move_local_x(2.7)



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
