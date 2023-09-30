extends Area2D

@onready var player: CharacterBody2D = get_parent().get_node("Player")
@export var destination: Area2D
var door_state: bool = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		door_state = true
		player.jump_available = false
		player.interaction_available = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player.interaction_available = false
		door_state = false
		if player.is_on_floor():
			player.jump_available = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("SPACE") && door_state && player.interaction_available && Globals.spaces_available > 0:
		player.position.x = destination.position.x
		player.position.y = destination.position.y - 10
		door_state = false
		Globals.spaces_available -= 1
		
	if player.interaction_available:
		player.jump_available = false
