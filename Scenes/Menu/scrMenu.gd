extends Control

var _cursor = preload("res://Objects/Cursor/oCursor.tscn")
func _ready():
	GameManager.globals.lock_mouse = true
	GameManager.cycle = 0
	GameManager.brokas = 0
	GameManager.info.secs = 0
	GameManager.info.mins = 0
	GameManager.info.enemies = 0
	AudioServer.set_bus_mute(0, false)
	
	var cursor_instance = _cursor.instance()
	cursor_instance.cursor = cursor_instance.cursors.DEFAULT
	call_deferred("add_child",cursor_instance)

func exit_game():
	get_tree().quit()
func start_game():
	SceneChanger.change_scene("res://Scenes/Intro/scnIntro.tscn", true)

func _on_TouchScreenButton3_released(): # PLAY
	get_node("oCursor").queue_free()
	#$musMenu.stop()
	
	$menuAnm.play("anmPlay")
func _on_TouchScreenButton2_released(): # CREDITS
	$sfxClick.play()
	
	$menuAnm.play("anmCredits")
func _on_TouchScreenButton_released(): # EXIT
	$sfxClick.play()
	get_node("oCursor").queue_free()
	
	$menuAnm.play("anmExit")

func _on_TouchScreenButtonC_released():
	$sfxClick.play()
	
	$menuAnm.play_backwards("anmCredits")
