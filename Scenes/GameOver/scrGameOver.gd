extends Node2D

export var continue_to = "res://Scenes/Main/scnMain.tscn"

func _on_btnContinue_released():
	SceneChanger.change_scene(continue_to)
	GameManager.cycle = 0
