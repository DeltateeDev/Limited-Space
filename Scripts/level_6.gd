extends Node2D

func _ready() -> void:
	Globals.spaces_available = 4
	$Control/Transition/AnimationPlayer.play("fade_out")
