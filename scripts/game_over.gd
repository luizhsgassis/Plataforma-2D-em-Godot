extends Node2D

const INITIAL_SCENE = "res://scenes/forest.tscn"

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file(INITIAL_SCENE)
