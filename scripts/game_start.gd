extends Node2D

const INITIAL_SCENE = "res://scenes/forest.tscn"

func _on_button_pressed():
	# Muda para a cena inicial do jogo
	get_tree().change_scene_to_file(INITIAL_SCENE)
