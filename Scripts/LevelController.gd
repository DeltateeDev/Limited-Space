extends Node2D

@onready var player: CharacterBody2D = get_parent().get_node("Player")
@onready var door1: Area2D = get_parent().get_node("Door")
@onready var door2: Area2D = get_parent().get_node("Door2")
var player_area: int

func _on_door_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_area = 1
		player.interaction_available = true

func _on_door_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player.interaction_available = false

func _on_door_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_area = 2
		player.interaction_available = true

func _on_door_2_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player.interaction_available = false

func _process(delta: float) -> void:
	if player.interaction_available == true && player_area == 1 && Input.is_action_just_pressed("SPACE"):
		Globals.spaces_available -= 1
		player.position = door2.position
	elif player.interaction_available == true && player_area == 1 && Input.is_action_just_pressed("SPACE"):
		Globals.spaces_available -= 1
		player.position = door1.position
		
