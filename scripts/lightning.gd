extends RayCast2D


onready var line = $Line2D
onready var end = $end

var max_distance = 15000


var distance: float = 0.0

var col_point:Vector2= Vector2(0,0)
var on: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	cast_to = Vector2(max_distance,0)


func _physics_process(delta):
	#if is_colliding():
	if on == true:
		line.show()
		#end.show()
		#var col_point = to_local(get_collision_point())
		line.points[1].x = distance
		#end.position = col_point
	else:
		end.hide()
		line.hide()
	
	
