extends ChessPiece
class_name Rook

func get_movements() -> Array[Vector2i]:
	return []

func _to_string() -> String:
	return _get_team_str() + "r"
