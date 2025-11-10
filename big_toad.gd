extends CharacterBody2D

var SPEED = -25.0
var facing_right = false
var is_alive = true
@onready var animated_sprited_2d = $AnimatedSprite2D

func _ready() -> void:
	add_to_group("Enemy")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
	
	if !$RayCast2D.is_colliding() && is_on_floor():
		flip()
	
	velocity.x = SPEED

	update_animation()
	move_and_slide()
	
func update_animation():
	animated_sprited_2d.play("hop")

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		is_alive = false
		#queue_free()
		call_deferred("queue_free")

func flip():
	facing_right = !facing_right
	scale.x = abs(scale.x) * -1
	if facing_right:
		SPEED = abs(SPEED)
	else:
		SPEED = abs(SPEED) * -1
