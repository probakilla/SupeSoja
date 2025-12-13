extends Node2D
@onready var imprimer_checkBox: CheckBox = $Control/VBoxContainer/QueteImprimer
@onready var recherche_checkBox: CheckBox = $Control/VBoxContainer/QueteAntiLLM

var mail_checked = false
var recherche_checked = false

func _on_imprimer_quest_toggle() -> void:
	if(mail_checked == true):
		imprimer_checkBox.button_pressed = false
		mail_checked = false
		print("Imprimer Quest Failed")
		return
	else:
		imprimer_checkBox.button_pressed = true
		mail_checked = true
		print("Imprimer Quest Complete")

func _on_recherche_quest_toggle() -> void:
	if(recherche_checked == true):
		recherche_checkBox.button_pressed = false
		recherche_checked = false
		print("Recherche Quest unsuccess")
		return
	else:
		recherche_checkBox.button_pressed = true
		recherche_checked = true
		print("Recherche Quest Complete")
