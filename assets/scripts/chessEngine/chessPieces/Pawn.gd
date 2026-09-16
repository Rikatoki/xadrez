extends ChessPiece
class_name Pawn

func get_movements() -> Array[Vector2i]:
	return PieceMovements.new(piece_team).pawn_move(piece_coordinate)

func _to_string() -> String:
	return _get_team_str() + "p"
