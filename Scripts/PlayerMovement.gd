extends CharacterBody2D
signal nospaces

const UP_DIRECTION = Vector2.UP

@export var speed: float = 300.0
@export var jump_strength: float = 750.0
@export var gravity: float = 2000.0

var jump_buffered: bool = false
var jump_available: bool = false
var interaction_available: bool = false

func _ready() -> void:
	interaction_available = false

func _process(delta: float) -> void:
	if !interaction_available:
		$SpeechBubble.hide()
	else:
		$SpeechBubble.show()

func _physics_process(delta: float) -> void:
	var horizontal_direction = (Input.get_action_strength("RIGHT") - Input.get_action_strength("LEFT"))
	
	velocity.x = horizontal_direction * speed
	velocity.y += gravity * delta
	
	#player states
	var is_falling := velocity.y > 0.0 && !is_on_floor()
	var is_jumping := (Input.is_action_just_pressed("SPACE") && is_on_floor()) || (jump_buffered && is_on_floor())
	var is_jump_cancelled := Input.is_action_just_released("SPACE") && velocity.y < 0.0
	
	if !is_on_floor() && Input.is_action_just_pressed("SPACE"):
		jump_buffered = true
	if is_on_floor() && !interaction_available:
		jump_available = true
	elif !is_on_floor() && $JumpAvailability.is_stopped():
		$JumpAvailability.start()
	
	if Globals.spaces_available < 1:
		jump_available = false
		
	if Globals.spaces_available < 1 && Input.is_action_just_pressed("SPACE"):
		ErrorAnimation()
		
	if Input.is_action_just_pressed("SPACE") && jump_available && !interaction_available:
		velocity.y = -jump_strength
		jump_available = false
		Globals.spaces_available -= 1
	elif is_jump_cancelled:
		velocity.y = 0.0
	
	if Input.is_action_just_pressed("SPACE"):
		$JumpTimer.start()

	move_and_slide()

func _on_jump_timer_timeout() -> void:
	jump_buffered = false

func _on_jump_availability_timeout() -> void:
	jump_available = false

func ErrorAnimation() -> void:
	emit_signal("nospaces")
	velocity.y = -75
	pass
