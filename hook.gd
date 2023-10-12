extends StaticBody3D

var starIncrement = 0
var constellation = {0:[], 1:[], 2:[]}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseMotion:
		translate_object_local(Vector3(event.relative.x/3, -event.relative.y/3, 0).normalized())


func _on_star_body_entered(body):
	body.position = Vector3(-45, 17, 23.025)
	pass # Replace with function body.
