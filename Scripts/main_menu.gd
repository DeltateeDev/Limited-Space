extends Node2D

func _ready() -> void:
	$Control/Transition/AnimationPlayer.play("fade_out")

func _process(delta: float) -> void:
	if !$AnimationPlayer.is_playing():
		$AnimationPlayer.play("Menu")
	
	if Input.is_action_just_pressed("SPACE"):
		$Control/Transition/AnimationPlayer.play("fade_in")
		$Timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Objects/level_1.tscn")
