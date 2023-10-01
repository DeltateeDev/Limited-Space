extends Area2D

func _on_body_entered(body: Node2D) -> void:
	Globals.spaces_available += 1
	$PopSound.play()
	$Timer.start()

func _process(delta: float) -> void:
	if !$AnimationPlayer.is_playing():
		$AnimationPlayer.play("hover")

func _on_timer_timeout() -> void:
	queue_free()
