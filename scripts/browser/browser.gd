extends Node

var point : int = 0
@onready var browser_buton = $Area2D/Browser/Button
@onready var browser = $Area2D/Browser
@onready var block = $Area2D/Browser/Block
@onready var shearsh_bar = $Area2D/Browser/SearchBar
var browser_choice = preload("res://scenes/browser/browser_choice.tscn")
@onready var text_wrong = $Area2D/Browser/WrongChoice
@onready var text_good = $Area2D/Browser/GoodChoice
@onready var text_score = $Area2D/Browser/ScoreLabel

func _button_pressed():
	text_wrong.visible = false
	text_good.visible = false
	var scene = browser_choice.instantiate()
	scene.position = Vector2(-600, -150)
	browser.add_child(scene)

	browser_buton.visible = false
	block.visible = false
	shearsh_bar.visible = false

func _ready() -> void:
	browser_buton.connect("pressed", _button_pressed)


func _process(_delta: float) -> void:
	var text = "Score : %s"
	var score = text%BrowserGameManager.score
	text_score.text = score
