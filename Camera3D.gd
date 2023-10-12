extends Camera3D

var transition = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_mouse_button_pressed(1):
	#	$cameraAnim.play("fishing_transition")
	mainGameplay()
	if transition == true:
		self.position += Vector3(0, -0.01, 0)
	pass


func mainGameplay():
	if Input.is_mouse_button_pressed(1) and transition == false:
		$cameraAnim.play("fishing_transition")
		$"../hook/hookAnim".play("hook_throw")
		transition = true
		_on_camera_anim_animation_finished("fishing_transition")
	pass


func _on_camera_anim_animation_finished(anim_name):
	print("test")
	pass # Replace with function body.
