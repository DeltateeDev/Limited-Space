extends Area2D

func _on_body_entered(body: Node2D) -> void:
	Globals.spaces_available += 1
	self.queue_free()
