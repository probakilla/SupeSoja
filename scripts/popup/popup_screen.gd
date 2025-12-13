extends Node2D

@onready var area = $AnimationPlayer/PopupArea
@onready var anim = $"../CameraAnimation"

var popup_1 = preload("res://scenes/popup/popup_1.tscn")
var nb_popup = 0
var nb_closed_popup = 0
var elapsed_time = 0

var finished = false

const FREQ_SEC: float = 1
var max_popup: int = 20
const NB_POP_WHEN_ERROR: int = 3

func _rand_pos() -> Vector2:
	randomize()
	
	var max_x = 850
	var max_y = 550
	var x = randf_range(100, max_x)
	var y = randf_range(50, max_y)
	
	return Vector2(x, y)


func _wrong_choice() -> void:
	anim.play("screen_shake")
	for i in range(NB_POP_WHEN_ERROR):
		_create_popup()
	max_popup += NB_POP_WHEN_ERROR - 1


func _close_popup() -> void:
	nb_popup -= 1
	nb_closed_popup += 1

func _create_popup() -> void:
	var popup = popup_1.instantiate()
	var sprite = popup.get_child(0).get_child(0)
	var pos = _rand_pos()
	sprite.position = pos
	area.add_child(popup)
	popup.popup_close.connect(_close_popup)
	popup.popup_accept.connect(_wrong_choice)
	

func _process(delta: float) -> void:
	elapsed_time += delta
	
	if finished:
		print("GG mec")
		queue_free()
	
	if nb_popup < max_popup and elapsed_time >= FREQ_SEC:
		_create_popup()
		elapsed_time = 0
		nb_popup += 1
		
	if nb_closed_popup == max_popup:
		finished = true
