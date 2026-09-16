extends ChessPiece
class_name Queen

func get_movements() -> Array[Vector2i]:
	var moves: Array[Vector2i] = []
	var pv: PieceMovements = PieceMovements.new(piece_team)
	moves.append_array(pv.around_move(piece_coordinate))
	moves.append_array(pv.cross_move(piece_coordinate))
	moves.append_array(pv.diagonal_move(piece_coordinate))
	return moves.filter(func (coord: Vector2i): return coord not in moves)

func _to_string() -> String:
	return _get_team_str() + "q"
