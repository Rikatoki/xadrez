extends ChessPiece
class_name Bishop

func get_movements() -> Array[Vector2i]:
	return PieceMovements.new(piece_team).diagonal_move(piece_coordinate)

func _to_string() -> String:
	return _get_team_str() + "b"
