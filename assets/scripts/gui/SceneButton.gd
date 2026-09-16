extends Button

@export
var go_to: PackedScene

var _scene_loaded: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not go_to:
		return push_error("Nenhuma cena adicionada.")
	_scene_loaded = go_to.instantiate()
	connect("pressed", _on_button_pressed)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_node(_scene_loaded)
