extends Button

@onready var accessibilityMenu = $"../../CanvasLayer"
func _pressed() -> void:
	self.accessibilityMenu.visible = true
	
