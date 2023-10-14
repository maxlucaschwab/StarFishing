extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_resume_button_down():
	await get_tree().create_timer(.1).timeout
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	self.hide()
	pass # Replace with function body.
	

func _on_quit_button_down():
	await get_tree().create_timer(.1).timeout
	get_tree().quit()
	pass # Replace with function body.
	

func _on_restart_button_down():
	await get_tree().create_timer(.1).timeout
	get_tree().reload_current_scene()
	get_tree().paused = false
	pass # Replace with function body.
