extends RichTextLabel

func _process(delta: float) -> void:
	self.text = "x " + str(Globals.spaces_available)
	pass
