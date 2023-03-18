extends Area2D

var target:Vector2= Vector2(0,0)
var user
var distance = 12
var num = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	#print(get_global_position())
	#pass
	look_at(target)


func _physics_process(delta):
	move_local_x(20)
	distance -= 1
	if distance <= 0:
		print(user.get_global_position().distance_to(get_global_position()))
		queue_free()
		
	
	

#
#func _on_Node2D_body_entered(body):
#	if not body.owner.is_in_group('enemy'):
#		return
#	else:
#		user.attach(body.owner,num)
#		queue_free()


func _on_Node2D_area_entered(area):
	if not area.owner.is_in_group('enemy'):
		return
	else:
		user.attach(area.owner,num)
		queue_free()
