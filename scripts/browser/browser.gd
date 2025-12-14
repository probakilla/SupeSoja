extends Node

var point : int = 0
@onready var browser_buton = $Browser/Button
@onready var browser = $Browser
@onready var block = $Browser/Block
@onready var shearsh_bar = $Browser/SearchBar
var browser_choice = preload("res://scenes/browser/browser_choice.tscn")
@onready var text_wrong = $WrongChoice
@onready var text_good = $GoodChoice

func _button_pressed():
	text_wrong.position = Vector2(-1200, 0)
	text_wrong.visible = false
	text_good.position = Vector2(-1200, 0)
	text_good.visible = false
	var scene = browser_choice.instantiate()
	scene.position = Vector2(-600, -150)
	browser.add_child(scene)

	browser_buton.visible = false
	block.visible = false
	shearsh_bar.visible = false

func _ready() -> void:
	browser_buton.connect("pressed", _button_pressed)
	pass
