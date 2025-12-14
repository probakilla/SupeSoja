extends Area2D

@onready var game_manager = %GameManager

@onready var start_btn = $DesktopAnimator/StartBtn/Button
@onready var button_background = $DesktopAnimator/StartBtn
@onready var desktop_anim = $DesktopAnimator
@onready var mail_btn = $DesktopAnimator/Desktop/Background/Mails/MailBtn
@onready var internet_btn = $DesktopAnimator/Desktop/Background/Browser/InternetBtn
@onready var button_animator = $ButtonAnimator
@onready var todo_list = $DesktopAnimator/Desktop/QuestList
@onready var flowerpot = $DesktopAnimator/Desktop/Flowerpot
@onready var screen = $DesktopAnimator/Desktop/Screen
@onready var moralpopup = $DesktopAnimator/PopUpMoral


var flowerpot_lvl0 = preload("res://assets/images/flowerpot.png")
var flowerpot_lvl1 = preload("res://assets/images/Plante_niveau_1.png")
var flowerpot_lvl2 = preload("res://assets/images/Plante_niveau_2.png")
var flowerpot_lvl3 = preload("res://assets/images/plante_niveau_3.png")


var completion = {
	"email": false,
	"internat": false
}

var popup_screen = preload("res://scenes/popup/popup_screen.tscn")
var internet_screen = preload("res://scenes/browser/browser_s.tscn")
var internet_minigame = null

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
		flowerpot.texture = flowerpot_lvl3
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
	game_manager.popup_game_started = false
	todo_list.on_imprimer_quest_toggle()
	completion["email"] = true
	_refresh_flowerpot()
	moralpopup.visible = true

	

func _on_internet_game_finished() -> void:
	if BrowserGameManager.score > 0:
		game_manager.internet_game_started = false
		completion["internet"] = true
		todo_list.on_recherche_quest_toggle()
		_refresh_flowerpot()
	
	if internet_minigame:
		internet_minigame.queue_free()

func _start_popup_game() -> void:
	if game_manager.popup_game_started:
		return
	
	game_manager.popup_game_started = true
	button_animator.play("click")
	var popup_minigame = popup_screen.instantiate()
	add_child(popup_minigame)
	popup_minigame.game_ended.connect(_on_popup_game_finished)


func _start_internet_game() -> void:
	if not game_manager.game_started:
		return
	if game_manager.internet_game_started:
		return

	game_manager.popup_game_started = true
	button_animator.play("click_internet")
	internet_minigame = internet_screen.instantiate()
	internet_minigame.scale.x += .42
	internet_minigame.scale.y += .52
	internet_minigame.position.x += 115
	internet_minigame.position.y -= 80
	internet_minigame.rotation = -.018
	screen.add_child(internet_minigame)
	BrowserGameManager.finished.connect(_on_internet_game_finished)
	

func _ready() -> void:
	mail_btn.disabled = true
	start_btn.start_game.connect(_start)
	mail_btn.start_mail_game.connect(_start_popup_game)
	internet_btn.start_internet.connect(_start_internet_game)
