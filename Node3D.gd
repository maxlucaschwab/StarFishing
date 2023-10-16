extends Node3D

var transition = false
var winCondition = false
var openAnimation = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	winCondition == false
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_mouse_button_pressed(1):
	#	$cameraAnim.play("fishing_transition")
	mainGameplay()
	if transition == true: #and openAnimation == true:
		$Camera3D.position += Vector3(0, -0.01, 0)
		$hook.position += Vector3(0, -0.005, 0)
	pass
	
	if Input.is_action_just_pressed("pause") and winCondition == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$"../menu".show()
		get_tree().paused = true
		#get_tree().quit()
	
	if $hook.index == 4: #win condition, fix later
		openAnimation = true
		transition = false
		winCondition = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$"../menu".show()
		$"../menu/Resume".hide()
		$"../menu/Label".hide()
		$"../tutorial/direction".text = "You Win!"
		


func mainGameplay():
	if Input.is_action_just_pressed("cast") and transition == false and openAnimation == false:
		
		$Camera3D/cameraAnim.play("fishing_transition")
		$hook/hookAnim.play("hook_throw")
		
		$"../tutorial/caption".hide()
		$"../tutorial/direction".text = "use MOUSE to move!"
		await get_tree().create_timer(2).timeout
		$"../tutorial/direction".hide()
		
		transition = true
		#openAnimation = true
		_on_camera_anim_animation_finished("fishing_transition")
	pass


func _on_camera_anim_animation_finished(anim_name):
	print("test")
	pass # Replace with function body.
	
#func _unhandled_input(event):
	
	

