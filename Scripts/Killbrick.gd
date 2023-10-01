extends Area2D

@export var level: String

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_parent().get_node("Control").get_node("Transition").get_node("AnimationPlayer").play("fade_in")
		$Timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file(level)
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("RESET"):
		get_parent().get_node("Control").get_node("Transition").get_node("AnimationPlayer").play("fade_in")
		$Timer.start()
