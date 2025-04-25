extends CharacterBody2D

enum EnemyState {
	andando,
	atacando,
	morto,
}

const SPEED = 10.0
var direction = 1

var status: EnemyState

func _ready() -> void:
	ir_para_andando()

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox: Area2D = $Hitbox
@onready var fall_detect: RayCast2D = $FallDetect
@onready var player_detect: RayCast2D = $PlayerDetect

func _physics_process(delta: float) -> void:

	match status:
		EnemyState.andando:
			andando()
		EnemyState.atacando:
			atacando()
		EnemyState.morto:
			morto()

	move_and_slide()

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = SPEED * direction

func ir_para_andando():
	status = EnemyState.andando
	anim.play("walking")

func andando():
	if !fall_detect.is_colliding():
		direction *= -1
		scale.x *= -1

	velocity.x = SPEED * direction

	if player_detect.is_colliding():
		ir_para_atacando()

func ir_para_atacando():
	status = EnemyState.atacando
	direction = 0
	anim.play("atack")

func atacando():
	pass

func ir_para_morto():
	status = EnemyState.morto
	direction = 0
	anim.play("dead")
	hitbox.queue_free()

func morto():
	pass

func take_damage():
	ir_para_morto()
