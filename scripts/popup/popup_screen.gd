extends Node2D

@onready var screen = $BrowserScreenTmp
var popup_1 = preload("res://scenes/popup/popup_1.tscn")
var nb_popup = 0
var elapsed_time = 0

const FREQ_SEC: float = .01
const MAX_POPUP: int = 500
const MARGIN: int = 50

func _rand_pos(popup_size: Vector2) -> Vector2:
	randomize()
	
	var max_x = screen.position.x
	var max_y = screen.position.y
	var min_x = (-screen.position.x * 2) + popup_size.x + MARGIN
	var min_y = (-screen.position.y * 2) + popup_size.y + MARGIN
	var x = randf_range(min_x, max_x)
	var y = randf_range(min_y, max_y)
	
	return Vector2(x, y)


func _create_popup() -> void:
	var popup = popup_1.instantiate()
	var width = popup.get_child(0).texture.get_size().x
	var height = popup.get_child(0).texture.get_size().y
	popup.position = _rand_pos(Vector2(width, height))
	screen.add_child(popup)
	popup.connect("popup_btn_close", func() : nb_popup -= 1)
	

func _process(delta: float) -> void:
	elapsed_time += delta
	
	if nb_popup < MAX_POPUP and elapsed_time >= FREQ_SEC:
		_create_popup()
		elapsed_time = 0
		nb_popup += 1
