extends Button

signal start_internet


func _pressed() -> void:
	start_internet.emit()
