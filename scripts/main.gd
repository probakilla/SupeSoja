extends Area2D

@onready var game_manager = %GameManager

@onready var start_btn = $DesktopAnimator/StartBtn/Button
@onready var button_background = $DesktopAnimator/StartBtn
@onready var desktop_anim = $DesktopAnimator
@onready var mail_btn = $DesktopAnimator/Desktop/Background/Mails/MailBtn
@onready var button_animator = $ButtonAnimator
@onready var todo_list = $DesktopAnimator/Desktop/QuestList
@onready var flowerpot = $DesktopAnimator/Desktop/Flowerpot

var flowerpot_lvl0 = preload("res://assets/images/flowerpot.png")
var flowerpot_lvl1 = preload("res://assets/images/Plante_niveau_1.png")
var flowerpot_lvl2 = preload("res://assets/images/Plante_niveau_2.png")
var flowerpot_lvl3 = preload("res://assets/images/plante_niveau_3.png")


var completion = {
	"email": false
}

var popup_screen = preload("res://scenes/popup/popup_screen.tscn")

func _refresh_flowerpot() -> void:
	var nb_completed = 0
	
	for v in completion.values():
		if v:
			nb_completed += 1
	
	if nb_completed == 0:
		flowerpot.texture = flowerpot_lvl0
	if nb_completed == 1:
		flowerpot.texture = flowerpot_lvl1
	if nb_completed == 2:
		flowerpot.texture = flowerpot_lvl2
	if nb_completed == 3:
		flowerpot.texture = flowerpot_lvl3
		

func _start() -> void:
	start_btn.queue_free()
	button_background.queue_free()
	desktop_anim.play("zoom")
	await desktop_anim.animation_finished
	desktop_anim.play("twinkle")
	mail_btn.disabled = false
	game_manager.game_started = true


func _on_popup_game_finished() -> void:
	todo_list.on_imprimer_quest_toggle()
	completion["email"] = true
	_refresh_flowerpot()

func _start_popup_game() -> void:
	if game_manager.popup_game_started:
		return
	
	game_manager.popup_game_started = true
	button_animator.play("click")
	var popup_minigame = popup_screen.instantiate()
	add_child(popup_minigame)
	popup_minigame.game_ended.connect(_on_popup_game_finished)
	game_manager.popup_game_started = false


func _ready() -> void:
	mail_btn.disabled = true
	start_btn.start_game.connect(_start)
	mail_btn.start_mail_game.connect(_start_popup_game)
