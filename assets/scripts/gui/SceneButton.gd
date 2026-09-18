extends Button

@export
var go_to: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not go_to:
		return push_error("Nenhuma cena adicionada.")
	connect("pressed", _on_button_pressed)

func _on_button_pressed() -> void:
	var _node_loaded: Node = go_to.instantiate()

	get_tree().change_scene_to_file("uid://bjyi5qvx353pb")
