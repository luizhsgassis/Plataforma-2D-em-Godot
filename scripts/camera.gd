extends Camera2D
var player: Node2D

func _ready() -> void:
	var players = get_tree().get_nodes_in_group("Player")
	if players.size() > 0:
		player = players[0]
	else:
		push_error("Não foi possível encontrar o player")

func _process(_delta: float) -> void:
	if player:
		position = lerp(position, player.position, 0.1)
