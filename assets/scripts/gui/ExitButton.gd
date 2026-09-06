extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("pressed", _on_pressed_button)


func _on_pressed_button() -> void:
	get_tree().quit()
