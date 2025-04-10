extends Node2D

@onready var player: CharacterBody2D = $Player

func _on_game_over_area_area_entered(area: Area2D) -> void:
	if area == player:
		call_deferred("change_to_game_over_scene")

func change_to_game_over_scene():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
