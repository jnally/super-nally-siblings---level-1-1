extends CharacterBody2D

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

const SPEED = 25.0
var is_alive = true

@onready var animated_sprited_2d = $AnimatedSprite2D

func _ready() -> void:
	add_to_group("Enemy")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta
	velocity.y += get_gravity().y * delta
	
	velocity.x = -SPEED
	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
	#	velocity.x = direction * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)

	update_animation()
	move_and_slide()
	
func update_animation():
	animated_sprited_2d.play("hop")

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		is_alive = false
		#queue_free()
		call_deferred("queue_free")
