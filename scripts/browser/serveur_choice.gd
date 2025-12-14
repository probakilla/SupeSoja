extends Node

@onready var buttons = $ChoiceButon1
@onready var question = $Label
@onready var button_one = $ChoiceButon1/Button
@onready var button_two = $ChoiceButon1/ChoiceButon2/Button
@onready var button_three = $ChoiceButon1/ChoiceButon2/ChoiceButon3/Button
@onready var browser = $"../../Browser"
@onready var text_wrong = $"../../Browser/WrongChoice"
@onready var text_good = $"../../Browser/GoodChoice"
var action_choice = preload("res://scenes/browser/food_choice.tscn")

func _button_pressed():
	var scene = action_choice.instantiate()
	scene.position = Vector2(-600, -150)
	button_one.visible = false
	question.visible = false
	browser.add_child(scene)

func _goodchoice_pressed() :
	text_good.visible = true
	buttons.visible = false
	question.visible = false
	await get_tree().create_timer(1.0).timeout
	text_good.visible = false
	BrowserGameManager.increment_score()
	_button_pressed()

func _wrongchoice_pressed() :
	text_wrong.visible = true
	buttons.visible = false
	question.visible = false
	await get_tree().create_timer(1.0).timeout
	text_wrong.visible = false
	BrowserGameManager.decrement_score()
	_button_pressed()

func _ready() -> void:
	button_one.connect("pressed", _wrongchoice_pressed)
	button_two.connect("pressed", _goodchoice_pressed)
	button_three.connect("pressed", _goodchoice_pressed)
	pass
