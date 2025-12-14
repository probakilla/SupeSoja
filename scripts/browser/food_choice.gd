extends Node

@onready var buttons = $ChoiceButon1
@onready var question = $Label
@onready var button_one = $ChoiceButon1/Button
@onready var button_two = $ChoiceButon1/ChoiceButon2/Button
@onready var button_three = $ChoiceButon1/ChoiceButon2/ChoiceButon3/Button
@onready var browser = $"../../Browser"
@onready var text_wrong = $"../../Browser/WrongChoice"
@onready var text_good = $"../../Browser/GoodChoice"
@onready var text = $"../../Browser/ScoreLabel"
@onready var understand = $"../../Browser/Understand"
@onready var understand_btn = $"../../Browser/Understand/ButtonUnderstand"
@onready var explanation = $"../../Browser/Explanation"

var explanation_text = "Le local et le bio doivent être mis en avant par rapport aux produits déjà préparés et\nindustriels. Qualité nutrionnelle et sanitaire assurée ! Impact RSE positif et impact\nenvironnemental réduit, un bon combo."

func _understand() -> void:
	text_good.visible = false
	understand.visible = false
	text_wrong.visible = false
	explanation.visible = false
	_button_pressed()
	
func _button_pressed():
	buttons.visible = false
	question.visible = false
	understand_btn.understand.disconnect(_understand)
	BrowserGameManager.finished.emit()

func _goodchoice_pressed() :
	text_good.visible = true
	buttons.visible = false
	question.visible = false
	text_good.visible = true
	understand.visible = true
	explanation.visible = true
	BrowserGameManager.increment_score()


func _wrongchoice_pressed() :
	text_wrong.visible = true
	buttons.visible = false
	question.visible = false
	text_wrong.visible = true
	understand.visible = true
	explanation.visible = true
	BrowserGameManager.decrement_score()
	
	
func _ready() -> void:
	button_one.connect("pressed", _goodchoice_pressed)
	button_two.connect("pressed", _wrongchoice_pressed)
	button_three.connect("pressed", _wrongchoice_pressed)
	understand_btn.understand.connect(_understand)
	explanation.text = explanation_text
