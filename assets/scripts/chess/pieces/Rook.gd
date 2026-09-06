extends ChessPiece
class_name Rook

func interact_square(_square: ChessSquare) -> void:
	if _square.has_piece():
		Chessboard.remove_piece(_square.piece)
	Chessboard.move_piece(self, _square)
	return

func _can_move(_square: ChessSquare) -> bool:
	var has_ally: bool = false
	if _square.has_piece():
		has_ally = is_same_side(_square.piece)
	return _square != square and (square.coordinate.x == _square.coordinate.x or square.coordinate.y == _square.coordinate.y) and not has_ally
