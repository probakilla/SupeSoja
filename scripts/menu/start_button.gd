extends Button

signal start_game

func _pressed() -> void:
	start_game.emit()
