extends Node2D

signal popup_accept
signal popup_close

@onready var close_btn = $AnimationPlayer/Area2D/CloseBtn
@onready var accept_btn = $AnimationPlayer/Area2D/AcceptBtn

func _on_close() -> void:
	popup_close.emit()
	queue_free()
	
func _on_accept() -> void:
	popup_accept.emit()
	queue_free()

func _ready() -> void:
	close_btn.popup_btn_close.connect(_on_close)
	accept_btn.popup_btn_accept.connect(_on_accept)
