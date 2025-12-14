extends Node

signal finished

var score : int = 0

func increment_score():
	score += 1

func decrement_score():
	score -= 1

func finished_game():
	finished.emit()
