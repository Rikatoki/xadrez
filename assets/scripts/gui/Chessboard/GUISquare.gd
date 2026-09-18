extends Node2D
class_name GUISquare

var coordinate: Vector2i

var piece: ChessPiece

signal mouse_clicked(node: GUISquare)

var _mouse_over: bool = false

# Called when the node enters the scene tree for the first time.
func _process(_delta: float) -> void:
	if _mouse_over:
		CustomMouse.interactable_mode = _mouse_over


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if _mouse_over and event.button_index == MOUSE_BUTTON_LEFT:
			mouse_clicked.emit(self)


func setup(coord: Vector2i, _piece: ChessPiece) -> GUISquare:
	coordinate = coord
	piece = _piece
	if piece:
		for child in get_children():
			if child is Sprite2D:
				var texture: CompressedTexture2D = load("res://assets/sprites/16x32 pieces/{0}.png".format([piece]))
				child.texture = texture
	return self


func _on_area_2d_mouse_entered() -> void:
	_mouse_over = true


func _on_area_2d_mouse_exited() -> void:
	_mouse_over = false
