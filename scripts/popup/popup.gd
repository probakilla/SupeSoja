extends Node2D


@onready var close_btn = $CloseBtn
@onready var popup = $"."

func _killme() -> void:
	popup.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	close_btn.connect("pressed", _killme)
