extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$score.set_text(str(Score.score)) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	Score.score = 0
	get_tree().change_scene("res://main.tscn")
	#get_tree().reload_current_scene()

