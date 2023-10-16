extends Area3D

var entered = false

var index = 0
var constellation = {0:[-23, 19, -17], 1:[-0.5, 16, -30], 2:[5, 12, -36], 3:[7, 10, -43]}

var starPos 

var tutorialText = "PRESS LMB TO CAST"
# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = $"../empty_1".position
	#$hookAnim.play("hook_bob")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var boatNode = get_node("../boat")
	#var hookPos = boatNode.position + $"../empty_1".position
	if $"..".transition == false:
		self.position = boatNode.position + $"../empty_1".position
	pass

func _input(event):
	if event is InputEventMouseMotion and $"..".transition == true:
		translate_object_local(Vector3(event.relative.x/10, -event.relative.y/10, 0).normalized())



func _on_area_entered(area):
	print("hello")
	if area.has_method("hooked"):
		
		#$"..".openAnimation = false
		#.disabled = true
		create_tween().tween_property(self, "position", $"../empty_1".position, 2)
		
		create_tween().tween_property($"../Camera3D", "position", $"../empty_0".position, 2)
		create_tween().tween_property($"../Camera3D", "rotation", $"../empty_0".rotation, 2)
		create_tween().tween_property($"../Camera3D", "fov", 75, 2)
		
		create_tween().tween_property(area, "position", $"../empty_1".position, 2)
		
		await get_tree().create_timer(2).timeout
		#$hookAnim.play("hook_bob")
		starPos = Vector3(constellation[index][0], constellation[index][1], constellation[index][2])
		create_tween().tween_property(area, "position", starPos, 2)
		
		index += 1
		
		$"..".transition = false
		
		if $"..".winCondition == false:
			$"../../tutorial/direction".text = tutorialText
			$"../../tutorial/direction".show()
	
	if area.has_method("wall"):
		create_tween().tween_property(self, "position", $"../empty_1".position, 2)
		
		create_tween().tween_property($"../Camera3D", "position", $"../empty_0".position, 2)
		create_tween().tween_property($"../Camera3D", "rotation", $"../empty_0".rotation, 2)
		create_tween().tween_property($"../Camera3D", "fov", 75, 2)
		
		await get_tree().create_timer(2).timeout
		$"..".transition = false
