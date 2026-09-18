extends TextureButton

@export
var go_to_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(on_pressed)


func on_pressed() -> void:
	get_tree().change_scene_to_packed(preload("uid://d4a8j6atfrqte"))
