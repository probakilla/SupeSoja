extends Button

signal popup_btn_accept

func _pressed() -> void:
	popup_btn_accept.emit()
