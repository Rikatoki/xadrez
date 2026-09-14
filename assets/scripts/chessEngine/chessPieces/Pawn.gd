extends ChessPiece
class_name Pawn

func get_movements() -> Array[Vector2i]:
	return []

func _to_string() -> String:
	return _get_team_str() + "p"
