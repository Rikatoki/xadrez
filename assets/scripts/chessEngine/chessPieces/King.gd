extends ChessPiece
class_name King

func get_movements() -> Array[Vector2i]:
	var moves: Array[Vector2i] = PieceMovements.new(piece_team).around_move(piece_coordinate)
	return moves

func roque_moves() -> Array[Vector2i]:
	var moves: Array[Vector2i]
	return moves

func _to_string() -> String:
	return _get_team_str() + "k"
