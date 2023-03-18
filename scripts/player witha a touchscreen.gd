extends KinematicBody2D


const SPEED: float = 4.0 #1.024 reso / new reso of 256 = 4
const JUMP_VELOCITY = -400.0

var tazertarget: Array = []
var POTtazertarget: Array = []

var proj1 = preload('res://tazerproj.tscn')


var target1 = null
var target2 = null

func _physics_process(delta):
#	print(tazertarget)
#	if tazertarget.size() > 0:
#
#		for i in tazertarget.size():
#			if tazertarget[i].life >= 1:
#				#cool lazer code
#				tazertarget[i].shock()
#			else:
#				tazertarget[i].die()
#				tazertarget.remove(i)
	if target1 != null:
		if target1.life >= 1:
				#cool lazer code
			target1.shock()
		else:
			target1.die()
			target1 = null
	if target2 != null:
		if target2.life >= 1:
				#cool lazer code
			target2.shock()
		else:
			target2.die()
			target2 = null


	var velocity = Vector2(0,0)
	
	var direction = Vector2(Input.get_axis("ui_left", "ui_right"),Input.get_axis("ui_up", "ui_down"))
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2(1,0) * .4
	
	var col = move_and_collide(velocity)
	if col:
		if col.get_collider().is_in_group("enemy"):
			die()
	
#	if Input.is_action_just_pressed("shoot"):
#		shmupbutton()
#
func touchattack(touchtarget):
	if target1==null:
		shoottaser(touchtarget,1)
	elif target2 == null:
		shoottaser(touchtarget,2)
func shoottaser(target,num):
	var tazerproj = proj1.instance()
	tazerproj.num = num
	tazerproj.target = target.get_global_position()
	#tazerproj.look_at(target.get_global_position())
	tazerproj.user = self
	tazerproj.set_global_position(get_global_position())
	#tazerproj.speed = rand_range(1.2,2.4)
	get_parent().add_child(tazerproj)
	#print('character'+str(get_global_position()))


func attach(body,num):
	if num == 1:
		target1 = body
	elif num == 2:
		target2 = body
	#tazertarget.append(body)
	#POTtazertarget.erase(body)
	
	
func die():
	queue_free()
	
	
#func _on_lockOn_body_entered(body):
#	POTtazertarget.push_front(body)
#
#
#func _on_lockOn_body_exited(body):
#	POTtazertarget.erase(body)
#	if body in tazertarget:
#		tazertarget.erase(body)
#
#		body.set_modulate(Color(1,1,1,1))
#		body.get_node('AnimationPlayer').play('shockOff')
#		body.shockon = false
		
#
#
#func shmupbutton():
#	if POTtazertarget.size() > 0:
#		#print(POTtazertarget)
#		if tazertarget.size() == 0:
#			#####this is the projectile script
#			tazertarget.append(POTtazertarget[0])
#			POTtazertarget.erase(POTtazertarget[0])
#		elif tazertarget.size() == 1:
#			tazertarget.append(POTtazertarget[0]) 
#			POTtazertarget.erase(POTtazertarget[0])
#	#if $lockOn.get_overlapping_bodies().size() >= 1:
#		#tazertarget.append($lockOn.get_overlapping_bodies()[])
#		#print($lockOn.get_overlapping_bodies())
		
