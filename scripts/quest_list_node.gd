extends Node2D
@onready var imprimer_checkBox: CheckBox = $Area2D/Sprite2D/Control/VBoxContainer/QueteImprimer
@onready var recherche_checkBox: CheckBox = $Area2D/Sprite2D/Control/VBoxContainer/QueteAntiLLM
@onready var postit_sprite = $Area2D/Sprite2D
@onready var game_manager = %GameManager

var mail_checked = false
var recherche_checked = false

var init_scale = null
const ZOOM_FACTOR: float = 1

func on_imprimer_quest_toggle() -> void:
	if(mail_checked == true):
		imprimer_checkBox.button_pressed = false
		mail_checked = false
		return
	else:
		imprimer_checkBox.button_pressed = true
		mail_checked = true

func _on_recherche_quest_toggle() -> void:
	if(recherche_checked == true):
		recherche_checkBox.button_pressed = false
		recherche_checked = false
		return
	else:
		recherche_checkBox.button_pressed = true
		recherche_checked = true


func _ready() -> void:
	self.init_scale = self.postit_sprite.scale


func _on_area_2d_mouse_entered() -> void:
	if not game_manager.game_started:
		return
	var new_scale: Vector2 = Vector2()
	new_scale.x = self.init_scale.x + self.ZOOM_FACTOR
	new_scale.y = self.init_scale.y + self.ZOOM_FACTOR
	self.postit_sprite.scale = new_scale


func _on_area_2d_mouse_exited() -> void:
	self.postit_sprite.scale = self.init_scale
