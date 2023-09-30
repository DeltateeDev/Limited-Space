extends Control

@onready var player: CharacterBody2D = get_parent().get_node("Player")

func _ready() -> void:
	player.connect("nospaces", Callable(self,"_on_nospaces_triggered"))
	
func _on_nospaces_triggered():
	if $AnimationPlayer.is_playing():
		$AnimationPlayer.stop()
		$AnimationPlayer.play("Shake")
	else:
		$AnimationPlayer.play("Shake")
