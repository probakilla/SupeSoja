extends CanvasLayer

signal quit

func _on_button_pressed() -> void:
	get_tree().quit()
