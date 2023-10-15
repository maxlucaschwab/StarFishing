extends Area3D

var entered = false

var index = 0
var constellation = {0:[-23, 19, -17], 1:[-8, 11, -26], 2:[8, 21, -26]}

var starPos 

# Called when the node enters the scene tree for the first time.
func _ready():
	#$hookAnim.play("hook_bob")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseMotion and $"..".transition == true:
		translate_object_local(Vector3(event.relative.x/5, -event.relative.y/5, 0).normalized())



func _on_area_entered(area):
	print("hello")
	if area.has_method("hooked"):
		
		$"..".transition = false
		#$"..".openAnimation = false
		
		create_tween().tween_property(self, "position", $"../empty_1".position, 2)
		
		create_tween().tween_property($"../Camera3D", "position", $"../empty_0".position, 2)
		create_tween().tween_property($"../Camera3D", "rotation", $"../empty_0".rotation, 2)
		
		create_tween().tween_property(area, "position", $"../empty_1".position, 2)
		
		await get_tree().create_timer(2).timeout
		#$hookAnim.play("hook_bob")
		starPos = Vector3(constellation[index][0], constellation[index][1], constellation[index][2])
		create_tween().tween_property(area, "position", starPos, 2)
		index += 1
