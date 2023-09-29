extends CharacterBody2D

const UP_DIRECTION = Vector2.UP

@export var speed: float = 300.0
@export var jump_strength: float = 750.0
@export var gravity: float = 2000.0

func _physics_process(delta: float) -> void:
	var horizontal_direction = (Input.get_action_strength("RIGHT") - Input.get_action_strength("LEFT"))
	
	velocity.x = horizontal_direction * speed
	velocity.y += gravity * delta
	
	#player states
	var is_falling := velocity.y > 0.0 && !is_on_floor()
	var is_jumping := Input.is_action_just_pressed("SPACE") && is_on_floor()
	var is_jump_cancelled := Input.is_action_just_released("SPACE") && velocity.y < 0.0
	
	if is_jumping:
		velocity.y = -jump_strength
	elif is_jump_cancelled:
		velocity.y = 0.0
	
	move_and_slide()
