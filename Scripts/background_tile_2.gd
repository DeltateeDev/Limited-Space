extends Sprite2D

func _on_timer_timeout() -> void:
	$AnimationPlayer.stop()
	$AnimationPlayer.play("rotate")
	$Timer.start()

func _on_first_second_timeout() -> void:
	$AnimationPlayer.stop()
	$AnimationPlayer.play("rotate")
	$Timer.start()
