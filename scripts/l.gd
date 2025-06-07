extends Sprite2D

func _ready():
	start_pulse_animation()

func start_pulse_animation():
	
	var pulse_tween = create_tween()

	pulse_tween.set_loops() 


	pulse_tween.tween_property(self, "scale", Vector2(0.1, 0.1), 1.4)

	pulse_tween.tween_property(self, "scale", Vector2(0.2, 0.2), 1.4)
