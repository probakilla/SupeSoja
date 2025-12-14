extends Button

signal understand

func _pressed() -> void:
	understand.emit()
