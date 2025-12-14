extends Button

signal popup_btn_close

func _pressed() -> void:
	popup_btn_close.emit()
