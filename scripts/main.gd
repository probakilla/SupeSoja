extends Area2D

@onready var start_btn = $CollisionShape2D/DesktopAnimator/Desktop/Button
@onready var desktop_anim = $CollisionShape2D/DesktopAnimator

func _start() -> void:
	start_btn.queue_free()
	desktop_anim.play("zoom")
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_btn.start_game.connect(_start)
