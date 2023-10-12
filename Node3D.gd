extends Node3D

var transition = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_mouse_button_pressed(1):
	#	$cameraAnim.play("fishing_transition")
	mainGameplay()
	if transition == true:
		$Camera3D.position += Vector3(0, -0.01, 0)
	pass
	
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()


func mainGameplay():
	if Input.is_mouse_button_pressed(1) and transition == false:
		$Camera3D/cameraAnim.play("fishing_transition")
		$hook/hookAnim.play("hook_throw")
		transition = true
		_on_camera_anim_animation_finished("fishing_transition")
	pass


func _on_camera_anim_animation_finished(anim_name):
	print("test")
	pass # Replace with function body.
