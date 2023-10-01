extends Sprite2D

func _ready() -> void:
	$AnimationPlayer.stop()
	$AnimationPlayer.play("rotate")
	$Timer.start()
func _on_timer_timeout() -> void:
	$AnimationPlayer.stop()
	$AnimationPlayer.play("rotate")
	$Timer.start()
