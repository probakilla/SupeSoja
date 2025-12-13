extends Node2D

signal popup_btn_close
signal popup_btn_accept

@onready var close_btn = $AnimationPlayer/PopupTemplate/CloseBtn
@onready var accept_btn = $AnimationPlayer/PopupTemplate/AcceptBtn

func _on_close() -> void:
	emit_signal("popup_btn_close")
	queue_free()

func _ready() -> void:
	close_btn.connect("pressed", _on_close)
	accept_btn.connect("pressed", func() : emit_signal("popup_btn_accept"))
