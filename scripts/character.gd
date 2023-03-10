extends KinematicBody2D


const SPEED: float = 4.0 #1.024 reso / new reso of 256 = 4
const JUMP_VELOCITY = -400.0

var tazertarget: Array = []
var POTtazertarget: Array = []

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	for i in tazertarget.size():
		#cool lazer code
		tazertarget[i].set_modulate(Color(1,0,0,1))
		tazertarget[i].life -= 1
	
	
	var velocity = Vector2(0,0)

	var direction = Vector2(Input.get_axis("ui_left", "ui_right"),Input.get_axis("ui_up", "ui_down"))
	#var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2(1,0) * .4
		#velocity.x = move_toward(velocity.x, 0.0, (SPEED*.01)*delta)
		#velocity.y = move_toward(velocity.y, 0.0, (SPEED*.01)*delta)
	#print(velocity)
	var col = move_and_collide(velocity)
	if col:
		if col.get_collider().is_in_group("enemy"):
			die()

	if Input.is_action_just_pressed("shoot"):
		if POTtazertarget.size() > 0:
		#print(POTtazertarget)
			if tazertarget.size() == 0:
				#####this is the projectile script
				tazertarget.append(POTtazertarget[0])
				POTtazertarget.erase(POTtazertarget[0])
			elif tazertarget.size() == 1:
				tazertarget.append(POTtazertarget[0]) 
				POTtazertarget.erase(POTtazertarget[0])
		#if $lockOn.get_overlapping_bodies().size() >= 1:
			#tazertarget.append($lockOn.get_overlapping_bodies()[])
			#print($lockOn.get_overlapping_bodies())

			
func die():
	#print("dead")
	queue_free()


func _on_lockOn_body_entered(body):
	print(body)
	POTtazertarget.push_front(body)


func _on_lockOn_body_exited(body):
	POTtazertarget.erase(body)
	if body in tazertarget:
		tazertarget.erase(body)
		body.set_modulate(Color(1,1,1,1))
