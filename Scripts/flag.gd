extends Area2D

@export var next_level: String

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		BackgroundMusic.get_node("VictorySound").play()
		get_parent().get_node("Control").get_node("Transition").get_node("AnimationPlayer").play("fade_in")
		$Timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file(next_level)
