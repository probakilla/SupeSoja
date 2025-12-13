extends Node2D

signal game_ended

@onready var area = $Area2D/AnimationPlayer
@onready var anim = $"../../CameraAnimation"

var popup_1 = preload("res://scenes/popup/popup_1.tscn")
var nb_popup = 0
var nb_pop = 0
var elapsed_time = 0
var has_closed_one = false

const FREQ_SEC: float = 1
var max_popup: int = 5
const NB_POP_WHEN_ERROR: int = 3
const INIT_POPUPS: int = 3

func _rand_pos() -> Vector2:
	randomize()
	
	var max_x = 730
	var max_y = 380
	var x = randf_range(220, max_x)
	var y = randf_range(70, max_y)
	
	return Vector2(x, y)


func _wrong_choice() -> void:
	anim.play("screen_shake")
	for i in range(NB_POP_WHEN_ERROR):
		_create_popup()


func _close_popup() -> void:
	nb_popup -= 1
	has_closed_one = true


func _create_popup() -> void:
	var popup = popup_1.instantiate()
	var sprite = popup.get_child(0).get_child(0)
	var pos = _rand_pos()
	sprite.position = pos
	area.add_child(popup)
	popup.popup_close.connect(_close_popup)
	popup.popup_accept.connect(_wrong_choice)
	nb_popup += 1
	

func _ready() -> void:
	for _i in range(INIT_POPUPS):
		_create_popup()
		

func _process(delta: float) -> void:
	elapsed_time += delta
	
	if nb_pop < max_popup and elapsed_time >= FREQ_SEC:
		_create_popup()
		elapsed_time = 0
		nb_pop += 1
		
	if has_closed_one and nb_popup == 0:
		game_ended.emit()
		queue_free()
