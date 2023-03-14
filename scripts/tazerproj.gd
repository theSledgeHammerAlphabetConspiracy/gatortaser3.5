extends Area2D

var target:Vector2= Vector2(0,0)
var user

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(get_global_position())
	#pass
	look_at(target)


func _physics_process(delta):
	move_local_x(20)
	
	
	


func _on_Node2D_body_entered(body):
	if not body.is_in_group('enemy'):
		return
	else:
		user.attach(body)
		queue_free()
