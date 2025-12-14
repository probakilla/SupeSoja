extends Node

signal finished
@onready var popup = $Main/DesktopAnimator/RechercheMoral
var score : int = 0

func increment_score():
	score += 1

func decrement_score():
	score -= 1

func finished_game():
	popup.visible = true
	finished.emit()
	
