extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

const speed = 70.0
const jumpVelocity = -300.0

@export var maxJump = 2
var jumpCount = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumpCount = 0
		if velocity.x != 0:
			anim.play("running")
		else:
			anim.play("idle")
	# Handle jump.
	if Input.is_action_just_pressed("jump") and jumpCount < maxJump:
		velocity.y = jumpVelocity
		jumpCount += 1
		anim.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	if velocity.x > 0:
		anim.flip_h = false
	elif velocity.x < 0:
		anim.flip_h = true

	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group('Death Zone'):
		get_tree().reload_current_scene()
	elif area.is_in_group('End Level'):
		get_tree().change_scene_to_file("res://scenes/tropic.tscn")
