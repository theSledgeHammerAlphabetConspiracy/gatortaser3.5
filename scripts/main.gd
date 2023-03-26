extends Node2D

var lazy = preload('res://objects/lazygator.tscn')

var new_time: float = 0

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
	#print($spawnsystem/Timer.get_time_left())



func _on_Timer_timeout():
	#print($spawnsystem/spawner.get_global_position())
	var spawn = lazy.instance()
	spawn.set_global_position($spawnsystem/spawner.get_global_position())
	spawn.speed = rand_range(.6,1.2)
	get_parent().add_child(spawn)
	
	randomize()
	#new_time = randf()
	new_time = rand_range(.25,1.15)#1.15)
	#new_time = rand_range(25,115)
	#print(new_time)
	$spawnsystem/Timer.set_wait_time(new_time)
	$spawnsystem/Timer.start()
	#print($spawnsystem/Timer.get_time_left())
