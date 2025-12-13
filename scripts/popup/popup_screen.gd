extends Node2D

@onready var screen = $BrowserScreenTmp
var popup_1 = preload("res://scenes/popup/popup_1.tscn")
var nb_popup = 0
var elapsed_time = 0
var zebi = 0

const FREQ_SEC: float = 1
const MAX_POPUP: int = 100
const CHAISPAS: int = 3

func _rand_pos(popup_size: Vector2) -> Vector2:
	randomize()
	
	var max_x = screen.position.x * 1.5
	var max_y = screen.position.y * 1.5
	var x = randf_range(100, max_x)
	var y = randf_range(50, max_y)
	
	return Vector2(x, y)


func _wrong_choice() -> void:
	for i in range(CHAISPAS):
		_create_popup()

func _create_popup() -> void:
	var popup = popup_1.instantiate()
	var sprite = popup.get_child(0).get_child(0)
	var width = sprite.texture.get_size().x
	var height = sprite.texture.get_size().y
	sprite.position = _rand_pos(Vector2(width, height))
	sprite.z_index = zebi
	add_child(popup)
	popup.connect("popup_btn_close", func() : nb_popup -= 1)
	popup.connect("popup_btn_accept", _wrong_choice)
	

func _process(delta: float) -> void:
	elapsed_time += delta
	
	if nb_popup < MAX_POPUP and elapsed_time >= FREQ_SEC:
		_create_popup()
		elapsed_time = 0
		nb_popup += 1
