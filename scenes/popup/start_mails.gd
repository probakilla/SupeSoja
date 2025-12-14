extends Button

signal start_mail_game

func _pressed() -> void:
	start_mail_game.emit()
